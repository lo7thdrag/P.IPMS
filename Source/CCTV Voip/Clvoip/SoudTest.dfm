object SoundTest: TSoundTest
  Left = 557
  Top = 306
  BorderStyle = bsDialog
  Caption = 'Sound Test'
  ClientHeight = 183
  ClientWidth = 306
  Color = 14669517
  Font.Charset = ANSI_CHARSET
  Font.Color = 7166274
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object WaveIn: TLabel
    Left = 8
    Top = 32
    Width = 52
    Height = 14
    Caption = 'WaveIn'
  end
  object WaveOut: TLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 14
    Caption = 'WaveOut'
  end
  object Graph: TPaintBox
    Left = 32
    Top = 56
    Width = 240
    Height = 50
    OnPaint = GraphPaint
  end
  object Status: TLabel
    Left = 16
    Top = 136
    Width = 265
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Status'
  end
  object Test: TButton
    Tag = 1
    Left = 104
    Top = 158
    Width = 89
    Height = 20
    Cancel = True
    Caption = 'FERMER'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 0
  end
  object ProgressBar: TProgressBar
    Left = 32
    Top = 112
    Width = 241
    Height = 17
    Max = 99
    Step = 1
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 256
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer2Timer
    Left = 256
    Top = 48
  end
end
