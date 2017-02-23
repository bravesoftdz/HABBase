inherited frmDLFLDigiSource: TfrmDLFLDigiSource
  Caption = 'dl-fldigi Source'
  ExplicitWidth = 575
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    ExplicitTop = 416
    ExplicitWidth = 559
    inherited AdvSmoothButton1: TAdvSmoothButton
      ExplicitLeft = 475
    end
    inherited btnSettings: TVrMediaButton
      OnClick = btnSettingsClick
    end
  end
  inherited pnlStatus: TAdvPanel
    FullHeight = 337
    inherited Label3: TLabel
      Left = 346
    end
    inherited Label5: TLabel
      Left = 376
    end
    inherited Label7: TLabel
      Left = 352
    end
    inherited pnlConnected: TPanel
      Left = 415
      ExplicitLeft = 415
    end
    inherited Panel1: TPanel
      Width = 417
      Height = 210
      ExplicitWidth = 417
      ExplicitHeight = 210
      inherited ListBox1: TListBox
        Width = 415
        Height = 208
        ExplicitWidth = 415
        ExplicitHeight = 208
      end
    end
    inherited pnlTime: TPanel
      Left = 414
      ExplicitLeft = 414
    end
    inherited pnlLongitude: TPanel
      Left = 414
      ExplicitLeft = 414
    end
  end
end
