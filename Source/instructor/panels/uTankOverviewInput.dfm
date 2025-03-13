object frmTankOverInput: TfrmTankOverInput
  Left = -848
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TankOverInput'
  ClientHeight = 189
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 16
    Top = 16
    Width = 185
    Height = 65
    TabOrder = 0
    object lbl1: TLabel
      Left = 39
      Top = 4
      Width = 110
      Height = 13
      Caption = 'Value Element (M3)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTankOvInput: TEdit
      Left = 19
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 0
      Text = '0'
    end
  end
  object pnl2: TPanel
    Left = 16
    Top = 88
    Width = 185
    Height = 65
    TabOrder = 1
    object lbl2: TLabel
      Left = 48
      Top = 4
      Width = 80
      Height = 13
      Caption = 'State Element'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbStateTankOvEle: TComboBox
      Left = 19
      Top = 23
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Enabled'
      Items.Strings = (
        'Enabled'
        'Disabled')
    end
  end
  object btnTankOvInput: TButton
    Left = 16
    Top = 159
    Width = 89
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnTankOvInputClick
  end
  object btnCancel: TButton
    Left = 112
    Top = 159
    Width = 89
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
