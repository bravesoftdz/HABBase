unit SocketSource;

interface

uses Source, Classes, SysUtils,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
     Habitat, HABDB, HABTypes;

type
  TSocketSource = class(TSource)
  private
    { Private declarations }
    AClient: TIdTCPClient;
    Line: AnsiString;
    PreviousLines: Array[0..1] of String;
  protected
    { Protected declarations }
    procedure Execute; override;
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

procedure TSocketSource.Execute;
var
    Position: THABPosition;
    Line: String;
begin
    // Create client
    AClient := TIdTCPClient.Create;

    while not Terminated do begin
        // Connect to socket server
        AClient.Host := SourceSettings['Host'];
        AClient.Port := SourceSettings['Port'];
        try
            AClient.Connect;
            FillChar(Position, SizeOf(Position), 0);
            SyncCallback(SourceID, True, '', Position);
            while True do begin
                Line := AClient.IOHandler.ReadLn;
                if Line <> '' then begin
                    ProcessLine(Line);
                end;
            end;
        except
            // Wait before retrying
            SyncCallback(SourceID, False, '', Position);
            Sleep(1000);
        end;
    end;
end;

constructor TSocketSource.Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings; Database: THABDB; Habitat: THabitatThread);
begin
    inherited Create(ID, Callback, Settings, Database, Habitat);
end;

end.
