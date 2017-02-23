unit SerialSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, SerialSource;

type
  TfrmSerialSource = class(TfrmSource)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSerialSource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'Serial Port');
    Settings.Add('Port', 'COM4');
    Settings.Add('Baud', 57600);
    ID := 0;
    Source := TSerialSource.Create(ID, Callback, Settings);
end;

end.
