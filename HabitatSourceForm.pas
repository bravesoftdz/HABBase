unit HabitatSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebSourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, HabitatSource, Habitat, HABDB;

type
  TfrmHabitatSource = class(TfrmWebSource)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

{$R *.dfm}

constructor TfrmHabitatSource.Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('PayloaIDs', 'PYSKY2');
    ID := 0;
    Source := THabitatSource.Create(ID, Callback, Settings, Database, Habitat);
end;

end.
