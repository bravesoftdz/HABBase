inherited frmLoRaSource: TfrmLoRaSource
  Caption = 'LoRa Source'
  ClientWidth = 705
  ExplicitWidth = 721
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Width = 705
    ExplicitTop = 416
    ExplicitWidth = 559
    inherited AdvSmoothButton1: TAdvSmoothButton
      Left = 621
      ExplicitLeft = 475
    end
  end
  inherited pnlStatus: TAdvPanel
    Width = 705
    DesignSize = (
      701
      412)
    FullHeight = 337
    inherited Label3: TLabel
      Left = 291
      Top = 23
      ExplicitLeft = 291
      ExplicitTop = 23
    end
    inherited Label5: TLabel
      Left = 320
      Top = 64
      ExplicitLeft = 320
      ExplicitTop = 64
    end
    inherited Label7: TLabel
      Left = 296
      Top = 104
      ExplicitLeft = 296
      ExplicitTop = 104
    end
    object Label9: TLabel [8]
      Left = 491
      Top = 24
      Width = 67
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Current RSSI:'
    end
    object Label10: TLabel [9]
      Left = 496
      Top = 65
      Width = 62
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Packet RSSI:'
    end
    object Label11: TLabel [10]
      Left = 499
      Top = 104
      Width = 59
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Packet SNR:'
    end
    object Label12: TLabel [11]
      Left = 476
      Top = 145
      Width = 82
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Frequency Error:'
    end
    inherited pnlConnected: TPanel
      Left = 351
      Top = 16
      ExplicitLeft = 351
      ExplicitTop = 16
    end
    inherited Panel1: TPanel
      Width = 563
      Height = 210
      ExplicitWidth = 417
      ExplicitHeight = 210
      inherited ListBox1: TListBox
        Width = 561
        Height = 208
        ExplicitWidth = 415
        ExplicitHeight = 208
      end
    end
    inherited pnlTime: TPanel
      Left = 350
      Top = 57
      ExplicitLeft = 350
      ExplicitTop = 57
    end
    inherited pnlLongitude: TPanel
      Left = 350
      Top = 97
      ExplicitLeft = 350
      ExplicitTop = 97
    end
    object pnlCurrentRSSI: TPanel
      Left = 563
      Top = 17
      Width = 121
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 8
    end
    object pnlPacketRSSI: TPanel
      Left = 562
      Top = 57
      Width = 120
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 9
    end
    object pnlPacketSNR: TPanel
      Left = 563
      Top = 97
      Width = 121
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 10
    end
    object pnlFrequencyError: TPanel
      Left = 562
      Top = 138
      Width = 120
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 11
    end
  end
end
