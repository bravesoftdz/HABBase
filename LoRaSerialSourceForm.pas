unit LoRaSerialSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SourceForm, LoRaSourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls, LoRaSerialSource;

type
  TfrmLoRaSerialSource = class(TfrmLoRaSource)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmLoRaSerialSource.FormCreate(Sender: TObject);
var
    ID: Integer;
begin
    inherited;
    Settings.Add('SourceName', 'Serial Port');
    Settings.Add('Port', 'COM4');
    Settings.Add('Baud', 57600);
    ID := 0;
    Source := TLoRaSerialSource.Create(ID, Callback, Settings);
end;

end.
