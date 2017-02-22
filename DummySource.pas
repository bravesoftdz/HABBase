unit DummySource;

interface

uses Source, Classes, SysUtils, Windows;


type
  TDummySourceThread = class(TThread)
  protected
    procedure Execute; override;
  public
    SourceID: Integer;
    Enabled: Boolean;
    Callback: TSourcePositionCallback;
  end;

  TDummySource = class(TSource)
  private
    { Private declarations }
    Thread: TDummySourceThread;
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Enable; override;
    procedure Disable; override;
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback);
  end;

implementation

procedure TDummySourceThread.Execute;
var
    Position: THABPosition;
begin
//  FMsg := Format('Thread %d started', [ThreadID]);
//  Synchronize(Log);
    while not Terminated do begin
        // some real work could be done here
        Sleep(1000);
        if Enabled then begin
            ZeroMemory(@Position, sizeof(Position));
            Callback(SourceID, 0, '1234', Position);
        end;
        // FMsg := Format('Thread %d working ...', [ThreadID]);
        // Synchronize(Log);
    end;
    // FMsg := Format('Thread %d stopping ...', [ThreadID]);
    // Synchronize(Log);
end;

constructor TDummySource.Create(ID: Integer; Callback: TSourcePositionCallback);
begin
    inherited Create(ID, Callback);

    Thread := TDummySourceThread.Create(False);
    Thread.SourceID := ID;
    Thread.Callback := Callback;
    Thread.Enabled := True;
end;

procedure TDummySource.Enable;
begin
    Thread.Enabled := True;
end;

procedure TDummySource.Disable;
begin
    Thread.Enabled := False;
end;

end.
