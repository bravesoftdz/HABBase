inherited frmGatewaySource: TfrmGatewaySource
  Caption = 'Gateway Source'
  ExplicitWidth = 575
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ExplicitTop = 416
    ExplicitWidth = 559
    inherited AdvSmoothButton1: TAdvSmoothButton
      Left = 476
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
    FullHeight = 337
    inherited Label3: TLabel
      Left = 343
      ExplicitLeft = 347
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
