program Base;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Source in 'HABRx\Source.pas',
  LoRaGatewaySource in 'HABRx\LoRaGatewaySource.pas',
  DLFlDigiSource in 'HABRx\DLFlDigiSource.pas',
  HabitatSource in 'HABRx\HabitatSource.pas',
  PayloadForm in 'PayloadForm.pas' {frmPayload},
  LoRaGatewaySourceForm in 'LoRaGatewaySourceForm.pas' {frmLoRaGatewaySource},
  SourceSettings in 'SourceSettings.pas' {frmSourceSettings},
  LoRaGatewaySourceSettings in 'LoRaGatewaySourceSettings.pas' {frmGatewaySourceSettings},
  Miscellaneous in 'HABRx\Miscellaneous.pas',
  HABDB in 'HABRx\HABDB.pas',
  SocketSource in 'HABRx\SocketSource.pas',
  SerialSource in 'HABRx\SerialSource.pas',
  DLFLDigiSourceForm in 'DLFLDigiSourceForm.pas' {frmDLFLDigiSource},
  LoRaSerialSourceForm in 'LoRaSerialSourceForm.pas' {frmLoRaSerialSource},
  LoRaSourceForm in 'LoRaSourceForm.pas' {frmLoRaSource},
  LoRaSerialSource in 'HABRx\LoRaSerialSource.pas',
  WebSource in 'HABRx\WebSource.pas',
  WebSourceForm in 'WebSourceForm.pas' {frmWebSource},
  HabitatSourceForm in 'HabitatSourceForm.pas' {frmHabitatSource},
  Habitat in 'HABRx\Habitat.pas',
  HABTypes in 'HABRx\HABTypes.pas',
  SourceForm in 'SourceForm.pas' {frmSource};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
