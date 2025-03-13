object frmPointType: TfrmPointType
  Left = 0
  Top = 0
  Caption = 'Select a Point Type'
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
    Top = 18
    Width = 51
    Height = 13
    Caption = 'Point Type'
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
  object edtPointType: TEdit
    Left = 104
    Top = 15
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 286
    Top = 13
    Width = 74
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 286
    Top = 44
    Width = 74
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btnBrowse: TButton
    Left = 286
    Top = 75
    Width = 74
    Height = 25
    Caption = 'Browse'
    TabOrder = 3
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 109
    Width = 344
    Height = 169
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Point Type'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data Type ID'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Width = 125
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
