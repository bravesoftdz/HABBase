unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Source, StdCtrls,
  SourceForm, GatewaySourceForm, DLFLDigiSourceForm, SerialSourceForm,
  ExtCtrls, AdvSmoothButton, GIFImg, AdvPanel, AdvSmoothStatusIndicator, AdvGDIP, HABDB;

type
  TSourceType = (stNone, stGateway, stDLFLDigi, stSerial, stHabitat, stHABModem);

  THABSource = class
    public
        Description:    String;
        SourceID:             Integer;
        // Source:         TSource;
        SourceType:     TSourceType;
        IPAddress:      String;
        IPPort:         Integer;
        SerialPort:     String;
        Form:           TfrmSource;
        Indicator:      TAdvSmoothStatusIndicator;
  end;

  TfrmMain = class(TForm)
    pnlStatus: TAdvPanel;
    AdvPanel1: TAdvPanel;
    Image1: TImage;
    btnGoogleMap: TAdvSmoothButton;
    AdvSmoothButton4: TAdvSmoothButton;
    AdvSmoothButton5: TAdvSmoothButton;
    btnAltitudePlot: TAdvSmoothButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    HABSources: TList;
    LastID: Integer;
    HABDB: THABDB;
    procedure AddHABSource(NewSourceType: TSourceType);
    procedure CreateTelemetrySources;
    procedure DataSourceClick(Sender: TObject);
    function FindSourceFromIndicator(Indicator: TAdvSmoothStatusIndicator): THABSource;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AddHABSource(NewSourceType: TSourceType);
var
    HABSource: THABSource;
begin
    Inc(LastID);

    // Source Form
    HABSource := THABSource.Create;
    with HABSource do begin
        SourceType := NewSourceType;
        //   TSourceType = (sNone, stGateway, stDLFLDigi, stSerial, stHabitat, stHABModem);
        if SourceType = stGateway then begin
            Form := TfrmGatewaySource.Create(nil);
        end else if SourceType = stDLFLDigi then begin
            Form := TfrmDLFLDigiSource.Create(nil);
        end else if SourceType = stSerial then begin
            Form := TfrmSerialSource.Create(nil);
        end else begin
            Form := nil;
        end;
        if Form <> nil then begin
            Form.HideYourself;
            Form.HABDB := HABDB;

            Description := 'test' + IntToStr(LastID);
            SourceID := LastID;
            // SourceType:     TSourceType;
            // IPAddress:      String;
            // IPPort:         Integer;
            // SerialPort:     String;

            // Status bar button
            Indicator := TAdvSmoothStatusIndicator.Create(Self);
            with Indicator do begin
                Parent := pnlStatus;
                Align := alRight;
                AlignWithMargins := True;
                BorderWidth := 1;
                Appearance.Fill.Color := clGray;
                Appearance.Fill.ColorMirror := clNone;
                Appearance.Fill.ColorMirrorTo := clNone;
                Appearance.Fill.GradientType := AdvGDIP.gtSolid;
                Appearance.Fill.BorderColor := 3355443;
                Appearance.Fill.Rounding := 18;
                Appearance.Fill.ShadowOffset := 0;
                Appearance.Font.Height := -24;
                Appearance.Font.Color := clWhite;
                AutoSize := True;
                if SourceType = stGateway then begin
                    Caption := 'L';
                end else if SourceType = stDLFLDigi then begin
                    Caption := 'D';
                end else if SourceType = stSerial then begin
                    Caption := 'S';
                end;
                Tag := LastID;
                OnClick := DataSourceClick;
            end;
        end;
    end;

    HABSources.Add(HABSource);
end;

procedure TfrmMain.CreateTelemetrySources;
begin
    if HABSources.Count = 0 then begin
        HABDB := THABDB.Create();
        AddHABSource(stDlFlDigi);
        AddHABSource(stGateway);
        AddHABSource(stSerial);
        (*
            // History
            Sources[i].Lines := TStringList.Create;

            // Telnet socket
            if Sources[i].SourceType in [stDlFlDigi, stLoRa] then begin
                if Sources[i].SourceType = stDlFlDigi then begin
                  Sources[i].Host := 'localhost';
                  Sources[i].PortNumber := 7322 + i - 1;
                end else begin
                  Sources[i].Host := 'loragw5';
                  Sources[i].PortNumber := 6004;
                end;

                Sources[i].Socket := TWSocket.Create(Self);
                with Sources[i].Socket do begin
                    Tag := i;
                    OnSessionConnected := dlfldigiSocketSessionConnected;
                    if Sources[i].SourceType = stDlFlDigi then begin
                        OnDataAvailable := dlfldigiSocketDataAvailable;
                    end else begin
                        OnDataAvailable := LoRaSocketDataAvailable;
                    end;
                    OnSessionClosed := dlfldigiSocketSessionClosed;
                    OnError := dlfldigiSocketError;
                end;
                Sources[i].ReconnectDriver := True;
            end;
        end;
        *)
    end;
end;

procedure TfrmMain.DataSourceClick(Sender: TObject);
var
    HABSource: THABSource;
begin
    HABSource := FindSourceFromIndicator(Sender as TAdvSmoothStatusIndicator);
    if HABSource <> nil then begin
        if HABSource.Form.IsVisible then begin
            HABSource.Form.HideYourself;
        end else begin
            HABSource.Form.ShowYourself;
        end;
    end;
end;

function TfrmMain.FindSourceFromIndicator(Indicator: TAdvSmoothStatusIndicator): THABSource;
var
    i: Integer;
begin
    for i := 0 to HABSources.Count-1 do begin
        if THABSource(HABSources[i]).Indicator = Indicator then begin
            Result := THABSource(HABSources[i]);
            exit;
        end;
    end;

    Result := nil;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
    CreateTelemetrySources;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
    LastID := 0;
    HABSources := TList.Create;
end;

end.
