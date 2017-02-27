unit LoRaSerialSource;

interface

uses SerialSource, Source, Classes, SysUtils, VaClasses, VaComm, Miscellaneous, HABTypes;

type
  TLoRaSerialSource = class(TSerialSource)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure ProcessLine(Line: String); override;
  public
    { Public declarations }
  end;

implementation


procedure TLoRaSerialSource.ProcessLine(Line: String);
var
    Command: String;
    Position: THABPosition;
begin
    FillChar(Position, SizeOf(Position), 0);
    Position.SignalValues := TSignalValues.Create;

    Command := UpperCase(GetString(Line, '='));

    if Command = 'CURRENTRSSI' then begin
        Position.SignalValues.Add('CurrentRSSI', StrToIntDef(Line, 0));
        SyncCallback(SourceID, True, Line, Position);
    end else if Command = 'HEX' then begin
        // SSDV
        Line := '55' + Line;
        inherited;
    end else if Command = 'FREQERR' then begin
        Position.SignalValues.Add('FrequencyError', StrToFloat(Line));
        SyncCallback(SourceID, True, '', Position);
    end else if Command = 'PACKETRSSI' then begin
        Position.SignalValues.Add('PacketRSSI', StrToIntDef(Line, 0));
        SyncCallback(SourceID, True, '', Position);
    end else if Command = 'PACKETSNR' then begin
        Position.SignalValues.Add('PacketSNR', StrToIntDef(Line, 0));
        SyncCallback(SourceID, True, '', Position);
    end else if Command = 'MESSAGE' then begin
        inherited;
    end;
end;

end.
