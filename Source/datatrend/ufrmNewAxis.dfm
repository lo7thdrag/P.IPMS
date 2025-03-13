object frmNewAxis: TfrmNewAxis
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New Axis'
  ClientHeight = 105
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 17
    Width = 38
    Height = 13
    Caption = 'Axis ID:'
  end
  object edtAxisID: TEdit
    Left = 60
    Top = 13
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 160
    Top = 12
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 161
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object rg1: TRadioGroup
    Left = 8
    Top = 40
    Width = 141
    Height = 57
    Caption = 'Axis Type'
    ItemIndex = 0
    Items.Strings = (
      'X Time'
      'Y')
    TabOrder = 3
  end
end
