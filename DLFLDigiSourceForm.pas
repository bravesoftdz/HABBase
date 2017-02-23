unit DLFLDigiSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, DLFLDigiSource;

type
  TfrmDLFLDigiSource = class(TfrmSource)
    procedure btnSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Source;

{$R *.dfm}

procedure TfrmDLFLDigiSource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'dl-fldigi');
    Settings.Add('Host', 'localhost');
    Settings.Add('Port', 7322);
    ID := 0;
    Source := TDLFLDigiSource.Create(ID, Callback, Settings);
end;


procedure TfrmDLFLDigiSource.btnSettingsClick(Sender: TObject);
//var
//    SourceSettingsForm: TfrmGatewaySourceSettings;
begin
//    SourceSettingsForm := TfrmGatewaySourceSettings.Create(nil);
//    if SourceSettingsForm.ShowModal = mrOK then begin
//        // Save Gateway Settings
//    end;
//    SourceSettingsForm.Free;
end;

end.
