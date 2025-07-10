object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 500
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mmoNetLogger: TMemo
    Left = 8
    Top = 48
    Width = 489
    Height = 89
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object mmoLogReceive: TMemo
    Left = 8
    Top = 176
    Width = 489
    Height = 89
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object tmrRunningMETimer1: TTimer
    OnTimer = tmrRunningMETimer1Timer
    Left = 344
    Top = 424
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 248
    Top = 144
  end
end
