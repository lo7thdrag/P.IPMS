object frmSelectDevice: TfrmSelectDevice
  Left = 0
  Top = 0
  Caption = 'Select a Device'
  ClientHeight = 342
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
    Left = 16
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Device ID'
  end
  object lbl2: TLabel
    Left = 16
    Top = 45
    Width = 45
    Height = 13
    Caption = 'Resource'
  end
  object lbl3: TLabel
    Left = 16
    Top = 76
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lbl7: TLabel
    Left = 16
    Top = 286
    Width = 99
    Height = 13
    Caption = 'Records Retrieved : '
  end
  object lblRecord: TLabel
    Left = 124
    Top = 286
    Width = 6
    Height = 13
    Caption = '0'
  end
  object edtDevice: TEdit
    Left = 96
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtResource: TEdit
    Left = 96
    Top = 42
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtDescriptn: TEdit
    Left = 96
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnDeviceId: TButton
    Left = 223
    Top = 40
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 3
  end
  object btnOk: TButton
    Left = 286
    Top = 13
    Width = 74
    Height = 25
    Caption = 'Ok'
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 286
    Top = 44
    Width = 74
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
  end
  object btnBrowse: TButton
    Left = 286
    Top = 75
    Width = 74
    Height = 25
    Caption = 'Browse'
    TabOrder = 6
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 109
    Width = 344
    Height = 169
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Device ID'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Resource'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 227
        Visible = True
      end>
  end
  object mm1: TMainMenu
    Left = 336
    Top = 296
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
