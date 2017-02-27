inherited frmLoRaGatewaySource: TfrmLoRaGatewaySource
  Caption = 'LoRa Gateway Source'
  ClientWidth = 704
  ExplicitWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Width = 704
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ExplicitWidth = 719
    inherited AdvSmoothButton1: TAdvSmoothButton
      Top = 1
      Height = 36
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      ExplicitLeft = 636
      ExplicitTop = 1
      ExplicitHeight = 36
    end
    inherited btnSettings: TVrMediaButton
      OnClick = btnSettingsClick
    end
  end
  inherited pnlStatus: TAdvPanel
    Width = 704
    ExplicitWidth = 719
    FullHeight = 337
    inherited Label2: TLabel
      Top = 190
      ExplicitTop = 190
    end
    inherited Label3: TLabel
      Left = 293
      Top = 24
      Anchors = [akTop]
      ExplicitLeft = 296
      ExplicitTop = 24
    end
    inherited Label5: TLabel
      Left = 322
      Anchors = [akTop]
      ExplicitLeft = 324
    end
    inherited Label7: TLabel
      Left = 296
      Top = 105
      Anchors = [akTop]
      ExplicitLeft = 299
      ExplicitTop = 105
    end
    inherited pnlConnected: TPanel
      Left = 353
      Anchors = [akTop]
      ExplicitLeft = 362
    end
    inherited Panel1: TPanel
      Top = 180
      Width = 563
      Height = 217
      ExplicitTop = 180
      ExplicitWidth = 563
      ExplicitHeight = 217
      inherited ListBox1: TListBox
        Width = 561
        Height = 215
        ExplicitWidth = 559
        ExplicitHeight = 192
      end
    end
    inherited pnlTime: TPanel
      Left = 351
      Anchors = [akTop]
      ExplicitLeft = 360
    end
    inherited pnlLongitude: TPanel
      Left = 351
      Anchors = [akTop]
      ExplicitLeft = 360
    end
  end
end
