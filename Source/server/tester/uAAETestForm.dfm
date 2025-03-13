object frmAAETest: TfrmAAETest
  Left = 0
  Top = 0
  Caption = 'AAE TEST'
  ClientHeight = 269
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpInput: TGroupBox
    Left = 0
    Top = 0
    Width = 470
    Height = 193
    Align = alTop
    Caption = 'Input'
    TabOrder = 0
    object lblStateValid: TLabel
      Left = 79
      Top = 20
      Width = 51
      Height = 13
      Caption = 'State Valid'
      Color = clWindow
      ParentColor = False
    end
    object lblStateWire: TLabel
      Left = 49
      Top = 43
      Width = 81
      Height = 13
      Caption = 'State Wire Break'
      Color = clWindow
      ParentColor = False
    end
    object lblStateElmDisable: TLabel
      Left = 20
      Top = 68
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
      Color = clWindow
      ParentColor = False
    end
    object lblStateAlarmInhibited: TLabel
      Left = 29
      Top = 92
      Width = 101
      Height = 13
      Caption = 'State Alarm Inhibited'
      Color = clWindow
      ParentColor = False
    end
    object lblStateDispStat: TLabel
      Left = 14
      Top = 114
      Width = 116
      Height = 13
      Caption = 'State Display Stationary'
      Color = clWindow
      ParentColor = False
    end
    object lblValueApp: TLabel
      Left = 49
      Top = 139
      Width = 81
      Height = 13
      Caption = 'Value Application'
      Color = clWindow
      ParentColor = False
    end
    object lblHav: TLabel
      Left = 110
      Top = 163
      Width = 20
      Height = 13
      Caption = 'HAV'
      Color = clWindow
      ParentColor = False
    end
    object lblLAV: TLabel
      Left = 282
      Top = 19
      Width = 18
      Height = 13
      Caption = 'LAV'
      Color = clWindow
      ParentColor = False
    end
    object lblHYHA: TLabel
      Left = 273
      Top = 43
      Width = 27
      Height = 13
      Caption = 'HYHA'
      Color = clWindow
      ParentColor = False
    end
    object lblHYLA: TLabel
      Left = 275
      Top = 67
      Width = 25
      Height = 13
      Caption = 'HYLA'
      Color = clWindow
      ParentColor = False
    end
    object lblTHA: TLabel
      Left = 280
      Top = 91
      Width = 20
      Height = 13
      Caption = 'THA'
      Color = clWindow
      ParentColor = False
    end
    object lblTLA: TLabel
      Left = 282
      Top = 115
      Width = 18
      Height = 13
      Caption = 'TLA'
      Color = clWindow
      ParentColor = False
    end
    object lblSF: TLabel
      Left = 288
      Top = 139
      Width = 12
      Height = 13
      Caption = 'SF'
      Color = clWindow
      ParentColor = False
    end
    object lblSTA: TLabel
      Left = 281
      Top = 163
      Width = 19
      Height = 13
      Caption = 'STA'
      Color = clWindow
      ParentColor = False
    end
    object edtValueApp: TEdit
      Tag = 1
      Left = 143
      Top = 136
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 5
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object cbbStateValid: TComboBox
      Left = 143
      Top = 16
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Valid'
      OnSelect = cbbStateValidSelect
      Items.Strings = (
        'Valid'
        'Invalid')
    end
    object cbbStateWire: TComboBox
      Left = 143
      Top = 40
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Wire Break'
      OnSelect = cbbStateWireSelect
      Items.Strings = (
        'Wire Break'
        'No Wire Break')
    end
    object cbbStateElmDisable: TComboBox
      Left = 143
      Top = 64
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Disabled'
      OnSelect = cbbStateElmDisableSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object cbbAlarmInhibited: TComboBox
      Left = 143
      Top = 88
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Inhibited'
      OnSelect = cbbAlarmInhibitedSelect
      Items.Strings = (
        'Inhibited'
        'Not Inhibited')
    end
    object cbbStateDispStat: TComboBox
      Left = 143
      Top = 112
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnSelect = cbbStateDispStatSelect
      Items.Strings = (
        'Display Stationary'
        'Display Element')
    end
    object edtHAV: TEdit
      Tag = 2
      Left = 143
      Top = 160
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 6
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtLAV: TEdit
      Tag = 3
      Left = 319
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 7
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtHYHA: TEdit
      Tag = 4
      Left = 319
      Top = 40
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 8
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtHYLA: TEdit
      Tag = 5
      Left = 319
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 9
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtTHA: TEdit
      Tag = 6
      Left = 319
      Top = 88
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 10
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtTLA: TEdit
      Tag = 7
      Left = 319
      Top = 112
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 11
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtSF: TEdit
      Tag = 8
      Left = 319
      Top = 136
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 12
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
    object edtSTA: TEdit
      Tag = 9
      Left = 319
      Top = 160
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 13
      Text = '0'
      OnKeyPress = edtValueAppKeyPress
    end
  end
  object grpOutput: TGroupBox
    Left = 0
    Top = 193
    Width = 470
    Height = 76
    Align = alClient
    Caption = 'Output'
    TabOrder = 1
    object lblStateAlarm: TLabel
      Left = 42
      Top = 20
      Width = 56
      Height = 13
      Caption = 'State Alarm'
      Color = clWindow
      ParentColor = False
    end
    object lblStateElement: TLabel
      Left = 31
      Top = 44
      Width = 67
      Height = 13
      Caption = 'State Element'
      Color = clWindow
      ParentColor = False
    end
    object lblValueHMI: TLabel
      Left = 266
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Value HMI'
      Color = clWindow
      ParentColor = False
    end
    object lblValueElement: TLabel
      Left = 247
      Top = 44
      Width = 67
      Height = 13
      Caption = 'Value Element'
      Color = clWindow
      ParentColor = False
    end
    object edtStateAlarm: TEdit
      Left = 112
      Top = 17
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtStateElement: TEdit
      Left = 112
      Top = 41
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtValueHMI: TEdit
      Left = 333
      Top = 16
      Width = 100
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtValueElement: TEdit
      Left = 333
      Top = 40
      Width = 100
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
end
