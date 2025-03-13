object frmAuthorization: TfrmAuthorization
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'BasicScript'
  ClientHeight = 86
  ClientWidth = 139
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 107
    Height = 13
    Caption = 'Type in the password:'
  end
  object edtPassword: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = edtPasswordKeyPress
  end
  object btnOk: TButton
    Tag = 1
    Left = 8
    Top = 54
    Width = 57
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = CommitChange
  end
  object btnCancel: TButton
    Left = 72
    Top = 54
    Width = 57
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = CommitChange
  end
end
