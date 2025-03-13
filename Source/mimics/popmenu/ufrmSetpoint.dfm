object frmSetpoint: TfrmSetpoint
  Left = 0
  Top = 0
  Caption = 'Setpoint'
  ClientHeight = 101
  ClientWidth = 190
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
  object edtValPoint: TEdit
    Left = 8
    Top = 16
    Width = 172
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 105
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
