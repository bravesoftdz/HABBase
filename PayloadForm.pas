unit PayloadForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothButton, ExtCtrls, AdvPanel, StdCtrls,
  Source, SourceSettings, VrControls, VrNavigator, HABDB, Habitat, HABTypes;

type
  TfrmPayload = class(TForm)
    pnlButtons: TPanel;
    AdvSmoothButton1: TAdvSmoothButton;
    pnlStatus: TAdvPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlTimeSincePosition: TPanel;
    Panel1: TPanel;
    ListBox1: TListBox;
    pnlPayloadID: TPanel;
    pnlTime: TPanel;
    pnlLatitude: TPanel;
    pnlLongitude: TPanel;
    pnlAltitude: TPanel;
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
    IsVisible:    Boolean;
    procedure HideYourself;
    procedure ShowYourself;
    procedure NewPosition(Position: THABPosition);
  end;

implementation

{$R *.dfm}

procedure TfrmPayload.AdvSmoothButton1Click(Sender: TObject);
begin
    HideYourself;
end;

procedure TfrmPayload.NewPosition(Position: THABPosition);
var
    RecordCount: Integer;
begin
    // Position
    if Position.InUse then begin
        pnlPayloadID.Caption := Position.PayloadID;
        pnlTime.Caption := FormatDateTime('hh:mm:ss', Position.TimeStamp);
        pnlLatitude.Caption := FormatFloat('0.00000', Position.Latitude);
        pnlLongitude.Caption := FormatFloat('0.00000', Position.Longitude);
        pnlAltitude.Caption := FormatFloat('0', Position.Altitude);
        //ListBox1.ItemIndex := ListBox1.Items.Add(Line);
    end;
end;

procedure TfrmPayload.btnClearLogClick(Sender: TObject);
begin
    ListBox1.Clear;
end;

procedure TfrmPayload.HideYourself;
begin
    IsVisible := False;
    ShowWindow(Handle, SW_HIDE);
end;

procedure TfrmPayload.ShowYourself;
begin
    IsVisible := True;
    ShowWindow(Handle, SW_SHOW);
end;


end.
