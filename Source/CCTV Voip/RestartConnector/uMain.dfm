object fRestartArc: TfRestartArc
  Left = 0
  Top = 0
  Caption = 'Archos Monitor'
  ClientHeight = 296
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDown: TPanel
    Left = 0
    Top = 255
    Width = 332
    Height = 41
    Align = alBottom
    TabOrder = 0
  end
  object pbRestart: TProgressBar
    Left = 0
    Top = 230
    Width = 332
    Height = 25
    Align = alBottom
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 0
    Top = 196
    Width = 332
    Height = 34
    Align = alBottom
    TabOrder = 2
  end
  object mmoDisplay: TMemo
    Left = 0
    Top = 41
    Width = 332
    Height = 155
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 3
    OnChange = mmoDisplayChange
  end
  object pnlUp: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 41
    Align = alTop
    Alignment = taRightJustify
    TabOrder = 4
  end
  object tmrArchos: TTimer
    Enabled = False
    OnTimer = tmrArchosTimer
    Left = 264
    Top = 64
  end
  object pmMenu: TPopupMenu
    Left = 200
    Top = 64
    object Hide1: TMenuItem
      Caption = 'Hide'
      OnClick = Hide1Click
    end
    object Show1: TMenuItem
      Caption = 'Show'
      OnClick = Show1Click
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
end
