inherited frmLoRaGatewaySource: TfrmLoRaGatewaySource
  Caption = 'LoRa Gateway Source'
  ClientWidth = 719
  ExplicitWidth = 735
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Width = 719
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    inherited AdvSmoothButton1: TAdvSmoothButton
      Left = 636
      Top = 1
      Height = 36
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      ExplicitLeft = 476
      ExplicitTop = 1
      ExplicitHeight = 36
    end
    inherited btnSettings: TVrMediaButton
      OnClick = btnSettingsClick
    end
  end
  inherited pnlStatus: TAdvPanel
    Width = 719
    FullHeight = 337
    inherited Label3: TLabel
      Left = 302
      Top = 24
      Anchors = [akTop]
      ExplicitLeft = 296
      ExplicitTop = 24
    end
    inherited Label5: TLabel
      Left = 331
      Anchors = [akTop]
      ExplicitLeft = 324
    end
    inherited Label7: TLabel
      Left = 305
      Top = 105
      Anchors = [akTop]
      ExplicitLeft = 299
      ExplicitTop = 105
    end
    inherited pnlConnected: TPanel
      Left = 364
      Anchors = [akTop]
      ExplicitLeft = 356
    end
    inherited Panel1: TPanel
      Width = 565
      Height = 198
      ExplicitWidth = 405
      ExplicitHeight = 198
      inherited ListBox1: TListBox
        Width = 563
        Height = 196
        ExplicitWidth = 403
        ExplicitHeight = 196
      end
    end
    inherited pnlTime: TPanel
      Left = 362
      Anchors = [akTop]
      ExplicitLeft = 354
    end
    inherited pnlLongitude: TPanel
      Left = 362
      Anchors = [akTop]
      ExplicitLeft = 354
    end
  end
end
