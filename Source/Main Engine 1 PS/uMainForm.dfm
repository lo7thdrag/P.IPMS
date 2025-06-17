object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Main Form'
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
    Width = 481
    Height = 89
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object mmoLogReceive: TMemo
    Left = 8
    Top = 176
    Width = 481
    Height = 89
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object tmrBlinkTimer: TTimer
    Enabled = False
    OnTimer = tmrBlinkMe1Timer
    Left = 432
    Top = 440
  end
  object tmr1: TTimer
    Enabled = False
    Left = 216
    Top = 128
  end
end
