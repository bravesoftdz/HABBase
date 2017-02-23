unit SerialSource;

interface

uses Source, Classes, SysUtils, VaClasses, VaComm;

type
  TSerialSource = class(TSource)
  private
    { Private declarations }
    ComPort: TVaComm;
    procedure RxChar(Sender: TObject; Count: Integer);
  protected
    { Protected declarations }
    procedure Execute; override;
  public
    { Public declarations }
  end;

implementation

procedure TSerialSource.RxChar(Sender: TObject; Count: Integer);
const
    Line: AnsiString = '';
var
    i: Integer;
    Character: AnsiChar;
    Position: THABPosition;
begin
    for i := 1 to Count do begin
        ComPort.ReadChar(Character);

        try
            if (Character = Chr(10)) or (Character = Chr(13)) then begin
                if Length(Line) > 0 then begin
                    Position := ExtractPositionFrom(Line);
                    if Position.InUse then begin
                        SyncCallback(SourceID, True, Line, Position);
                    end;
                end;
            end else begin
                if Length(Line) < 1000 then begin
                    Line := Line + Character;
                end;
            end;
        except
        end;
    end;
end;

procedure TSerialSource.Execute;
var
    Position: THABPosition;
begin
    while not Terminated do begin
        // Connect to serialport
//        AClient.Host := SourceSettings['Host'];
//        AClient.Port := SourceSettings['Port'];
        ComPort := TVAComm.Create(nil);
        ComPort.Baudrate := br57600;
        ComPort.DeviceName := 'COM4';
        ComPort.OnRxChar := RxChar;
        try
            ComPort.Open;

            while True do begin
                // while Still Open ...
                sleep(1000);
            end;
        except
            // Wait before retrying
            SyncCallback(SourceID, False, '', Position);
            Sleep(1000);
        end;
    end;
end;

end.
