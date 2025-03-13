object frmSelectValue: TfrmSelectValue
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Select Values'
  ClientHeight = 270
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 8
    Top = 235
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 95
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnHelp: TButton
    Left = 182
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object pnlField_CheckList: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 229
    BevelOuter = bvNone
    TabOrder = 5
    object chklstCL_List: TCheckListBox
      Left = 56
      Top = 8
      Width = 153
      Height = 217
      ItemHeight = 13
      Items.Strings = (
        'Acknowledge'
        'Delete'
        'Generate'
        'Normal'
        'Reset')
      TabOrder = 0
      OnKeyPress = KeyPress
    end
  end
  object pnlField_IntegerDouble: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 229
    BevelOuter = bvNone
    TabOrder = 4
    object edtID_Value1: TEdit
      Left = 8
      Top = 123
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = KeyPress
    end
    object rbID_Between: TRadioButton
      Tag = 2
      Left = 8
      Top = 31
      Width = 113
      Height = 17
      Caption = 'Between'
      TabOrder = 1
      OnClick = RadioButtonClick
    end
    object rbID_Equals: TRadioButton
      Tag = 1
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Equals'
      TabOrder = 2
      OnClick = RadioButtonClick
    end
    object rbID_GreaterThan: TRadioButton
      Tag = 4
      Left = 8
      Top = 77
      Width = 113
      Height = 17
      Caption = 'Greater Than'
      TabOrder = 3
      OnClick = RadioButtonClick
    end
    object rbID_IsNull: TRadioButton
      Tag = 5
      Left = 8
      Top = 100
      Width = 113
      Height = 17
      Caption = 'Is Null'
      TabOrder = 4
      OnClick = RadioButtonClick
    end
    object rbID_LessThan: TRadioButton
      Tag = 3
      Left = 8
      Top = 54
      Width = 113
      Height = 17
      Caption = 'Less Than'
      TabOrder = 5
      OnClick = RadioButtonClick
    end
    object edtID_Value2: TEdit
      Left = 8
      Top = 177
      Width = 145
      Height = 21
      TabOrder = 6
      OnKeyPress = KeyPress
    end
  end
  object pnlField_DateTime: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 229
    BevelOuter = bvNone
    TabOrder = 3
    object dtpDT_Date1: TDateTimePicker
      Left = 8
      Top = 123
      Width = 186
      Height = 21
      Date = 41533.449705057870000000
      Format = 'dd/MM/yyyy'
      Time = 41533.449705057870000000
      TabOrder = 0
      OnKeyPress = KeyPress
    end
    object rbDT_Between: TRadioButton
      Tag = 2
      Left = 8
      Top = 31
      Width = 113
      Height = 17
      Caption = 'Between'
      TabOrder = 1
      OnClick = RadioButtonClick
    end
    object rbDT_Equals: TRadioButton
      Tag = 1
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Equals'
      TabOrder = 2
      OnClick = RadioButtonClick
    end
    object rbDT_GreaterThan: TRadioButton
      Tag = 4
      Left = 8
      Top = 77
      Width = 113
      Height = 17
      Caption = 'Greater Than'
      TabOrder = 3
      OnClick = RadioButtonClick
    end
    object rbDT_IsNull: TRadioButton
      Tag = 5
      Left = 8
      Top = 100
      Width = 113
      Height = 17
      Caption = 'Is Null'
      TabOrder = 4
      OnClick = RadioButtonClick
    end
    object rbDT_LessThan: TRadioButton
      Tag = 3
      Left = 8
      Top = 54
      Width = 113
      Height = 17
      Caption = 'Less Than'
      TabOrder = 5
      OnClick = RadioButtonClick
    end
    object dtpDT_Date2: TDateTimePicker
      Left = 8
      Top = 177
      Width = 186
      Height = 21
      Date = 41533.449705057870000000
      Format = 'dd/MM/yyyy'
      Time = 41533.449705057870000000
      TabOrder = 6
      OnKeyPress = KeyPress
    end
    object dtpDT_Time1: TDateTimePicker
      Left = 8
      Top = 150
      Width = 137
      Height = 21
      Date = 41669.573464398150000000
      Format = 'HH:mm:ss'
      Time = 41669.573464398150000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 7
      OnKeyPress = KeyPress
    end
    object dtpDT_Time2: TDateTimePicker
      Left = 8
      Top = 204
      Width = 137
      Height = 21
      Date = 41669.573464398150000000
      Format = 'HH:mm:ss'
      Time = 41669.573464398150000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 8
      OnKeyPress = KeyPress
    end
  end
end
