object frmCBATest: TfrmCBATest
  Left = 0
  Top = 0
  Caption = 'CBA TEST'
  ClientHeight = 351
  ClientWidth = 335
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpExtInterface: TGroupBox
    Left = 6
    Top = 8
    Width = 320
    Height = 65
    Caption = 'External Interface'
    TabOrder = 0
    object lblInputStatus: TLabel
      Left = 72
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object cbbInputStatus: TComboBox
      Left = 120
      Top = 29
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Element disabled'
      OnSelect = cbbInputStatusSelect
      Items.Strings = (
        'Element disabled'
        'Closed'
        'Open'
        'Transition'
        'Not RFO'
        'Not RFC'
        'Failure'
        'Local'
        'Remote'
        'Manual'
        'Auto'
        'Unknown'
        'Fault'
        'Tripped'
        'Failed to open'
        'Failed to close')
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 7
    Top = 79
    Width = 320
    Height = 266
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput: TGroupBox
      Left = 16
      Top = 24
      Width = 281
      Height = 137
      Caption = 'Input'
      TabOrder = 0
      object lblCommandOpen: TLabel
        Left = 11
        Top = 24
        Width = 76
        Height = 13
        Caption = 'Command Open'
      end
      object lblCommandClose: TLabel
        Left = 11
        Top = 50
        Width = 76
        Height = 13
        Caption = 'Command Close'
      end
      object lblManualAuto: TLabel
        Left = 26
        Top = 77
        Width = 61
        Height = 13
        Caption = 'Manual/Auto'
      end
      object lblDisableElement: TLabel
        Left = 11
        Top = 102
        Width = 75
        Height = 13
        Caption = 'Disable Element'
      end
      object cbbCommandOpen: TComboBox
        Left = 104
        Top = 20
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Not activated'
        OnSelect = cbbCommandOpenSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandClose: TComboBox
        Left = 104
        Top = 47
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Not activated'
        OnSelect = cbbCommandCloseSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbManualAuto: TComboBox
        Left = 104
        Top = 74
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Manual'
        OnSelect = cbbManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbDisableElement: TComboBox
        Left = 104
        Top = 101
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Disabled'
        OnSelect = cbbDisableElementSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
    end
    object grpOutput: TGroupBox
      Left = 16
      Top = 167
      Width = 281
      Height = 82
      Caption = 'Output'
      TabOrder = 1
      object lblStateAlarm: TLabel
        Left = 30
        Top = 23
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lblStateElement: TLabel
        Left = 19
        Top = 53
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object edtStateAlarm: TEdit
        Left = 104
        Top = 20
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object edtStateElement: TEdit
        Left = 104
        Top = 50
        Width = 145
        Height = 21
        TabOrder = 1
      end
    end
  end
end
