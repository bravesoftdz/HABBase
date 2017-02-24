unit HabitatSource;

interface

uses WebSource, Source, Classes, SysUtils, Miscellaneous;

type
  THabitatSource = class(TWebSource)
  private
    { Private declarations }
    procedure ProcessResponse(Response: String);
  protected
    { Protected declarations }
    procedure Execute; override;
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
  end;

implementation

constructor THabitatSource.Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
begin
    inherited Create(ID, Callback, Settings);
end;

procedure THabitatSource.Execute;
var
    Response: String;
begin
    while not Terminated do begin
        Response := GetURL('http://spacenear.us/tracker/datanew.php?mode=Position&type=positions&format=json&max_positions=10&vehicles=PYSKY2');

        if Response <> '' then begin
            ProcessResponse(Response);
        end;
        Sleep(10000);
    end;
end;

procedure THabitatSource.ProcessResponse(Response: String);
var
    Lines: TStringList;
    Line, TimeStamp: String;
    i: Integer;
    Position: THABPosition;
begin
    // Cycle through position
    Lines := TStringList.Create;

    Lines.Text := Response;
    (*
    {"positions": {"position": [
    {"position_id":"11479752","mission_id":"0","vehicle":"PYSKY2","server_time":"2017-02-24 16:50:16.563491","gps_time":"2017-02-24 16:50:13","gps_lat":"51.95023","gps_lon":"-2.5445","gps_alt":"163","gps_heading":"","gps_speed":"","picture":"","temp_inside":"","data":{"satellites":12,"temperature_internal":"37.7"},"callsign":"M0RPI\/5","sequence":"42"},
    {"position_id":"11479743","mission_id":"0","vehicle":"PYSKY2","server_time":"2017-02-24 16:50:03.519754","gps_time":"2017-02-24 16:50:00","gps_lat":"51.95023","gps_lon":"-2.54448","gps_alt":"165","gps_heading":"","gps_speed":"","picture":"","temp_inside":"","data":{"satellites":12,"temperature_internal":"37.7"},"callsign":"M0RPI\/5","sequence":"33"}
    ]},
    "ssdv": {"CHANGE": "11",
    "DF9IK": "30"}}
    *)

    for i := 0 to Lines.Count-1 do begin
        Line := Lines.Strings[i];
        if GetJSONInteger(Line, 'position_id') > 0 then begin
            FillChar(Position, SizeOf(Position), 0);
            try
                Position.PayloadID := GetJSONString(Line, 'vehicle');

                TimeStamp := GetJSONString(Line, 'gps_time');
                if Length(TimeStamp) = 19 then begin
                    Position.TimeStamp := EncodeTime(StrToIntDef(Copy(TimeStamp, 12, 2), 0),
                                                     StrToIntDef(Copy(TimeStamp, 15, 2), 0),
                                                     StrToIntDef(Copy(TimeStamp, 18, 2), 0),
                                                     0);
                end;
                Position.Latitude := GetJSONFloat(Line, 'gps_lat');
                Position.Longitude := GetJSONFloat(Line, 'gps_lon');
                Position.Altitude := GetJSONFloat(Line, 'gps_alt');
                Position.InUse := True;
                SyncCallback(SourceID, True, Line, Position);
            except
                //
            end;
        end;
    end;

    Lines.Free;
end;


end.

