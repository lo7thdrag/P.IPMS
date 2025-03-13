object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Select a Point'
  ClientHeight = 462
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 15
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Project:'
  end
  object lbl2: TLabel
    Left = 15
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Point ID'
  end
  object lbl3: TLabel
    Left = 15
    Top = 88
    Width = 46
    Height = 13
    Caption = 'Device ID'
  end
  object lbl4: TLabel
    Left = 15
    Top = 120
    Width = 45
    Height = 13
    Caption = 'Resource'
  end
  object lbl5: TLabel
    Left = 15
    Top = 152
    Width = 51
    Height = 13
    Caption = 'Point Type'
  end
  object lbl6: TLabel
    Left = 15
    Top = 184
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lbl7: TLabel
    Left = 15
    Top = 416
    Width = 99
    Height = 13
    Caption = 'Records Retrieved : '
  end
  object lblRecord: TLabel
    Left = 123
    Top = 416
    Width = 6
    Height = 13
    Caption = '0'
  end
  object edtPointId: TEdit
    Left = 87
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtDeviceId: TEdit
    Left = 87
    Top = 85
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtResource: TEdit
    Left = 87
    Top = 117
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtPointType: TEdit
    Left = 87
    Top = 149
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object cbbProject: TComboBox
    Left = 87
    Top = 21
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object edtDescp: TEdit
    Left = 87
    Top = 181
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnDeviceId: TButton
    Left = 214
    Top = 83
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 6
  end
  object btnResource: TButton
    Left = 214
    Top = 115
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 7
  end
  object btnPointType: TButton
    Left = 214
    Top = 147
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 8
  end
  object btnOk: TButton
    Left = 278
    Top = 21
    Width = 74
    Height = 25
    Caption = 'Ok'
    TabOrder = 9
  end
  object btnCancel: TButton
    Left = 278
    Top = 52
    Width = 74
    Height = 25
    Caption = 'Cancel'
    TabOrder = 10
  end
  object btnBrowse: TButton
    Left = 278
    Top = 83
    Width = 74
    Height = 25
    Caption = 'Browse'
    TabOrder = 11
  end
  object mmoRecord: TMemo
    Left = 15
    Top = 224
    Width = 352
    Height = 177
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object mm1: TMainMenu
    Left = 336
    Top = 416
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object FieldChooser1: TMenuItem
        Caption = 'Field Chooser'
      end
      object AutoBrowse1: TMenuItem
        Caption = 'Auto Browse'
      end
      object LargeIcons1: TMenuItem
        Caption = 'Large Icons'
      end
      object List1: TMenuItem
        Caption = 'List'
      end
      object Details1: TMenuItem
        Caption = 'Details'
      end
      object ree1: TMenuItem
        Caption = 'Tree'
      end
    end
  end
end
