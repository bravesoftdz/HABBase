unit LoRaGatewaySourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, LoRaSourceForm, AdvSmoothButton, ExtCtrls, AdvPanel, StdCtrls,
  LoRaGatewaySource, LoRaGatewaySourceSettings, VrControls, VrNavigator,
  Habitat, HABDB;

type
  TfrmLoRaGatewaySource = class(TfrmLoRaSource)
    procedure btnSettingsClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

{$R *.dfm}

procedure TfrmLoRaGatewaySource.btnSettingsClick(Sender: TObject);
var
    SourceSettingsForm: TfrmGatewaySourceSettings;
begin
    SourceSettingsForm := TfrmGatewaySourceSettings.Create(nil);
    if SourceSettingsForm.ShowModal = mrOK then begin
        // Save Gateway Settings
    end;
    SourceSettingsForm.Free;
end;

constructor TfrmLoRaGatewaySource.Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'LoRa Gateway');
    Settings.Add('Host', 'LoRaGW5');
    Settings.Add('Port', 6004);
    ID := 0;
    Source := TLoRaGatewaySource.Create(ID, Callback, Settings, Database, Habitat);
end;

end.
