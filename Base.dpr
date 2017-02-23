program Base;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Source in 'HABRx\Source.pas',
  GatewaySource in 'HABRx\GatewaySource.pas',
  DLFlDigiSource in 'HABRx\DLFlDigiSource.pas',
  HabitatSource in 'HABRx\HabitatSource.pas',
  SourceForm in 'SourceForm.pas' {frmSource},
  GatewaySourceForm in 'GatewaySourceForm.pas' {frmGatewaySource},
  SourceSettings in 'SourceSettings.pas' {frmSourceSettings},
  GatewaySourceSettings in 'GatewaySourceSettings.pas' {frmGatewaySourceSettings},
  Miscellaneous in 'HABRx\Miscellaneous.pas',
  HABDB in 'HABRx\HABDB.pas',
  SocketSource in 'HABRx\SocketSource.pas',
  SerialSource in 'HABRx\SerialSource.pas',
  DLFLDigiSourceForm in 'DLFLDigiSourceForm.pas' {frmDLFLDigiSource},
  SerialSourceForm in 'SerialSourceForm.pas' {frmSerialSource};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
