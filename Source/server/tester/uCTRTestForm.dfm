object frmCTRTest: TfrmCTRTest
  Left = 0
  Top = 0
  Caption = 'CTR TEST'
  ClientHeight = 312
  ClientWidth = 296
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
    Top = 8
    Width = 281
    Height = 169
    Caption = 'INPUT'
    TabOrder = 0
    object lbl1: TLabel
      Left = 22
      Top = 27
      Width = 69
      Height = 13
      Caption = 'State No Fault'
    end
    object lbl2: TLabel
      Left = 26
      Top = 54
      Width = 65
      Height = 13
      Caption = 'State No RFU'
    end
    object lbl3: TLabel
      Left = 15
      Top = 82
      Width = 76
      Height = 13
      Caption = 'State Transition'
    end
    object lbl4: TLabel
      Left = 25
      Top = 107
      Width = 66
      Height = 13
      Caption = 'Proces Status'
    end
    object lbl5: TLabel
      Left = 22
      Top = 135
      Width = 69
      Height = 13
      Caption = 'Command HMI'
    end
    object cbbStateNoRFU: TComboBox
      Left = 117
      Top = 51
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbStateNoRFUSelect
      Items.Strings = (
        'RFU'
        'Not RFU')
    end
    object cbbStateNoFault: TComboBox
      Left = 117
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbStateNoFaultSelect
      Items.Strings = (
        'Not fault'
        'Fault')
    end
    object cbbStateTransition: TComboBox
      Left = 117
      Top = 78
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbbStateTransitionSelect
      Items.Strings = (
        'In transition'
        'Not in transition')
    end
    object cbbProcesStatus: TComboBox
      Left = 117
      Top = 105
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnSelect = cbbProcesStatusSelect
      Items.Strings = (
        'Normal'
        'Active')
    end
    object cbbCommandHMI: TComboBox
      Left = 117
      Top = 132
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnSelect = cbbCommandHMISelect
      Items.Strings = (
        'Activated'
        'Not activated')
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 239
    Width = 281
    Height = 66
    Caption = 'OUTPUT'
    TabOrder = 1
    object lbl6: TLabel
      Left = 24
      Top = 24
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object edtStateElement: TEdit
      Left = 117
      Top = 24
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object grpParameter: TGroupBox
    Left = 8
    Top = 183
    Width = 281
    Height = 50
    Caption = 'Parameter'
    TabOrder = 2
    object lbl7: TLabel
      Left = 68
      Top = 19
      Width = 23
      Height = 13
      Caption = 'TCtrl'
    end
    object edtTCtrl: TEdit
      Left = 117
      Top = 16
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtTCtrlKeyPress
    end
  end
end
