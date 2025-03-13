object frmSelectEnumeration: TfrmSelectEnumeration
  Left = 0
  Top = 0
  Caption = 'Select a Point Enumeration'
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
    Left = 24
    Top = 21
    Width = 74
    Height = 13
    Caption = 'Enumeration ID'
  end
  object lbl2: TLabel
    Left = 24
    Top = 52
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lbl7: TLabel
    Left = 32
    Top = 289
    Width = 99
    Height = 13
    Caption = 'Records Retrieved : '
  end
  object lblRecord: TLabel
    Left = 140
    Top = 289
    Width = 6
    Height = 13
    Caption = '0'
  end
  object edtResource: TEdit
    Left = 112
    Top = 18
    Width = 136
    Height = 21
    TabOrder = 0
  end
  object edtDescriptn: TEdit
    Left = 112
    Top = 49
    Width = 136
    Height = 21
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 286
    Top = 16
    Width = 74
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 286
    Top = 47
    Width = 74
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
  object btnBrowse: TButton
    Left = 286
    Top = 78
    Width = 74
    Height = 25
    Caption = 'Browse'
    TabOrder = 4
  end
  object dbgrd1: TDBGrid
    Left = 24
    Top = 114
    Width = 336
    Height = 169
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Enumeration ID'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 318
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
