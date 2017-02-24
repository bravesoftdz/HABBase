unit LoRaSourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Source, SourceForm, StdCtrls, AdvPanel, VrControls, VrNavigator,
  AdvSmoothButton, ExtCtrls;

type
  TfrmLoRaSource = class(TfrmSource)
    Label9: TLabel;
    pnlCurrentRSSI: TPanel;
    Label10: TLabel;
    pnlPacketRSSI: TPanel;
    Label11: TLabel;
    pnlPacketSNR: TPanel;
    Label12: TLabel;
    pnlFrequencyError: TPanel;
  private
    { Private declarations }
  protected
    procedure Callback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmLoRaSource.Callback(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition);
begin
    inherited;  // For connected indicator, position data

    if Position.SignalValues <> nil then begin
        if Position.SignalValues.ContainsKey('CurrentRSSI') then begin
            pnlCurrentRSSI.Caption := FormatFloat('0', Position.SignalValues.Items['CurrentRSSI']) + ' dB';
        end else if Position.SignalValues.ContainsKey('PacketRSSI') then begin
            pnlPacketRSSI.Caption := FormatFloat('0', Position.SignalValues.Items['PacketRSSI']) + ' dB';
        end else if Position.SignalValues.ContainsKey('PacketSNR') then begin
            pnlPacketSNR.Caption := FormatFloat('0', Position.SignalValues.Items['PacketSNR']) + ' dB';
        end else if Position.SignalValues.ContainsKey('FrequencyError') then begin
            pnlFrequencyError.Caption := FormatFloat('0.0', Position.SignalValues.Items['FrequencyError']) + ' kHz';
        end;
    end;
end;

end.
