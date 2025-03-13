object frmSelectAlarmClass: TfrmSelectAlarmClass
  Left = 0
  Top = 0
  Caption = 'Select a Alarm Class'
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
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Class ID'
  end
  object lbl2: TLabel
    Left = 16
    Top = 56
    Width = 81
    Height = 13
    Caption = 'Class Description'
  end
  object lbl7: TLabel
    Left = 16
    Top = 294
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
  object edt1: TEdit
    Left = 120
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 120
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 291
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
  end
  object btn2: TButton
    Left = 291
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 117
    Width = 350
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
        FieldName = 'Class ID'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Class Description'
        Width = 327
        Visible = True
      end>
  end
  object btn3: TButton
    Left = 291
    Top = 83
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 5
  end
  object mm1: TMainMenu
    Left = 336
    Top = 288
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
