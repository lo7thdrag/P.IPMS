object frmSelectFieldView: TfrmSelectFieldView
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Select fields to view'
  ClientHeight = 386
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAvailableField: TLabel
    Left = 8
    Top = 47
    Width = 77
    Height = 13
    Caption = 'Avalaible Fields:'
  end
  object lblSqlClause: TLabel
    Left = 8
    Top = 262
    Width = 58
    Height = 13
    Caption = 'SQL Clause:'
  end
  object chklstAvailableField: TCheckListBox
    Left = 8
    Top = 66
    Width = 185
    Height = 190
    OnClickCheck = chklstAvailableFieldClickCheck
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = chklstAvailableFieldDblClick
  end
  object btnUp: TButton
    Left = 207
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Up'
    TabOrder = 1
    OnClick = btnUpClick
  end
  object btnDown: TButton
    Left = 207
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Down'
    TabOrder = 2
    OnClick = btnDownClick
  end
  object btnOK: TButton
    Left = 175
    Top = 353
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 272
    Top = 353
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnHelp: TButton
    Left = 368
    Top = 353
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 5
    OnClick = btnHelpClick
  end
  object chkSelectAll: TCheckBox
    Left = 8
    Top = 15
    Width = 185
    Height = 17
    Caption = 'Select all fields in the table'
    TabOrder = 6
    OnClick = chkSelectAllClick
  end
  object mmoSqlClause: TMemo
    Left = 8
    Top = 281
    Width = 435
    Height = 66
    ReadOnly = True
    TabOrder = 7
  end
end
