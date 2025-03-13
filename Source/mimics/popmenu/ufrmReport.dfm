object frmReport: TfrmReport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmReport'
  ClientHeight = 265
  ClientWidth = 294
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
  object cbbReportType: TComboBox
    Left = 8
    Top = 8
    Width = 276
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbbReportTypeChange
    Items.Strings = (
      'Engineroom_Report'
      'Running_Hours')
  end
  object lstReportFile: TListBox
    Left = 8
    Top = 35
    Width = 276
    Height = 180
    ItemHeight = 13
    TabOrder = 1
    OnMouseDown = lstReportFileMouseDown
  end
  object btnOK: TButton
    Left = 107
    Top = 232
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 203
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
