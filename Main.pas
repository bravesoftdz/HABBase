unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Source, StdCtrls, Habitat, PayloadForm, HABTypes,
  SourceForm, LoRaGatewaySourceForm, DLFLDigiSourceForm, SerialSourceForm, LoRaSerialSourceForm,
  HabitatSourceForm, ExtCtrls, AdvSmoothButton, GIFImg, AdvPanel, AdvSmoothStatusIndicator, AdvGDIP, HABDB;

type
  TSourceType = (stNone, stGateway, stDLFLDigi, stSerial, stHabitat);

  THABSource = class
    public
        Description:    String;
        SourceID:       Integer;
        SourceType:     TSourceType;
        IPAddress:      String;
        IPPort:         Integer;
        SerialPort:     String;
        Form:           TfrmSource;
        Indicator:      TAdvSmoothStatusIndicator;
  end;

  TPayload = class
    public
        PayloadID:      String;
        Form:           TfrmPayload;
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
    Payloads: TList;
    LastSourceID, LastPayloadID: Integer;
    HABDB: THABDB;
    HabitatThread: THabitatThread;
    procedure AddHABSource(NewSourceType: TSourceType);
    procedure CreateTelemetrySources;
    procedure DataSourceClick(Sender: TObject);
    function FindSourceFromIndicator(Indicator: TAdvSmoothStatusIndicator): THABSource;
    function AddPayload(NewPayloadID: String): TPayload;
    function FindOrAddPayload(PayloadID: String): TPayload;
    function FindPayloadFromIndicator(Indicator: TAdvSmoothStatusIndicator): TPayload;
    procedure PayloadClick(Sender: TObject);
  public
    { Public declarations }
    procedure AddPayloadPosition(Position: THabPosition);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AddHABSource(NewSourceType: TSourceType);
var
    HABSource: THABSource;
begin
    Inc(LastSourceID);

    // Source Form
    HABSource := THABSource.Create;
    with HABSource do begin
        SourceType := NewSourceType;
        //   TSourceType = (sNone, stGateway, stDLFLDigi, stSerial, stHabitat);
        if SourceType = stGateway then begin
            Form := TfrmLoRaGatewaySource.Create(nil, HABDB, HabitatThread);
        end else if SourceType = stDLFLDigi then begin
            Form := TfrmDLFLDigiSource.Create(nil, HABDB, HabitatThread);
        end else if SourceType = stSerial then begin
            Form := TfrmLoRaSerialSource.Create(nil, HABDB, HabitatThread);
        end else if SourceType = stHabitat then begin
            Form := TfrmHabitatSource.Create(nil, HABDB, HabitatThread);
        end else begin
            Form := nil;
        end;
        if Form <> nil then begin
            Form.HideYourself;

            Description := 'test' + IntToStr(LastSourceID);
            SourceID := LastSourceID;

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
                end else if SourceType = stHabitat then begin
                    Caption := 'H';
                end;
                Tag := LastSourceID;
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
        AddHABSource(stHabitat);
        AddHABSource(stDlFlDigi);
        AddHABSource(stGateway);
        AddHABSource(stSerial);
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
    LastSourceID := 0;
    LastPayloadID := 0;

    HABSources := TList.Create;
    Payloads := TList.Create;

    HabitatThread := THabitatThread.create();
end;

function TfrmMain.AddPayload(NewPayloadID: String): TPayload;
var
    Payload: TPayload;
begin
    Inc(LastPayloadID);

    // Source Form
    Payload := TPayload.Create;
    with Payload do begin
        // ID
        PayloadID := NewPayloadID;

        // Form
        Form := TfrmPayload.Create(nil);    // , HABDB, HabitatThread);
        Form.Caption := 'Payload: ' + NewPayloadID;
        Form.HideYourself;

        // Status bar button
        Indicator := TAdvSmoothStatusIndicator.Create(Self);
        with Indicator do begin
            Parent := pnlStatus;
            Align := alLeft;
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
            Caption := PayloadID;
            Tag := LastPayloadID;
            OnClick := PayloadClick;
        end;
    end;

    Payloads.Add(Payload);

    Result := Payload;
end;

function TfrmMain.FindOrAddPayload(PayloadID: String): TPayload;
var
    i: Integer;
begin
    // Already exists?
    for i := 0 to Payloads.Count-1 do begin
        if TPayload(Payloads[i]).PayloadID = PayloadID then begin
            Result := TPayload(Payloads[i]);
            Exit;
        end;
    end;

    Result := AddPayload(PayloadID);
end;


procedure TfrmMain.AddPayloadPosition(Position: THabPosition);
var
    Payload: TPayload;
begin
    Payload := FindOrAddPayload(Position.PayloadID);

    Payload.Form.NewPosition(Position);
end;

procedure TfrmMain.PayloadClick(Sender: TObject);
var
    Payload: TPayload;
begin
    Payload := FindPayloadFromIndicator(Sender as TAdvSmoothStatusIndicator);
    if Payload <> nil then begin
        if Payload.Form.IsVisible then begin
            Payload.Form.HideYourself;
        end else begin
            Payload.Form.ShowYourself;
        end;
    end;
end;

function TfrmMain.FindPayloadFromIndicator(Indicator: TAdvSmoothStatusIndicator): TPayload;
var
    i: Integer;
begin
    for i := 0 to Payloads.Count-1 do begin
        if TPayload(Payloads[i]).Indicator = Indicator then begin
            Result := TPayload(Payloads[i]);
            exit;
        end;
    end;

    Result := nil;
end;

end.
