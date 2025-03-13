object frmSelectElement: TfrmSelectElement
  Left = 0
  Top = 0
  Caption = 'Select Element'
  ClientHeight = 311
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object edtElementID: TEdit
    Left = 8
    Top = 16
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object lstElementID: TListBox
    Left = 8
    Top = 43
    Width = 201
    Height = 190
    ItemHeight = 13
    TabOrder = 1
    OnClick = lstElementIDClick
  end
  object btnOK: TButton
    Left = 232
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 232
    Top = 45
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 247
    Width = 299
    Height = 53
    Caption = 'Element Description'
    TabOrder = 4
    object lblElementDesc: TLabel
      Left = 8
      Top = 25
      Width = 71
      Height = 13
      Caption = 'lblElementDesc'
    end
  end
end
