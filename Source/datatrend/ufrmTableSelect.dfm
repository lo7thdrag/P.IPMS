object frmTableSelect: TfrmTableSelect
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Select a Table/Column'
  ClientHeight = 338
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 35
    Width = 60
    Height = 13
    Caption = 'Table Name:'
  end
  object lbl2: TLabel
    Left = 24
    Top = 62
    Width = 69
    Height = 13
    Caption = 'Column Name:'
  end
  object edtTableName: TEdit
    Left = 104
    Top = 32
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object edtColumnName: TEdit
    Left = 104
    Top = 59
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object strngrdList: TStringGrid
    Left = 8
    Top = 145
    Width = 425
    Height = 152
    ColCount = 4
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 2
    OnDrawCell = strngrdListDrawCell
    OnSelectCell = strngrdListSelectCell
    ColWidths = (
      94
      134
      88
      99)
  end
  object btnOK: TButton
    Left = 358
    Top = 30
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 358
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object btnBrowse: TButton
    Left = 358
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 5
    OnClick = btnBrowseClick
  end
end
