object frmSPETest: TfrmSPETest
  Left = 0
  Top = 0
  Caption = 'SPE TEST'
  ClientHeight = 160
  ClientWidth = 336
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpInput: TGroupBox
    Left = 8
    Top = 0
    Width = 321
    Height = 73
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 19
      Top = 20
      Width = 132
      Height = 13
      Caption = 'Command Enabled/Disabled'
    end
    object lbl2: TLabel
      Left = 89
      Top = 47
      Width = 62
      Height = 13
      Caption = 'HMI Setpoint'
    end
    object cbbCommandEnableDisable: TComboBox
      Left = 165
      Top = 17
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Disabled'
      OnSelect = cbbCommandEnableDisableSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object edtHMISetPoint: TEdit
      Left = 165
      Top = 44
      Width = 145
      Height = 21
      TabOrder = 1
      OnKeyPress = edtHMISetPointKeyPress
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 79
    Width = 321
    Height = 74
    Caption = 'Output'
    TabOrder = 1
    object lbl3: TLabel
      Left = 84
      Top = 20
      Width = 67
      Height = 13
      Caption = 'Element State'
    end
    object lbl4: TLabel
      Left = 78
      Top = 47
      Width = 73
      Height = 13
      Caption = 'Actual Setpoint'
    end
    object edtActualStepoint: TEdit
      Left = 165
      Top = 44
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object edtStateElement: TEdit
      Left = 165
      Top = 17
      Width = 145
      Height = 21
      TabOrder = 1
    end
  end
end
