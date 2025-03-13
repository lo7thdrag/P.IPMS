object frmEdtFilter: TfrmEdtFilter
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Edit Filters'
  ClientHeight = 473
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblFields: TLabel
    Left = 8
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Fields:'
  end
  object lblSelect: TLabel
    Left = 8
    Top = 148
    Width = 101
    Height = 13
    Caption = 'Select records where'
  end
  object lblSqlClause: TLabel
    Left = 8
    Top = 323
    Width = 58
    Height = 13
    Caption = 'SQL Clause:'
  end
  object lstFields: TListBox
    Left = 8
    Top = 30
    Width = 304
    Height = 112
    ItemHeight = 13
    TabOrder = 0
  end
  object lstSelect: TListBox
    Left = 8
    Top = 167
    Width = 289
    Height = 150
    ItemHeight = 13
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 191
    Top = 440
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 278
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnHelp: TButton
    Left = 366
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object btnAddCondition: TButton
    Left = 318
    Top = 30
    Width = 130
    Height = 25
    Caption = 'Add Condition...'
    TabOrder = 5
    OnClick = btnAddConditionClick
  end
  object btnModify: TButton
    Left = 318
    Top = 167
    Width = 123
    Height = 25
    Caption = 'Modify...'
    TabOrder = 6
    OnClick = btnModifyClick
  end
  object btnRemove: TButton
    Left = 318
    Top = 198
    Width = 123
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object btnAND: TButton
    Left = 318
    Top = 237
    Width = 34
    Height = 25
    Caption = 'AND'
    TabOrder = 8
    OnClick = btnANDClick
  end
  object btnOR: TButton
    Left = 406
    Top = 237
    Width = 35
    Height = 25
    Caption = 'OR'
    TabOrder = 9
    OnClick = btnORClick
  end
  object btnOpenParentheses: TButton
    Left = 317
    Top = 275
    Width = 35
    Height = 25
    Caption = '('
    TabOrder = 10
    OnClick = btnOpenParenthesesClick
  end
  object btnCloseParentheses: TButton
    Left = 358
    Top = 275
    Width = 35
    Height = 25
    Caption = ')'
    TabOrder = 11
    OnClick = btnCloseParenthesesClick
  end
  object btnNOT: TButton
    Left = 406
    Top = 275
    Width = 35
    Height = 25
    Caption = 'NOT'
    TabOrder = 12
    OnClick = btnNOTClick
  end
  object mmoSqlClause: TMemo
    Left = 8
    Top = 342
    Width = 433
    Height = 89
    ReadOnly = True
    TabOrder = 13
  end
end
