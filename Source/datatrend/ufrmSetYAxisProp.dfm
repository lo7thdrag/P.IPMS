object frmSetYAxisProp: TfrmSetYAxisProp
  Left = 0
  Top = 0
  Caption = 'frmSetYAxisProp'
  ClientHeight = 200
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl4: TLabel
    Left = 7
    Top = 165
    Width = 27
    Height = 13
    Caption = 'Ticks:'
  end
  object lbl1: TLabel
    Left = 7
    Top = 9
    Width = 29
    Height = 13
    Caption = 'Label:'
  end
  object grp1: TGroupBox
    Left = 16
    Top = 38
    Width = 339
    Height = 108
    Caption = 'Limits'
    TabOrder = 0
    object lbl2: TLabel
      Left = 15
      Top = 55
      Width = 89
      Height = 13
      Caption = 'Default lower limit:'
    end
    object lbl3: TLabel
      Left = 15
      Top = 80
      Width = 91
      Height = 13
      Caption = 'Default upper limit:'
    end
    object chkAutoscale: TCheckBox
      Left = 15
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Autoscale'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkUsePoint: TCheckBox
      Left = 143
      Top = 24
      Width = 162
      Height = 17
      Caption = 'Use point display limits'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object edtLowerLimit: TEdit
      Left = 134
      Top = 51
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object edtUpperLimit: TEdit
      Left = 134
      Top = 76
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 3
      Text = '150'
    end
  end
  object chkNumbered: TCheckBox
    Left = 179
    Top = 163
    Width = 97
    Height = 17
    Caption = 'Numbered'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object edtTicks: TEdit
    Left = 55
    Top = 161
    Width = 86
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
  end
  object edtLabelAxis: TEdit
    Left = 55
    Top = 5
    Width = 313
    Height = 21
    TabOrder = 3
  end
end
