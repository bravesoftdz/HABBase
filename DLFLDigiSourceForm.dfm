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
      Left = 342
      ExplicitLeft = 346
    end
    inherited Label5: TLabel
      Left = 372
      ExplicitLeft = 376
    end
    inherited Label7: TLabel
      Left = 348
      ExplicitLeft = 352
    end
    inherited pnlConnected: TPanel
      Left = 411
      ExplicitLeft = 411
    end
    inherited Panel1: TPanel
      Width = 413
      Height = 206
      ExplicitWidth = 413
      ExplicitHeight = 206
      inherited ListBox1: TListBox
        Width = 411
        Height = 204
        ExplicitWidth = 411
        ExplicitHeight = 204
      end
    end
    inherited pnlTime: TPanel
      Left = 410
      ExplicitLeft = 410
    end
    inherited pnlLongitude: TPanel
      Left = 410
      ExplicitLeft = 410
    end
  end
end
