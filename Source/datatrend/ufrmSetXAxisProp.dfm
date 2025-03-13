object frmSetXAxisProp: TfrmSetXAxisProp
  Left = 0
  Top = 0
  ClientHeight = 200
  ClientWidth = 390
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
  object lbl1: TLabel
    Left = 7
    Top = 9
    Width = 29
    Height = 13
    Caption = 'Label:'
  end
  object lbl4: TLabel
    Left = 7
    Top = 165
    Width = 27
    Height = 13
    Caption = 'Ticks:'
  end
  object lbl5: TLabel
    Left = 16
    Top = 44
    Width = 45
    Height = 13
    Caption = 'Duration:'
  end
  object edtLabelAxis: TEdit
    Left = 55
    Top = 5
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object edtTicks: TEdit
    Left = 55
    Top = 161
    Width = 86
    Height = 21
    Alignment = taRightJustify
    TabOrder = 1
    Text = '0'
  end
  object chkNumbered: TCheckBox
    Left = 179
    Top = 163
    Width = 97
    Height = 17
    Caption = 'Numbered'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object medtDuration: TMaskEdit
    Left = 88
    Top = 40
    Width = 119
    Height = 21
    EditMask = '!90:00:00;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '00:05:00'
  end
  object chkNoScroll: TCheckBox
    Left = 224
    Top = 42
    Width = 97
    Height = 17
    Caption = 'No Scroll'
    TabOrder = 4
  end
  object grp2: TGroupBox
    Left = 16
    Top = 62
    Width = 337
    Height = 86
    Caption = 'Start Time'
    TabOrder = 5
    object cbbStartDay: TComboBox
      Left = 10
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Show most recent'
      OnChange = cbbStartDayChange
      Items.Strings = (
        'Show most recent'
        'Start Date'
        'Now minus days')
    end
    object cbbStartTime: TComboBox
      Left = 10
      Top = 51
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Start time'
      Visible = False
      Items.Strings = (
        'Start time'
        'Now minus time')
    end
    object medtStartTime: TMaskEdit
      Left = 172
      Top = 51
      Width = 147
      Height = 21
      EditMask = '!90:00:00;1;_'
      MaxLength = 8
      TabOrder = 3
      Text = '00:05:00'
      Visible = False
    end
    object medtStartDay: TMaskEdit
      Left = 172
      Top = 24
      Width = 147
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '01/01/2014'
      Visible = False
    end
  end
end
