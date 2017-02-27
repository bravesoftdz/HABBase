unit DLFLDigiSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, DLFLDigiSource, Habitat, HABDB;

type
  TfrmDLFLDigiSource = class(TfrmSource)
    procedure btnSettingsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

uses Source;

{$R *.dfm}

constructor TfrmDLFLDigiSource.Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'dl-fldigi');
    Settings.Add('Host', 'localhost');
    Settings.Add('Port', 7322);
    ID := 0;
    Source := TDLFLDigiSource.Create(ID, Callback, Settings, Database, Habitat);
end;


procedure TfrmDLFLDigiSource.btnSettingsClick(Sender: TObject);
begin
    //
end;

end.
