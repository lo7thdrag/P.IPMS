object frmPointPropts: TfrmPointPropts
  Left = 0
  Top = 0
  Caption = 'Point Properties - sesuai point id-nya'
  ClientHeight = 362
  ClientWidth = 484
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
    Width = 468
    Height = 315
    ActivePage = ts3
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'General'
      ExplicitHeight = 256
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 460
        Height = 287
        ParentBackground = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 16
          Top = 16
          Width = 57
          Height = 13
          Caption = 'Description:'
        end
        object lbl2: TLabel
          Left = 16
          Top = 43
          Width = 54
          Height = 13
          Caption = 'Data Type:'
        end
        object lbl3: TLabel
          Left = 167
          Top = 43
          Width = 47
          Height = 13
          Caption = 'Elements:'
        end
        object edt1: TEdit
          Left = 87
          Top = 13
          Width = 186
          Height = 21
          TabOrder = 0
          Text = 'edt1'
        end
        object btn1: TButton
          Left = 328
          Top = 11
          Width = 89
          Height = 25
          Caption = 'Advanced >>'
          TabOrder = 1
        end
        object cbb1: TComboBox
          Left = 87
          Top = 40
          Width = 74
          Height = 21
          TabOrder = 2
          Text = 'cbb1'
        end
        object ud1: TUpDown
          Left = 254
          Top = 40
          Width = 19
          Height = 21
          TabOrder = 3
        end
        object chk1: TCheckBox
          Left = 279
          Top = 42
          Width = 98
          Height = 17
          Caption = 'Read Only'
          TabOrder = 4
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'Virtual'
      ImageIndex = 1
      ExplicitHeight = 256
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 460
        Height = 287
        ParentBackground = False
        TabOrder = 0
        object lbl4: TLabel
          Left = 16
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Initialization:'
        end
        object lbl5: TLabel
          Left = 16
          Top = 59
          Width = 56
          Height = 13
          Caption = 'Calculation:'
        end
        object cbb2: TComboBox
          Left = 96
          Top = 13
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'cbb2'
        end
        object cbb3: TComboBox
          Left = 96
          Top = 56
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'cbb2'
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'Alarm'
      ImageIndex = 2
      ExplicitHeight = 256
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 460
        Height = 287
        ParentBackground = False
        TabOrder = 0
        object pnl4: TPanel
          Left = 16
          Top = 16
          Width = 417
          Height = 81
          BorderStyle = bsSingle
          TabOrder = 0
          object lbl6: TLabel
            Left = 13
            Top = 16
            Width = 76
            Height = 13
            Caption = 'Alarm Message:'
          end
          object edt2: TEdit
            Left = 98
            Top = 13
            Width = 263
            Height = 21
            TabOrder = 0
          end
          object btnPopExpression: TButton
            Left = 367
            Top = 13
            Width = 21
            Height = 21
            Caption = '>'
            TabOrder = 1
          end
        end
        object pnl5: TPanel
          Left = 29
          Top = 9
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Definition'
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
  end
  object btn2: TButton
    Left = 318
    Top = 329
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 1
  end
  object btn3: TButton
    Left = 399
    Top = 329
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 2
  end
  object btn4: TButton
    Left = 237
    Top = 329
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 3
  end
end
