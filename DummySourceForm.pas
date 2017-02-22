unit DummySourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, DummySource;

type
  TfrmDummySource = class(TfrmSource)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmDummySource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    ID := 0;
    Source := TDummySource.Create(ID, Callback, Settings);
end;

end.
