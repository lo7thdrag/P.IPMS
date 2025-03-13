object frmLogger: TfrmLogger
  Left = 0
  Top = 0
  Caption = 'Data Logger'
  ClientHeight = 497
  ClientWidth = 421
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
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Network Log :'
  end
  object lbl2: TLabel
    Left = 8
    Top = 167
    Width = 55
    Height = 13
    Caption = 'Event Log :'
  end
  object lbl3: TLabel
    Left = 8
    Top = 327
    Width = 51
    Height = 13
    Caption = 'Error Log :'
  end
  object mmoNetLogger: TMemo
    Left = 8
    Top = 24
    Width = 401
    Height = 137
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object mmoEvntLog: TMemo
    Left = 8
    Top = 186
    Width = 401
    Height = 137
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object mmoErrorLog: TMemo
    Left = 8
    Top = 346
    Width = 401
    Height = 137
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
