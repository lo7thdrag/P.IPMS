object frmEdtMeasure: TfrmEdtMeasure
  Left = 0
  Top = 0
  Caption = 'Measurment Unit Properties - sesuai yg dipilih'
  ClientHeight = 189
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 318
    Height = 137
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'General'
      ExplicitWidth = 301
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 109
        ParentBackground = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 32
          Top = 24
          Width = 57
          Height = 13
          Caption = 'Description:'
        end
        object lbl2: TLabel
          Left = 32
          Top = 59
          Width = 63
          Height = 13
          Caption = 'Display label:'
        end
        object edt1: TEdit
          Left = 107
          Top = 21
          Width = 191
          Height = 21
          TabOrder = 0
        end
        object edt2: TEdit
          Left = 107
          Top = 56
          Width = 191
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
  object btn1: TButton
    Left = 8
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
  end
  object btn2: TButton
    Left = 89
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btn3: TButton
    Left = 170
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
  end
  object btn4: TButton
    Left = 251
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
  end
end
