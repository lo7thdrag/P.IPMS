object frmLogged: TfrmLogged
  Left = 0
  Top = 0
  ClientHeight = 120
  ClientWidth = 394
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
  object lbl2: TLabel
    Left = 8
    Top = 14
    Width = 65
    Height = 13
    Caption = 'Data source :'
  end
  object lbl4: TLabel
    Left = 8
    Top = 40
    Width = 43
    Height = 13
    Caption = 'User ID :'
  end
  object lbl6: TLabel
    Left = 8
    Top = 64
    Width = 47
    Height = 13
    Caption = 'Table ID :'
  end
  object lbl7: TLabel
    Left = 189
    Top = 64
    Width = 45
    Height = 13
    Caption = 'Point ID :'
  end
  object lbl5: TLabel
    Left = 189
    Top = 40
    Width = 56
    Height = 13
    Caption = 'Password : '
  end
  object cbbDatasource: TComboBox
    Left = 79
    Top = 10
    Width = 266
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      'IO Information'
      'Primary Logging - Alarms'
      'Primary Logging - Points'
      'Secondary Logging - Alarms'
      'Secondary Logging - Points'
      'UniMACS'
      'UniMACSLog')
  end
  object edtUserID: TEdit
    Left = 77
    Top = 36
    Width = 99
    Height = 21
    TabOrder = 1
  end
  object edtTableID: TEdit
    Left = 8
    Top = 85
    Width = 144
    Height = 21
    TabOrder = 2
  end
  object btnTableID: TButton
    Left = 158
    Top = 83
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnTableIDClick
  end
  object edtPointID: TEdit
    Left = 189
    Top = 85
    Width = 156
    Height = 21
    TabOrder = 4
  end
  object edtPassword: TEdit
    Left = 251
    Top = 36
    Width = 124
    Height = 21
    TabOrder = 5
  end
  object btnPickDataSource: TButton
    Left = 350
    Top = 8
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 6
  end
  object btnPointID: TButton
    Left = 350
    Top = 83
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 7
    OnClick = btnTableIDClick
  end
end
