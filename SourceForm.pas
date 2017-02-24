unit SourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothButton, ExtCtrls, AdvPanel, StdCtrls,
  Source, SourceSettings, VrControls, VrNavigator, HABDB;

type
  TfrmSource = class(TForm)
    pnlButtons: TPanel;
    AdvSmoothButton1: TAdvSmoothButton;
    btnSettings: TVrMediaButton;
    btnPlay: TVrMediaButton;
    btnPause: TVrMediaButton;
    btnClearLog: TVrMediaButton;
    pnlStatus: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlLines: TPanel;
    pnlConnected: TPanel;
    Panel1: TPanel;
    ListBox1: TListBox;
    pnlPayloadID: TPanel;
    pnlTime: TPanel;
    pnlLatitude: TPanel;
    pnlLongitude: TPanel;
    pnlAltitude: TPanel;
    procedure btnPlayClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    Source: TSource;
    Settings: TSettings;
    procedure Callback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition); virtual;
  public
    { Public declarations }
    HABDB: THABDB;
    IsVisible:    Boolean;
    procedure HideYourself;
    procedure ShowYourself;
  end;

implementation

{$R *.dfm}

procedure TfrmSource.AdvSmoothButton1Click(Sender: TObject);
begin
    HideYourself;
end;

function ConnectedColour(Connected: Boolean): TColor;
begin
    if Connected then begin
        Result := clLime;
    end else begin
        Result := clRed;
    end;
end;

procedure TfrmSource.Callback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition);
var
    RecordCount: Integer;
begin
    // Connected part
    pnlConnected.Color := ConnectedColour(Connected);

    // Position
    if Position.InUse then begin
        pnlPayloadID.Caption := Position.PayloadID;
        pnlTime.Caption := FormatDateTime('hh:mm:ss', Position.TimeStamp);
        pnlLatitude.Caption := FormatFloat('0.00000', Position.Latitude);
        pnlLongitude.Caption := FormatFloat('0.00000', Position.Longitude);
        pnlAltitude.Caption := FormatFloat('0', Position.Altitude);
        if HABDB = nil then begin
            RecordCount := 0;
        end else begin
            RecordCount := HABDB.AddPosition(Position);
        end;
        ListBox1.ItemIndex := ListBox1.Items.Add(IntToStr(ID) + ': ' + Line);
        pnlLines.Caption := IntToStr(RecordCount);
    end;
end;

procedure TfrmSource.FormCreate(Sender: TObject);
begin
    HABDB := nil;
    Settings := TSettings.Create;
end;

procedure TfrmSource.btnPlayClick(Sender: TObject);
begin
    Source.Enable;
    btnPause.Enabled := True;
    btnPlay.Enabled := not btnPause.Enabled;
end;

procedure TfrmSource.btnClearLogClick(Sender: TObject);
begin
    ListBox1.Clear;
end;

procedure TfrmSource.btnPauseClick(Sender: TObject);
begin
    Source.Disable;
    btnPause.Enabled := False;
    btnPlay.Enabled := not btnPause.Enabled;
end;

procedure TfrmSource.HideYourself;
begin
    IsVisible := False;
    ShowWindow(Handle, SW_HIDE);
end;

procedure TfrmSource.ShowYourself;
begin
    IsVisible := True;
    ShowWindow(Handle, SW_SHOW);
end;


end.
