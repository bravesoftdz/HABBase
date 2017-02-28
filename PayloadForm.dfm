object frmPayload: TfrmPayload
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Payload'
  ClientHeight = 454
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 416
    Width = 559
    Height = 38
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object AdvSmoothButton1: TAdvSmoothButton
      AlignWithMargins = True
      Left = 475
      Top = 2
      Width = 82
      Height = 34
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alRight
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      Caption = 'Close'
      TabOrder = 0
      Version = '2.0.2.0'
      OnClick = AdvSmoothButton1Click
    end
  end
  object pnlStatus: TAdvPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 416
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.3.0.1'
    BorderColor = clGray
    Caption.Color = 15722471
    Caption.ColorTo = 11176072
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Height = 14
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 14540253
    ColorMirror = 14540253
    ColorMirrorTo = clSilver
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    DesignSize = (
      555
      412)
    FullHeight = 337
    object Label2: TLabel
      Left = 27
      Top = 150
      Width = 75
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Recent History:'
    end
    object Label3: TLabel
      Left = 296
      Top = 24
      Width = 98
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Time Since Position::'
    end
    object Label4: TLabel
      Left = 46
      Top = 24
      Width = 56
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Payload ID:'
    end
    object Label5: TLabel
      Left = 368
      Top = 65
      Width = 26
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Time:'
      ExplicitLeft = 384
    end
    object Label6: TLabel
      Left = 59
      Top = 65
      Width = 43
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Latitude:'
    end
    object Label7: TLabel
      Left = 344
      Top = 105
      Width = 51
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Longitude:'
      ExplicitLeft = 360
    end
    object Label8: TLabel
      Left = 60
      Top = 105
      Width = 41
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Altitude:'
    end
    object pnlTimeSincePosition: TPanel
      Left = 407
      Top = 17
      Width = 121
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 119
      Top = 140
      Width = 409
      Height = 243
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      object ListBox1: TListBox
        Left = 1
        Top = 1
        Width = 407
        Height = 241
        Align = alClient
        BorderStyle = bsNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlPayloadID: TPanel
      Left = 119
      Top = 17
      Width = 150
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 2
    end
    object pnlTime: TPanel
      Left = 406
      Top = 58
      Width = 120
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 3
    end
    object pnlLatitude: TPanel
      Left = 120
      Top = 58
      Width = 149
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 4
    end
    object pnlLongitude: TPanel
      Left = 406
      Top = 98
      Width = 121
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 5
    end
    object pnlAltitude: TPanel
      Left = 120
      Top = 98
      Width = 149
      Height = 28
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 6
    end
  end
end
