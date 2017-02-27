unit SerialSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, SerialSource, Habitat, HABDB;

type
  TfrmSerialSource = class(TfrmSource)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

{$R *.dfm}

constructor TfrmSerialSource.Create(AOwner: TComponent; Database: THABDB; Habitat: THabitatThread);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'Serial Port');
    Settings.Add('Port', 'COM4');
    Settings.Add('Baud', 57600);
    ID := 0;
    Source := TSerialSource.Create(ID, Callback, Settings, Database, Habitat);
end;

end.
