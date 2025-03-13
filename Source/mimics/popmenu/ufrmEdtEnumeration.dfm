object frmEdtEnumeration: TfrmEdtEnumeration
  Left = 0
  Top = 0
  Caption = 'Point Enumeration - sesuai dg yg dipilih'
  ClientHeight = 362
  ClientWidth = 384
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
    Width = 368
    Height = 315
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 360
        Height = 287
        ParentBackground = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 9
          Top = 24
          Width = 57
          Height = 13
          Caption = 'Description:'
        end
        object edt1: TEdit
          Left = 82
          Top = 21
          Width = 263
          Height = 21
          TabOrder = 0
        end
        object dbgrd1: TDBGrid
          Left = 9
          Top = 58
          Width = 336
          Height = 178
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Value'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Text'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Setpoint Allowed'
              Width = 319
              Visible = True
            end>
        end
        object btn5: TButton
          Left = 171
          Top = 246
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 2
        end
        object btn6: TButton
          Left = 90
          Top = 246
          Width = 75
          Height = 25
          Caption = 'Properties'
          TabOrder = 3
        end
        object btn7: TButton
          Left = 9
          Top = 246
          Width = 75
          Height = 25
          Caption = 'New'
          TabOrder = 4
        end
      end
    end
  end
  object btn1: TButton
    Left = 31
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
  end
  object btn2: TButton
    Left = 112
    Top = 329
    Width = 75
    Height = 25
    Caption = 'cancel'
    TabOrder = 2
  end
  object btn3: TButton
    Left = 193
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
  end
  object btn4: TButton
    Left = 274
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
  end
end
