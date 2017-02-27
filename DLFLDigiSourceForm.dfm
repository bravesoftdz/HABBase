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
      Left = 338
      ExplicitLeft = 346
    end
    inherited Label5: TLabel
      Left = 368
      ExplicitLeft = 376
    end
    inherited Label7: TLabel
      Left = 344
      ExplicitLeft = 352
    end
    inherited pnlConnected: TPanel
      Left = 407
    end
    inherited Panel1: TPanel
      Width = 409
      Height = 253
      ExplicitWidth = 409
      ExplicitHeight = 253
      inherited ListBox1: TListBox
        Width = 407
        Height = 251
        ExplicitWidth = 407
        ExplicitHeight = 200
      end
    end
    inherited pnlTime: TPanel
      Left = 406
    end
    inherited pnlLongitude: TPanel
      Left = 406
    end
  end
end
