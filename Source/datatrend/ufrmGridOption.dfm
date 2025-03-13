object frmGrid: TfrmGrid
  Left = 0
  Top = 0
  Caption = 'frmGrid'
  ClientHeight = 287
  ClientWidth = 387
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
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Color :'
  end
  object lbl2: TLabel
    Left = 16
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Style :'
  end
  object chkShowGrid: TCheckBox
    Left = 16
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Show Grid'
    TabOrder = 0
  end
  object cbbForeground: TRzColorComboBox
    Left = 98
    Top = 45
    Width = 145
    Height = 22
    TabOrder = 1
  end
  object cbbStyle: TComboBox
    Left = 98
    Top = 73
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 3
    TabOrder = 2
    Text = 'Dot'
    Items.Strings = (
      'None'
      'Solid'
      'Dash'
      'Dot'
      'Dash Dot'
      'Dash Dot Dot')
  end
  object grp1: TGroupBox
    Left = 16
    Top = 100
    Width = 345
    Height = 149
    Caption = 'Ticks'
    TabOrder = 3
    object lbl3: TLabel
      Left = 112
      Top = 34
      Width = 39
      Height = 13
      Caption = 'Vertical:'
    end
    object lbl4: TLabel
      Left = 112
      Top = 60
      Width = 50
      Height = 13
      Caption = 'Horzontal:'
    end
    object rbFixed: TRadioButton
      Left = 24
      Top = 32
      Width = 57
      Height = 17
      Caption = 'Fixed'
      TabOrder = 0
      OnClick = rbFixedClick
    end
    object rbAxis: TRadioButton
      Left = 24
      Top = 99
      Width = 113
      Height = 17
      Caption = 'Axis ticks from line :'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbAxisClick
    end
    object rzedtVerticalTick: TRzSpinEdit
      Left = 192
      Top = 30
      Width = 47
      Height = 21
      Max = 100.000000000000000000
      Enabled = False
      TabOrder = 2
    end
    object rzedtHorizontalTick: TRzSpinEdit
      Left = 192
      Top = 56
      Width = 47
      Height = 21
      Max = 100.000000000000000000
      Enabled = False
      TabOrder = 3
    end
    object cbbAxisTick: TComboBox
      Left = 152
      Top = 97
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'Use Nearest Axis'
      Items.Strings = (
        'Use Nearest Axis')
    end
  end
end
