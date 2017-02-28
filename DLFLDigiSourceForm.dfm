inherited frmDLFLDigiSource: TfrmDLFLDigiSource
  Caption = 'dl-fldigi Source'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    inherited btnSettings: TVrMediaButton
      OnClick = btnSettingsClick
    end
  end
  inherited pnlStatus: TAdvPanel
    FullHeight = 337
    inherited Label3: TLabel
      Left = 334
      ExplicitLeft = 346
    end
    inherited Label5: TLabel
      Left = 364
      ExplicitLeft = 376
    end
    inherited Label7: TLabel
      Left = 340
      ExplicitLeft = 352
    end
    inherited pnlConnected: TPanel
      Left = 403
      ExplicitLeft = 403
    end
    inherited Panel1: TPanel
      Width = 405
      Height = 249
      ExplicitWidth = 405
      ExplicitHeight = 249
      inherited ListBox1: TListBox
        Width = 403
        Height = 247
        ExplicitWidth = 403
        ExplicitHeight = 247
      end
    end
    inherited pnlTime: TPanel
      Left = 402
      ExplicitLeft = 402
    end
    inherited pnlLongitude: TPanel
      Left = 402
      ExplicitLeft = 402
    end
  end
end
