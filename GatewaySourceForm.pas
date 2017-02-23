unit GatewaySourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, AdvSmoothButton, ExtCtrls, AdvPanel, StdCtrls,
  GatewaySource, GatewaySourceSettings, VrControls, VrNavigator;

type
  TfrmGatewaySource = class(TfrmSource)
    procedure FormCreate(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmGatewaySource.btnSettingsClick(Sender: TObject);
var
    SourceSettingsForm: TfrmGatewaySourceSettings;
begin
    SourceSettingsForm := TfrmGatewaySourceSettings.Create(nil);
    if SourceSettingsForm.ShowModal = mrOK then begin
        // Save Gateway Settings
    end;
    SourceSettingsForm.Free;
end;

procedure TfrmGatewaySource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'LoRa Gateway');
    Settings.Add('Host', 'LoRaGW5');
    Settings.Add('Port', 6004);
    ID := 0;
    Source := TGatewaySource.Create(ID, Callback, Settings);
end;

end.
