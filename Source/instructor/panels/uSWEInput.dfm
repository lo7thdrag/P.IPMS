object frmSWEInput: TfrmSWEInput
  Left = -562
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SWE Input'
  ClientHeight = 191
  ClientWidth = 213
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
      Left = 68
      Top = 4
      Width = 33
      Height = 13
      Caption = 'alarm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbBilgeInState: TComboBox
      Left = 20
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'False'
      Items.Strings = (
        'True'
        'False')
    end
  end
  object pnl2: TPanel
    Left = 16
    Top = 87
    Width = 185
    Height = 65
    TabOrder = 1
    object lbl2: TLabel
      Left = 47
      Top = 4
      Width = 83
      Height = 13
      Caption = 'State Element '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbBilgeStateElement: TComboBox
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
  object btnBilgeOK: TButton
    Left = 16
    Top = 158
    Width = 81
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnBilgeOKClick
  end
  object pnl3: TPanel
    Left = 536
    Top = 16
    Width = 185
    Height = 65
    TabOrder = 3
    Visible = False
    object lbl3: TLabel
      Left = 50
      Top = 4
      Width = 85
      Height = 13
      Caption = 'State Inhibited'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbBilgeStateInhibited: TComboBox
      Left = 20
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Not inhibited'
      Items.Strings = (
        'Inhibited'
        'Not inhibited')
    end
  end
  object pnl4: TPanel
    Left = 738
    Top = 16
    Width = 185
    Height = 65
    TabOrder = 4
    Visible = False
    object lbl4: TLabel
      Left = 68
      Top = 4
      Width = 35
      Height = 13
      Caption = 'NO/NC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbBilgeNONC: TComboBox
      Left = 20
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'NO'
      Items.Strings = (
        'NO'
        'NC')
    end
  end
  object pnl5: TPanel
    Left = 536
    Top = 95
    Width = 185
    Height = 65
    TabOrder = 5
    Visible = False
    object lbl5: TLabel
      Left = 69
      Top = 4
      Width = 31
      Height = 13
      Caption = 'Mode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbBilgeMode: TComboBox
      Left = 20
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Alarm'
      Items.Strings = (
        'Alarm'
        'No Alarm')
    end
  end
  object pnl6: TPanel
    Left = 738
    Top = 95
    Width = 185
    Height = 65
    TabOrder = 6
    Visible = False
    object lbl6: TLabel
      Left = 69
      Top = 4
      Width = 39
      Height = 13
      Caption = 'TDelay'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtBilgeTDelay: TEdit
      Left = 19
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 0
      Text = '30'
    end
  end
  object btnCancel: TButton
    Left = 120
    Top = 158
    Width = 81
    Height = 25
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
end
