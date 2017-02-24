unit HabitatSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebSourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, HabitatSource;

type
  TfrmHabitatSource = class(TfrmWebSource)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmHabitatSource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('PayloaIDs', 'PYSKY2');
    ID := 0;
    Source := THabitatSource.Create(ID, Callback, Settings);
end;

end.
