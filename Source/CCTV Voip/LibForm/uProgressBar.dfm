object frmProgress: TfrmProgress
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Progress Bar'
  ClientHeight = 146
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlUp: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 41
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 105
    Width = 602
    Height = 41
    Align = alBottom
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
  end
  object pbProgess: TProgressBar
    Left = 0
    Top = 41
    Width = 602
    Height = 64
    Align = alClient
    TabOrder = 2
  end
  object tmrProgress: TTimer
    Enabled = False
    OnTimer = tmrProgressTimer
    Left = 488
    Top = 8
  end
end
