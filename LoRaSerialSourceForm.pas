unit LoRaSerialSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, LoRaSourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, LoRaSerialSource, Habitat, HABDB, HABTypes;

type
  TfrmLoRaSerialSource = class(TfrmLoRaSource)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

{$R *.dfm}

constructor TfrmLoRaSerialSource.Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'Serial Port');
    Settings.Add('Port', 'COM4');
    Settings.Add('Baud', 57600);
    ID := 0;
    Source := TLoRaSerialSource.Create(ID, Callback, Settings, Database, Habitat);
    Source.EnableHabitat(True);
end;

end.
