object fRestart: TfRestart
  Left = 0
  Top = 0
  Caption = 'Restarting'
  ClientHeight = 322
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 184
    Width = 539
    Height = 138
    Align = alBottom
    Caption = 'Restarting In Progress'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 152
    Align = alClient
    Caption = 'Restarting Phone ..... Please Wait'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnl3: TPanel
    Left = 0
    Top = 152
    Width = 539
    Height = 32
    Align = alBottom
    TabOrder = 2
    object pbRestart: TProgressBar
      Left = 1
      Top = 1
      Width = 537
      Height = 30
      Align = alClient
      TabOrder = 0
    end
  end
  object tmrRestart: TTimer
    Enabled = False
    OnTimer = tmrRestartTimer
    Left = 24
    Top = 24
  end
end
