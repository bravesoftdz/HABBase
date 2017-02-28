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
    ExplicitWidth = 704
    inherited AdvSmoothButton1: TAdvSmoothButton
      Top = 1
      Height = 36
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      ExplicitTop = 1
      ExplicitHeight = 36
    end
    inherited btnSettings: TVrMediaButton
      OnClick = btnSettingsClick
    end
  end
  inherited pnlStatus: TAdvPanel
    Width = 704
    ExplicitWidth = 704
    FullHeight = 337
    inherited Label2: TLabel
      Top = 190
      ExplicitTop = 190
    end
    inherited Label3: TLabel
      Left = 291
      Top = 24
      Anchors = [akTop]
      ExplicitLeft = 296
      ExplicitTop = 24
    end
    inherited Label5: TLabel
      Left = 320
      Anchors = [akTop]
      ExplicitLeft = 324
    end
    inherited Label7: TLabel
      Left = 294
      Top = 105
      Anchors = [akTop]
      ExplicitLeft = 299
      ExplicitTop = 105
    end
    inherited pnlConnected: TPanel
      Left = 351
      Anchors = [akTop]
      ExplicitLeft = 351
    end
    inherited Panel1: TPanel
      Height = 213
      ExplicitHeight = 213
      inherited ListBox1: TListBox
        Height = 211
        ExplicitTop = 1
        ExplicitHeight = 211
      end
    end
    inherited pnlTime: TPanel
      Left = 349
      Anchors = [akTop]
      ExplicitLeft = 349
    end
    inherited pnlLongitude: TPanel
      Left = 349
      Anchors = [akTop]
      ExplicitLeft = 349
    end
  end
end
