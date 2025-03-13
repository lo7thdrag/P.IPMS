object frmLoggedExpression: TfrmLoggedExpression
  Left = 0
  Top = 0
  ClientHeight = 150
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 8
    Top = 41
    Width = 65
    Height = 13
    Caption = 'Data source :'
  end
  object lbl4: TLabel
    Left = 8
    Top = 69
    Width = 43
    Height = 13
    Caption = 'User ID :'
  end
  object lbl6: TLabel
    Left = 8
    Top = 93
    Width = 47
    Height = 13
    Caption = 'Table ID :'
  end
  object lbl7: TLabel
    Left = 189
    Top = 93
    Width = 45
    Height = 13
    Caption = 'Point ID :'
  end
  object lbl5: TLabel
    Left = 189
    Top = 69
    Width = 56
    Height = 13
    Caption = 'Password : '
  end
  object lbl1: TLabel
    Left = 8
    Top = 14
    Width = 56
    Height = 13
    Caption = 'Expression:'
  end
  object cbbDatasource: TComboBox
    Left = 79
    Top = 37
    Width = 266
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'IO Information'
    Items.Strings = (
      'IO Information'
      'Primary Logging - Alarms'
      'Promary Logging - Points'
      'Secondary Logging - Alarms'
      'Secondary Logging - Points'
      'UniMACS'
      'UniMACSLog')
  end
  object edtUserID: TEdit
    Left = 77
    Top = 65
    Width = 99
    Height = 21
    TabOrder = 1
  end
  object edtTableID: TEdit
    Left = 8
    Top = 114
    Width = 144
    Height = 21
    TabOrder = 2
  end
  object btnTableID: TButton
    Left = 158
    Top = 112
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
  end
  object edtPointID: TEdit
    Left = 189
    Top = 114
    Width = 156
    Height = 21
    TabOrder = 4
  end
  object edtPassword: TEdit
    Left = 251
    Top = 65
    Width = 124
    Height = 21
    TabOrder = 5
  end
  object btnPickDataSource: TButton
    Left = 350
    Top = 35
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 6
  end
  object btnPointID: TButton
    Left = 350
    Top = 112
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 7
  end
  object edtExpression: TEdit
    Left = 79
    Top = 10
    Width = 226
    Height = 21
    TabOrder = 8
  end
  object btnSelect: TBitBtn
    Left = 312
    Top = 8
    Width = 33
    Height = 25
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
      1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
      1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
      193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
      11155557F755F777777555000755033305555577755F75F77F55555555503335
      0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
      05555757F75F75557F5505000333555505557F777FF755557F55000000355557
      07557777777F55557F5555000005555707555577777FF5557F55553000075557
      0755557F7777FFF5755555335000005555555577577777555555}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 9
  end
  object btnMenu: TBitBtn
    Left = 350
    Top = 8
    Width = 25
    Height = 25
    Caption = '>'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 10
  end
end
