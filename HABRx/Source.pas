unit Source;

interface

uses Classes, SysUtils, Generics.Collections;

type
  TSettings = TDictionary<String, Variant>;

type
  TExtraFields = TDictionary<String, Variant>;

type
  TSignalValues = TDictionary<String, Variant>;

type
  THABPosition = record
    InUse:          Boolean;
    Channel:        Integer;
    PayloadID:      String;
    Counter:        Integer;
    TimeStamp:      TDateTime;
    Latitude:       Double;
    Longitude:      Double;
    Altitude:       Double;
    SignalValues:   TSignalValues;
    ExtraFields:    TExtraFields;
  end;

type
  TSourcePositionCallback = procedure(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition) of object;

type
  TSource = class(TThread)
  private
    { Private declarations }
  protected
    { Protected declarations }
    SourceID: Integer;
    SentenceCount: Integer;
    Enabled: Boolean;
    SourceSettings: TSettings;
    procedure Execute; override;
    procedure SyncCallback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition);
    procedure ProcessLine(Line: String); virtual;
    function ProcessSentence(Line: String): THABPosition;
  public
    { Public declarations }
    PositionCallback: TSourcePositionCallback;
    procedure Enable; virtual;
    procedure Disable; virtual;
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
  end;

implementation

procedure TSource.Execute;
begin
    // Nothing to do here
end;

constructor TSource.Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
begin
    SentenceCount := 0;
    SourceID := ID;
    PositionCallback := Callback;
    Enabled := True;
    SourceSettings := Settings;
    inherited Create(False);
end;

function RemoveDollars(Line: String): String;
var
    i: Integer;
begin
    for i := 1 to Length(Line) do begin
        if Line[i] <> '$' then begin
            Result := Copy(Line, i, length(Line));
            Exit;
        end;
    end;

    Result := Line;
end;

function RemoveChecksum(Line: String; var Checksum: String): String;
var
    i: Integer;
begin
    for i := Length(Line) downto 1 do begin
        if Line[i] = '*' then begin
            Checksum := Copy(Line, i+1, length(Line));
            Result := Copy(Line, 1, i-1);
            Exit;
        end;
    end;

    Checksum := '';
    Result := Line;
end;

function TSource.ProcessSentence(Line: String): THABPosition;
var
    Position: THABPosition;
    Fields: TStringList;
    ChecksumString: String;
begin
    FillChar(Position, SizeOf(Position), 0);
    Line := RemoveDollars(Line);
    Line := RemoveChecksum(Line, ChecksumString);

    if (Line <> '') and (ChecksumString <> '') then begin
        Fields := TStringList.Create;
        try
            Fields.Delimiter := ',';
            Fields.StrictDelimiter := True;
            Fields.DelimitedText := Line;
            if Fields.Count >= 6 then begin
                Position.Channel := 0;
                Position.PayloadID := Fields[0];
                Position.Counter := StrToIntDef(Fields[1], 0);
                Position.TimeStamp := EncodeTime(StrToIntDef(Copy(Fields[2], 1, 2), 0),
                                                     StrToIntDef(Copy(Fields[2], 4, 2), 0),
                                                     StrToIntDef(Copy(Fields[2], 7, 2), 0),
                                                     0);

                Position.Latitude := StrToFloat(Fields[3]);
                Position.Longitude := StrToFloat(Fields[4]);
                Position.Altitude := StrToFloat(Fields[5]);
                Position.InUse := True;
                Inc(SentenceCount);
            end;
        finally
            Fields.Free;
        end;
    end;

    Result := Position;
end;

procedure TSource.ProcessLine(Line: String);
var
    Dollar: Integer;
    Position: THABPosition;
begin
    FillChar(Position, SizeOf(Position), 0);

    if Line <> '' then begin
        Dollar := Pos('$', Line);
        if Dollar > 0 then begin
            // UKHAS sentence
            Position := ProcessSentence(Copy(Line, Dollar, Length(Line)));
            if Position.InUse then begin
                SyncCallback(SourceID, True, Line, Position);
            end;
        end;
    end;
end;

procedure TSource.SyncCallback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition);
begin
    Synchronize(
        procedure begin
            PositionCallback(SourceID, Connected, Line, Position);
        end
    );
end;

procedure TSource.Enable;
begin
    Enabled := True;
end;

procedure TSource.Disable;
begin
    Enabled := False;
end;

end.
