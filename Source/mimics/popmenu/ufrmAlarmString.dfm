object frmSelectAlarmString: TfrmSelectAlarmString
  Left = 0
  Top = 0
  Caption = 'Select a Alarm String'
  ClientHeight = 392
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
    Left = 17
    Top = 18
    Width = 100
    Height = 13
    Caption = 'HiHi (alarm high) Msg'
  end
  object lbl2: TLabel
    Left = 17
    Top = 45
    Width = 100
    Height = 13
    Caption = 'LoLo (alarm low) Msg'
  end
  object lbl3: TLabel
    Left = 17
    Top = 72
    Width = 103
    Height = 13
    Caption = 'Hi (warning high) Msg'
  end
  object lbl4: TLabel
    Left = 17
    Top = 99
    Width = 101
    Height = 13
    Caption = 'Lo (warning low) Msg'
  end
  object lbl5: TLabel
    Left = 17
    Top = 126
    Width = 55
    Height = 13
    Caption = 'Normal Msg'
  end
  object lbl7: TLabel
    Left = 17
    Top = 343
    Width = 99
    Height = 13
    Caption = 'Records Retrieved : '
  end
  object lblRecord: TLabel
    Left = 125
    Top = 343
    Width = 6
    Height = 13
    Caption = '0'
  end
  object edt1: TEdit
    Left = 138
    Top = 15
    Width = 136
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 138
    Top = 42
    Width = 136
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 138
    Top = 69
    Width = 136
    Height = 21
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 138
    Top = 96
    Width = 136
    Height = 21
    TabOrder = 3
  end
  object edt5: TEdit
    Left = 138
    Top = 123
    Width = 136
    Height = 21
    TabOrder = 4
  end
  object btn1: TButton
    Left = 288
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
  end
  object btn2: TButton
    Left = 288
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
  end
  object btn3: TButton
    Left = 288
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 7
  end
  object dbgrd1: TDBGrid
    Left = 17
    Top = 166
    Width = 346
    Height = 169
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Index'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HiHi (alarm high) Msg'
        Width = 327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LoLo (alarm low) Msg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hi (warning high) Msg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lo (warning low) Msg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Normal Msg'
        Visible = True
      end>
  end
  object mm1: TMainMenu
    Left = 336
    Top = 344
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
