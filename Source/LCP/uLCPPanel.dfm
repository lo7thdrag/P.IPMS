object frmLCPPanel: TfrmLCPPanel
  Left = -1110
  Top = 96
  Caption = 'Local Control Panel'
  ClientHeight = 555
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object g1: TGauge
    Left = 373
    Top = 56
    Width = 30
    Height = 177
    Kind = gkVerticalBar
    Progress = 100
    ShowText = False
  end
  object rzmtr2: TRzMeter
    Left = 336
    Top = 56
    Width = 31
    Height = 89
    BorderShadow = clGray
    FlatColor = clWhite
    Direction = dirUp
    BrushStyle = bsSolid
    Max = 50
    Value = 50
    MeterType = mtNormal
  end
  object rzmtr1: TRzMeter
    Left = 336
    Top = 144
    Width = 31
    Height = 89
    BorderShadow = clGray
    FlatColor = clWhite
    Direction = dirDown
    BrushStyle = bsSolid
    Max = 50
    MeterType = mtNormal
  end
  object vrmtr1: TVrMeter
    Left = 328
    Top = 320
    Width = 240
    Height = 105
    Scale.Percent1 = 60
    Scale.Ticks = 61
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 2
    Bevel.InnerStyle = bsLowered
    Bevel.InnerSpace = 1
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
    Caption = 'vrmtr1'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object vrstr1: TVrRaster
    Left = 616
    Top = 160
    Width = 144
    Height = 69
    Palette.Low = clGreen
    Palette.High = clLime
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 1
    Bevel.InnerStyle = bsNone
    Bevel.InnerSpace = 0
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
  end
  object vrnglrmtr1: TVrAngularMeter
    Left = 57
    Top = 144
    Width = 310
    Height = 250
    MaxValue = 100.000000000000000000
    ColorZone3 = clSkyBlue
    Percent1 = 0
    Percent2 = 0
    LabelsFont.Charset = DEFAULT_CHARSET
    LabelsFont.Color = clWhite
    LabelsFont.Height = -11
    LabelsFont.Name = 'Tahoma'
    LabelsFont.Style = []
    Caption = '|VrAngularMeter|1000 X'
    DragKind = dkDock
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'signal and button'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btnGauge: TButton
    Left = 127
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Gauge'
    TabOrder = 1
    OnClick = btnGaugeClick
  end
  object btnTimerandswitch: TButton
    Left = 246
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Timer and Switch'
    TabOrder = 2
    OnClick = btnTimerandswitchClick
  end
  object btn2: TButton
    Left = 373
    Top = 8
    Width = 105
    Height = 25
    Caption = 'HMI'
    TabOrder = 3
    OnClick = btn2Click
  end
end
