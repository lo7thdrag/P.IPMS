object frmChartOption: TfrmChartOption
  Left = 0
  Top = 0
  ClientHeight = 322
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 23
    Width = 88
    Height = 13
    Caption = 'Foreground Color:'
  end
  object lbl2: TLabel
    Left = 16
    Top = 51
    Width = 88
    Height = 13
    Caption = 'Background Color:'
  end
  object lbl3: TLabel
    Left = 16
    Top = 77
    Width = 59
    Height = 13
    Caption = 'Chart Color:'
  end
  object Label1: TLabel
    Left = 16
    Top = 104
    Width = 106
    Height = 13
    Caption = 'Auto update interval :'
  end
  object lbl4: TLabel
    Left = 16
    Top = 130
    Width = 107
    Height = 13
    Caption = 'Runtime refresh rate :'
  end
  object lbl5: TLabel
    Left = 16
    Top = 156
    Width = 67
    Height = 13
    Caption = 'Base project :'
  end
  object cbbForeground: TRzColorComboBox
    Left = 138
    Top = 19
    Width = 145
    Height = 22
    TabOrder = 0
  end
  object cbbBackground: TRzColorComboBox
    Left = 138
    Top = 47
    Width = 145
    Height = 22
    TabOrder = 1
  end
  object cbbChart: TRzColorComboBox
    Left = 138
    Top = 73
    Width = 145
    Height = 22
    TabOrder = 2
  end
  object medtAutoUpdate: TMaskEdit
    Left = 138
    Top = 100
    Width = 145
    Height = 21
    EditMask = '!90:00:00;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '00:05:00'
    Visible = False
  end
  object medtRuntimeRefresh: TMaskEdit
    Left = 138
    Top = 126
    Width = 145
    Height = 21
    EditMask = '!90:00:00;1;_'
    MaxLength = 8
    TabOrder = 4
    Text = '00:05:00'
    Visible = False
  end
  object cbb3: TComboBox
    Left = 140
    Top = 153
    Width = 143
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 5
    Text = 'HMI'
    Items.Strings = (
      'HMI')
  end
  object chkShowButton: TCheckBox
    Left = 16
    Top = 187
    Width = 97
    Height = 17
    Caption = 'Show Button'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object chk2ndSlider: TCheckBox
    Left = 140
    Top = 187
    Width = 97
    Height = 17
    Caption = 'Show 2nd Slider'
    TabOrder = 7
  end
  object rg1: TRadioGroup
    Left = 16
    Top = 210
    Width = 267
    Height = 55
    Caption = 'Update style'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Jump scroll'
      'Strip chart')
    TabOrder = 8
  end
  object btnAdvance: TButton
    Left = 16
    Top = 275
    Width = 75
    Height = 25
    Caption = 'Advance'
    TabOrder = 9
  end
end
