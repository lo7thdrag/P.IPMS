object frmAuxSystemOverview: TfrmAuxSystemOverview
  Left = -1162
  Top = 18
  Caption = 'Auxilary System Overview'
  ClientHeight = 689
  ClientWidth = 1357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFreshSeaWater: TPanel
    Left = 1089
    Top = 351
    Width = 209
    Height = 339
    TabOrder = 1
    Visible = False
    object pnl12: TPanel
      Left = 13
      Top = 11
      Width = 185
      Height = 98
      TabOrder = 0
      object lbl14: TLabel
        Left = 44
        Top = 10
        Width = 96
        Height = 13
        Caption = 'FW GENERATOR 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFWGen1RunTT: TButton
        Tag = 1
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5310A0001B'
        Caption = 'RUNNING'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btnFWGen1FailT: TButton
        Tag = 1
        Left = 16
        Top = 60
        Width = 153
        Height = 25
        Hint = '5310A0001A'
        Caption = 'FAILURE'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl13: TPanel
      Left = 13
      Top = 115
      Width = 185
      Height = 98
      TabOrder = 1
      object lbl15: TLabel
        Left = 50
        Top = 10
        Width = 96
        Height = 13
        Caption = 'FW GENERATOR 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFWGen2RunT: TButton
        Tag = 1
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5310A0002B'
        Caption = 'RUNNING'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btnFWGen2FailT: TButton
        Tag = 1
        Left = 16
        Top = 60
        Width = 153
        Height = 25
        Hint = '5310A0002A'
        Caption = 'FAILURE'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl14: TPanel
      Left = 13
      Top = 219
      Width = 185
      Height = 104
      TabOrder = 2
      object lbl16: TLabel
        Left = 50
        Top = 4
        Width = 81
        Height = 26
        Caption = 'HOT AND COLD'#13#10'  WATER UNIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnHotColdP12T: TButton
        Tag = 1
        Left = 16
        Top = 38
        Width = 153
        Height = 25
        Hint = '5322A0001B'
        Caption = 'PUMP 1 PUMP 2'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btnHotColdFailT: TButton
        Tag = 1
        Left = 16
        Top = 69
        Width = 153
        Height = 25
        Hint = '5322A0001A'
        Caption = 'GENERAL FAILURE'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
  end
  object pnlAuxOverview: TPanel
    Left = 482
    Top = 139
    Width = 601
    Height = 555
    TabOrder = 0
    Visible = False
    object pnl1: TPanel
      Left = 16
      Top = 16
      Width = 185
      Height = 105
      TabOrder = 0
      object lbl1: TLabel
        Left = 57
        Top = 10
        Width = 81
        Height = 13
        Caption = 'STARTING AIR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnStartAirComp1T: TButton
        Left = 16
        Top = 32
        Width = 153
        Height = 25
        Hint = '5511A0001A'
        Caption = 'COMPRESSOR 1'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btnStartAirComp2T: TButton
        Left = 16
        Top = 63
        Width = 153
        Height = 25
        Hint = '5511A0002A'
        Caption = 'COMPRESSOR 2'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl7: TPanel
      Left = 224
      Top = 16
      Width = 361
      Height = 105
      TabOrder = 1
      object lbl7: TLabel
        Left = 17
        Top = 20
        Width = 133
        Height = 13
        Caption = 'PROVIS REFRIG SYSTEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 17
        Top = 51
        Width = 110
        Height = 13
        Caption = 'COLD FREEZE STORE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn8: TButton
        Left = 192
        Top = 15
        Width = 153
        Height = 25
        Hint = '5162A0001A'
        Caption = 'GENERAL FAILURE'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btn9: TButton
        Left = 192
        Top = 46
        Width = 153
        Height = 25
        Hint = '4363E5001A'
        Caption = 'LOCK IN ALARM'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl8: TPanel
      Left = 224
      Top = 127
      Width = 185
      Height = 73
      TabOrder = 2
      object lbl9: TLabel
        Left = 57
        Top = 10
        Width = 63
        Height = 13
        Caption = 'RUDDER PS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnRudderPST: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5610E0005A'
        Caption = 'GENERAL ALARM'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl2: TPanel
      Left = 16
      Top = 127
      Width = 185
      Height = 73
      TabOrder = 3
      object lbl2: TLabel
        Left = 49
        Top = 10
        Width = 86
        Height = 13
        Caption = 'CHILLER UNIT 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnChillUnit1T: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5161A0001A'
        Caption = 'FAILURE'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl3: TPanel
      Left = 16
      Top = 206
      Width = 185
      Height = 73
      TabOrder = 4
      object lbl3: TLabel
        Left = 49
        Top = 10
        Width = 86
        Height = 13
        Caption = 'CHILLER UNIT 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnChillUnit2T: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5161A0002A'
        Caption = 'FAILURE'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl9: TPanel
      Left = 224
      Top = 206
      Width = 185
      Height = 73
      TabOrder = 5
      object lbl10: TLabel
        Left = 57
        Top = 10
        Width = 63
        Height = 13
        Caption = 'RUDDER SB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnRUDDERSBT: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5610E0005B'
        Caption = 'GENERAL ALARM'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl11: TPanel
      Left = 224
      Top = 285
      Width = 185
      Height = 73
      TabOrder = 6
      object lbl12: TLabel
        Left = 49
        Top = 3
        Width = 89
        Height = 13
        Caption = 'ALARM COLUMN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl13: TLabel
        Left = 33
        Top = 17
        Width = 127
        Height = 13
        Caption = 'AUDIO/VISUAL ALARM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAlarmColumnAudioT: TButton
        Left = 16
        Top = 35
        Width = 153
        Height = 25
        Hint = '4365E5011B'
        Caption = 'SUPPLY MISSING'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl4: TPanel
      Left = 16
      Top = 285
      Width = 185
      Height = 73
      TabOrder = 7
      object lbl4: TLabel
        Left = 33
        Top = 10
        Width = 125
        Height = 13
        Caption = 'SEWAGE TREATM UNIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn5T: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5281A0001A'
        Caption = 'GENERAL FAILURE'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl5: TPanel
      Left = 16
      Top = 364
      Width = 185
      Height = 73
      TabOrder = 8
      object lbl5: TLabel
        Left = 58
        Top = 10
        Width = 59
        Height = 13
        Caption = 'ICCP/ICAP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnICCPT: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '6331E0001A'
        Caption = 'GENERAL FAILURE'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl10: TPanel
      Left = 224
      Top = 364
      Width = 185
      Height = 73
      TabOrder = 9
      object lbl11: TLabel
        Left = 25
        Top = 5
        Width = 138
        Height = 13
        Caption = 'ACCOMODATION LADDER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAccomodLadderT: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '6234E0004A'
        Caption = 'GENERAL ALARM'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl15: TPanel
      Left = 224
      Top = 443
      Width = 185
      Height = 98
      TabOrder = 10
      object lbl17: TLabel
        Left = 26
        Top = 10
        Width = 134
        Height = 13
        Caption = 'OILY BILGE WATER UNIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPilyBilgeppmT: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '5932A0001A'
        Caption = '15 ppm'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
      object btnOilyBilgeFailT: TButton
        Left = 16
        Top = 60
        Width = 153
        Height = 25
        Hint = '5932A0001B'
        Caption = 'FAILURE'
        TabOrder = 1
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
    object pnl6: TPanel
      Left = 16
      Top = 443
      Width = 185
      Height = 73
      TabOrder = 11
      object lbl6: TLabel
        Left = 42
        Top = 10
        Width = 110
        Height = 13
        Caption = 'MED TREATM ROOM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn7T: TButton
        Left = 16
        Top = 29
        Width = 153
        Height = 25
        Hint = '4364E5001A'
        Caption = 'CALL ALARM'
        TabOrder = 0
        OnMouseDown = btnStartAirComp1TMouseDown
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = -16
    Width = 1311
    Height = 675
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label32: TLabel
      Left = 951
      Top = 471
      Width = 185
      Height = 150
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'HOLD AND COLD '#13#10'WATER UNIT'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label28: TLabel
      Left = 951
      Top = 260
      Width = 185
      Height = 132
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'FW GENERATOR 2'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label26: TLabel
      Left = 951
      Top = 54
      Width = 185
      Height = 132
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'FW GENERATOR 1'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label20: TLabel
      Tag = 10
      Left = 540
      Top = 281
      Width = 270
      Height = 123
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'BILGE W TK'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label22: TLabel
      Left = 460
      Top = 54
      Width = 391
      Height = 95
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label30: TLabel
      Left = 175
      Top = 54
      Width = 185
      Height = 95
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'STARTING AIR'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label31: TLabel
      Left = 177
      Top = 76
      Width = 181
      Height = 71
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 175
      Top = 187
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'CHILLER UNIT 1'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 177
      Top = 209
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 175
      Top = 256
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'CHILLER UNIT 2'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 177
      Top = 278
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 175
      Top = 359
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'SEWAGE TREATM UNIT'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 177
      Top = 381
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 175
      Top = 461
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'ICCP/ ICAP'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 177
      Top = 483
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 175
      Top = 558
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'MED TREATM ROOM'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 177
      Top = 580
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 666
      Top = 187
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'RUDDER PS'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 668
      Top = 209
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label13: TLabel
      Left = 460
      Top = 187
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'RUDDER SB'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 462
      Top = 209
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 563
      Top = 449
      Width = 185
      Height = 75
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'ALARM COLUMN'#13#10'AUDIO/ VISUAL ALARM'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 565
      Top = 483
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 563
      Top = 558
      Width = 185
      Height = 63
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'ACCOMODATION LADDER'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 565
      Top = 580
      Width = 181
      Height = 39
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label19: TLabel
      Left = 542
      Top = 301
      Width = 266
      Height = 100
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label21: TLabel
      Left = 469
      Top = 76
      Width = 181
      Height = 65
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 484
      Top = 54
      Width = 150
      Height = 16
      Alignment = taCenter
      Caption = 'PROVIS REFRIG SYSTEM'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label24: TLabel
      Left = 687
      Top = 54
      Width = 124
      Height = 16
      Alignment = taCenter
      Caption = 'COLD FREEZE STORE'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label25: TLabel
      Left = 953
      Top = 76
      Width = 181
      Height = 108
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label27: TLabel
      Left = 953
      Top = 282
      Width = 181
      Height = 108
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label29: TLabel
      Left = 953
      Top = 511
      Width = 181
      Height = 108
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label33: TLabel
      Left = 659
      Top = 76
      Width = 181
      Height = 65
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btn1: TSpeedButton
      Tag = 10
      Left = 610
      Top = 327
      Width = 28
      Height = 28
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000060000000180000000100
        180000000000001B0000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1
        D5C9D1D5C9D1D5C9D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D5C9D1D5
        C9D1D5C9D1D5C9D1D5C8D0D4C9D0D4C9D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9
        D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D2CCCED9D5CEE3D7D0E4D7D0E4D7D0
        E4D7D0E4D7D0E4D6CEE4D1CDDFCAD0D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3C8D0D4CBD3D7
        CDD6DACDD6DACED6DBCED7DBCED7DBCDD6DACAD2D6C7D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D1D5CAD3D7CCD5D9CCD5D9CDD5DACDD6DACDD6DACCD5D9CAD3D7C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C7D0D4C8D1D5CAD3D7CDD6DACDD6DACDD6DBCED7DBCED8DBCD
        D6DACAD3D7C7D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CDD5D9C1C1CD99B5A37BB98381BA8983BA8B83BA
        8B83BA8B82BA8A7EB88581B589B3C1BDC9CFD5CAD2D6C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D1D5CCD5D9B5BDC19EA4A6969A9C
        999D9F999DA0999EA09A9EA19A9FA1969B9D9CA1A4BCC4C8C9D1D5C9D1D5C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CCD4D8BA
        C1C6A8AEB2A3A8ABA6AAADA6ACAFA7ADB0A8ADB0A8AEB0A3A9ACAAB0B2C1C8CC
        CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D1D5CDD6DAB8BFC3A0A6A8989C9E9B9FA09B9FA29BA1A39CA1A39BA1A396
        9C9EA1A6A9BFC6CACBD3D7C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8CFD3CFD9DDC6B7D35BA16007A70700A90001A90001A9
        0001A90000AC0000A8001C9C1DA0BAA9CDD0D9CCD3D8C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CDD7DBB4BBC07B7D7F5F5E5E
        686768686768686868686768696868626261747677BDC4C8CCD4D8CAD2D6C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CED7DBAF
        B7BB7B7E7F6363626768676868686869686868686968695F605F7B7D7FBDC5C8
        CCD4D8CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C9D1D5CED7DBB6BDC27C7E80605F5F6867686867686868686867686968695F
        5F5E797B7DBFC7CBCCD5D9C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D1D4E1D3EE7DBD8409B10900C80000C80000C8
        0000C80000CC0009BF0954A258BECECAD0D5DDC9D0D5C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5D5DDE2989D9F707070
        7F7F7F7F7F7F7F7F7F7F7F7F7D7C7C7B7C7B94979ACFD7DCCBD3D7C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5D2
        DADF9193966E6D6E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7D757677929699D0D8DD
        CBD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4D5DEE2989C9F7171727E7E7E7F7F7F7F7F7F7F7F7F7D7C7C79
        7A7A999EA0D2D9DECBD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C7D0D3D5D8E3B5C0BF53B05705CB0500C80000C7
        0000CA0000BF001FB621B6C5C0CDD3D8CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D9DDBAC1C5919496
        7A7A797E7E7E7E7E7E8181816C6C6C88898BC9D0D4CCD4D8C8D1D5C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3D1
        DADEB3BABD8B8E8F7C7B7B7E7E7E7E7E7E8181816A6A69898D8DC2CACECED6DA
        C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4D0D9DDBAC1C59195967A7A797D7D7D7E7E7E8080806969688E
        9293CAD2D6CDD5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CBD3D7D7D1E493BC9B0AA90B00C40000C8
        0000CD0010B7116AAC6FD7D9E3CDD3D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CBD3D7D2DBDFA2A7A9
        696A697E7E7E7E7E7E7B7B7B797A7BA2A9ABD7DFE3CAD2D6C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CB
        D3D7D1D9DE9DA2A36C6C6B7D7D7D7E7E7E7D7C7C757677A5ABAFD6DFE4C9D1D6
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4CBD2D6D3DDE1A1A5A96B6B6A7D7D7D7E7E7E7B7B7B787B7CA9
        AFB3D6DEE2C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D2DADAE7BDC9C856A55B06C80600CC
        0000B90040B245C0C3CAD0D6DCC9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D5DEE2BCC3C7
        898C8D7B7B7A818180676665919698C8D0D5CED6DAC8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7
        CFD3D7E0E5B5BCC08284867B7B7B7F7F7F686867959A9CC6CED2CFD8DCC7CFD3
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C7CFD3D6DFE3BBC4C78A8D8E7B7979808080656464999EA1C9
        D2D6CDD5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CCD5D9D2D3DFA9C2B215B81600C9
        0015AC1785B58EE0DBEEC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CCD4D8D1DADD
        B2B8BA707271797878787A7CB0B7BAD5DDE2C5CDD1C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        CFD3CDD6DACFD8DDAAB0B47172717B7B7B747676B6BCBFD4DDE0C6CFD3C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4CBD4D8D1DBDEB0B6B96F6E6F7978787B7E7FB8BFC2D2
        DBDFC5CDD1C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D1D4C9D1D5D6D9E3CBD7D759A15F0DB4
        0D6ABB6FCAC5D5D0D6DCCAD1D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CAD2D6D7E0E4
        C7CFD38387897B7C7BAAAFB3CCD4D9CFD8DCCBD3D7C9D1D5C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5C9D1D4D7E0E4BFC5C97A7D7E7B7B7CABB0B4C9D0D5CED6DAC9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C9D1D5CBD3D7D9E2E6C6CED284888A7D7E7FB0B7BBCDD6DAD1
        D9DDCBD3D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6CDD5DBD3DBE0D1D9DEB9C2C48F96
        96B0B7BAD4DBE0D1D9DECED6DBC9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CCD4D8
        C9D2D6B5BDC0929799B9C0C3CFD6DACCD4D7C9D2D5C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5CCD4D8D2DBDFCCD5D8B0B8BA909597C0C7CBD2DADED0D9DDCCD5D9C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C6CED2C5CDD1C8D0D4C6CFD2B3BBBE93989ABBC3C6CAD2D5C8
        D0D3C7CFD3C8CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CCD4D8C0C1CB8DB39469B37077B67E7DB4837EAE
        847BB28277B57D70B57577B97CB9C4C4CBD0D6CAD2D6C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CBD3D7B6BEC0989C9F8D8F91
        939798969A9C989C9D969A9B9498999093949CA0A2C0C7CBC9D1D5C9D1D5C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CAD2D6B6
        BDBF9B9FA2939698989C9F9A9EA1999D9E9A9EA0999D9F95999AA5AAACC4CCD0
        CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4CBD3D7B4BCBE939799888A8B8F9293949799979B9C9295968F92938A
        8D8E9DA1A3C4CCD0CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CCD4D9C2B8CD57B25B02BC0219BC1A1EBF1F24C3
        261EC02017BE1715B61534A936B8C5C2CED2DBCAD2D6C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D5CBD3D7B6BDC0898B8C767576
        808080818282848585818282808181777777868889C5CDD2CBD3D7C9D1D5C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CAD2D6B2
        B9BD8587897776778081818384848687888182828081817474748E9395C9D2D6
        CBD3D7C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4CBD3D7B7BEC1888A8B77767680808080818182838380818180818173
        74748F9294CBD4D8CBD3D7C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CBD2D6D2C8DD58BA5D00BD0000CB0000C90000C9
        0000C90000CD0009C20A49AE4FC4D1D0D0D4DCC9D1D5C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CAD1D68D90926F6F6E
        7F7F7F7C7C7C7C7C7C7D7C7C7C7C7C7A7B7B93999BD0D8DCCAD2D6C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C6
        CDD287898B7170707F7E7E7C7C7C7C7B7B7C7C7C7C7C7B79797A9DA1A4D3DCE0
        CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C9D1D5CBD3D78A8D90706F707F7F7F7D7D7D7D7C7C7D7D7D7D7C7C7D
        7D7EA1A7A9D4DCE0C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C9CFD4D9D9E789BF921AAF1C00C70000C70000C7
        0000C80001C30129BE2B97C4A1CCD7D9CCD2D9C8CFD3C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D3DCE1A7ACB07C7D7E
        7878787E7E7E7E7E7E7F7F7F7575758B8D8EB9BFC2CED7DBC9D1D5C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5D2
        DBE09FA4A7797A7A7979787E7E7E7E7E7E7E7E7E767776909393BDC4C7D1DADF
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C9D1D5D3DBDFA8ADB07D7F7F7676757F7F7F7E7E7E7E7E7E74747493
        9496C1C8CBCFD7DBC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C9D0D5D0D4DDBDCFC761C16500B90000C80000C7
        0000C90012B51264B369C8DAD2C8D1D4C9D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CCD4D8C7CFD39A9E9F
        7071707E7E7E7E7E7E7D7C7C797B7BA1A5A7D0D7DBC7CFD3C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CC
        D4D8C4CBCE9295977170718080807E7E7E7C7C7C797C7CA9AEB1D1D8DCC7CFD3
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4CCD4D8CAD0D5989C9E7272728080807E7E7E7B7B7B7E8182AD
        B3B7D1D8DDC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D0D5D4D7E09DC6A62BAD2E00C90000C8
        0003C70341C443AFC8B8CFD4DBC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D3DBE0B4BABC
        8284847D7D7D7E7E7D757574999C9FC2CACDCCD4D9C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4D2DBDFAAB0B37D7F7F7D7D7C7D7D7D7777769EA3A5C4CCD0CDD5D9C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4D4DDE1B3BABC8285867A7A797D7D7D767877A6AAADC9
        D2D5CBD5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8CFD4D2D5DFBBD0C666BD6B02B60200C8
        0014B51582C08ADBD9E8C8CFD4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CED6DBC4CCCF
        9A9FA1706F707E7E7E7A7D7CB1B7BAD4DCE1C7D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5CFD7DBC0C6CA9195976F6E6E7F7F7F7E7F7FBBC1C4D2DADEC7CFD3C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4CDD5D9C5CCD09A9EA16E6D6E7E7F7F828485BFC5C9D3
        DCE0C6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD1D6CDD5D9A1CEAA21A92402B5
        0149B84DB4C9C0DBD8E8C6CFD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5D0D8DD
        B6BCBF7475766E6E6E959899C2CACDD0D8DCC7CFD3C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C9D1D6D0D8DDACB1B36D6E6E7272729DA1A3C8CFD4CFD8DCC7CED2C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4D1DADEB3BABD747575737373A3A6A9C7CED2CD
        D5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8CFD4D1D5DDC3D2CF7AB98250B2
        5492C599CAD2D6CCD1D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CDD6DA
        C6CDD1A7ACAF989C9EB7BDC1C8D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4CFD7DCC1C9CD9FA6A69A9D9FBDC3C6C9D2D6C9D2D6C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C9D1D5CCD4D8C4CCD0AFB4B7A7ACAFBFC6C9C8D1D4C9
        D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D3C9CFD5D2D0DFCEC7
        DBCBCCD8C9D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3
        C9D2D6CDD6DAC7D0D4C8D2D6C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C7CFD3CAD2D6CCD5DAC7CFD4C9D2D6C8D1D5C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CAD2D6CCD5D9C8D0D5C9D1D5C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D2D6C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
      NumGlyphs = 4
      OnMouseDown = btn1MouseDown
      OnMouseUp = btn1MouseUp
    end
    object btn2: TSpeedButton
      Tag = 10
      Left = 579
      Top = 327
      Width = 25
      Height = 28
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000060000000180000000100
        180000000000001B0000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D1D5C9D2D6C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CACFD6CCCAD9D1C9DED0D1
        DDC7CFD3C7D0D3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5
        C8D2D6C7D0D4CDD6DAC9D2D6C7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D1D5C9D2D6C7CFD4CCD5DACAD2D6C7CFD3C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D6CCD5D9C9D1D5C7CFD3C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D0D5CED2DABED0C97ABE8052B15692C0
        9BCFD6DBD0D4DCC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C7CFD3
        B5BBBF979B9DA9AEB1C7CFD3CDD6DAC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C9D2D6C9D2D7BFC5C89B9EA09EA4A4BFC7CBCFD7DCC8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C9D1D5C7D0D3BAC0C3A6AAADB3B9BCC8D0D4CCD4D8C9
        D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CCD1D8D8D6E59AC4A52DB63000B10041B0
        45B9D4C4D1D5DDC9D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3D0D8DCC0C8CB
        9295966D6D6D777879B9BFC2D1D9DEC9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7
        CED2CFD8DCCAD1D6A0A4A67474746B6C6CA9ADAFCFD7DCC9D1D6C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C9D1D5CDD5D9C2C8CC999B9D6E6E6D7D7F80BEC5C9D2DBDFC7
        CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C7D0D3CED1DACFD6DB65BB6B05B80600C60013B5
        137FC186C8D3D4D2D4DFC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4D3DBE0AEB4B7
        797B7A7E7E7E7170719CA2A4C5CED1CED6DBC7CFD3C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7
        CFD3D2DADEBDC4C78081817F7F7F6F6D6D8F9294BEC4C8CFD7DBC9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4D2DBDFB6BBBF7D7E7F7B7C7C727173A3A8ABCAD1D5CD
        D5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CAD1D6CDD3D89CC6A42DC42E00C70000C90004C4
        0540AE44B0CBBAD7D7E4C8CFD4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CCD4D9C1C9CC979A9D
        7474737E7E7D7D7D7D838585B6BCBED3DBE1C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CD
        D5D9C5CDD1A0A5A77878777D7D7D7D7D7C7C7E7EA8AEB1D1DADEC8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D1D5CBD5D9C6CED19EA2A47375747D7D7D7A7A7A888B8DBAC2C4D5
        DEE2C7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C9D0D5C9D3D5BDD6C652B05609B80900CA0000C70000C6
        000BB90B74C379C7D1D2D1D4DEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CFD6DA9FA3A5787A7A
        7D7C7C7E7E7E7E7E7E7172719CA0A1C8D0D4CCD4D8C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3D1
        D9DDABB0B37A7D7D7C7C7C7E7E7E808080717071919395C3CACDCCD4D8C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4CFD6DBA7ADB07B7D7E7B7B7B7E7E7E7F7F7F7474759FA3A6CD
        D4D9CCD4D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8CFD3CDD3DAC8D6D58AC2931EBE2000C40000C80000C70000C7
        0001C50225AF2898C2A1DDDAEBC8CED3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CED7DBB8BEC18A8C8D757575
        7F7F7F7E7E7E7E7E7E7878787D7E7FA9AEB2D4DDE2C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D1DADFBE
        C5C89194947677767E7E7E7E7E7E7E7E7E7979787879799DA2A5D1DADFC9D1D5
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C9D1D5CFD7DBBEC4C78F8F917373737E7E7E7E7E7E7E7E7E767675808282AD
        B2B5D5DDE1C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4CAD1D6D0D4DCBCCFC83FAD4405C40600CD0000C90000C90000C9
        0000CA0005BC0564BB6AD8C9E3CAD2D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6CFD7DB92989A7A7B7B7C7C7C
        7D7C7C7C7C7C7C7C7C7F7F7F6F6F6E8E9193CBD2D7C9D1D5C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6D3DDE19E
        A2A579797A7C7C7B7C7C7C7C7B7B7C7C7C7F7E7E71707086888AC5CCD1C9D1D5
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4CAD2D6D2DADE9EA3A57C7B7C7D7C7C7D7D7D7D7C7C7D7D7D7E7E7E7070718E
        9194CDD5DAC9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4CAD2D6CED2DBB3C4BD2FA93114B71417BE171EC02124C3261EBF
        1F18BC1904BC045EB262C6B9D1CCD5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CBD3D7C5CDD2868888777777808181
        818282848585818282808080767576898B8CB6BDC0CBD3D7C8D0D5C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CBD3D7C9D2D68F
        9496747474808181818282868788838484808181777677858789B2B9BDCAD2D6
        C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1
        D5CBD3D7CAD2D68D90927374748081818081818283838081818080807776768A
        8C8DB9C0C3CBD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4CAD2D6CBD0D6B9C4C377B97C70B57577B57D7BB2827EAE847DB4
        8377B67E69B3708EB395C1C1CCCCD4D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D5C0C7CB9CA0A2909394949899
        969A9B989C9D969A9C9397988D8F91989C9FB6BEC0CBD3D7C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6C4CCD0A5
        AAAC95999A999D9F9A9EA0999D9E9A9EA1989C9F9396989B9FA2B6BDBFCAD2D6
        C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4CAD2D6C4CCD09DA1A38A8D8E8F9293929596979B9C9497998F9293888A8B93
        9799B4BCBECBD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C9D1D6CED6DBD1D9DED5DCE1B1B8BB8F9696B8C1
        C3D1D9DED3DBE0CDD5DBCAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D2D5CCD4D7CFD6DA
        B9C0C3929799B5BDC0C9D2D6CCD4D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CC
        D5D9D0D9DDD2DADEC0C7CB909597B0B8BACCD5D8D2DBDFCCD4D8C9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8CFD3C7CFD3C8D0D3CAD2D5BCC4C793989AB2BABDC6CFD2C8D0D4C5
        CDD1C6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD1D7D0D6DCCEC6D972BC770EB50E51A0
        57C6D5D2D6D9E3CAD1D6C8D1D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CBD3D7CFD8DCCCD4D9
        AAB0B47B7C7B838789C7CED2D7E0E4CAD2D6C9D1D5C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5CED6DAC9D0D5ABB0B37B7B7C7A7D7EC0C6CAD7E0E4C9D1D4C9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4CBD3D8D1D9DDCED7DBB2B9BE7E7F81828688C3CBCFD9E2E6CC
        D4D8C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2E3DCF191B89B1DAB2000C8000BB9
        0C9DC0A5D0D2DDCDD5DAC7CFD3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C5CDD1D5DDE2B1B8BB
        797B7D7978786F7170B1B7B9D1DADDCCD4D8C7CFD3C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6
        CFD3D4DDE0B5BBBE7375757B7B7B727372ABB1B5CFD8DDCDD6DAC8CFD3C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C5CDD1D2DBDFBCC3C67E81837979796D6C6CABB1B4D0DADDCC
        D5D9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D1D4D0D7DDCBC6D552B35805B70600CA0000CB
        0046A64AB1C4BBD9D9E6C9D1D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CED6DAC9D1D693989A
        6766658181807B7B7A888B8CBBC2C5D5DEE2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3CF
        D8DCC5CDD194999B6868677F7F7F7B7B7B838587B6BDC1D7E0E5C7CFD3C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4CDD5D9CCD5D99FA5A86766667E7E7E7B7979868989B6BFC2D5
        DEE2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4CBD2D7DFDCEC81B2881CB31D01CB0100C90000C7
        0000AB007BB782D1CEDECED3DAC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6D8E0E4A4ABAD7A7B7C
        7B7B7B7E7E7E7E7E7E686968A0A4A6D1DADECBD3D7C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D6D5
        DEE3A3A9AD7475767D7C7C7E7E7E7D7D7D6D6D6C9FA4A5D2DADFCBD3D7C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4D8E0E4B0B7BB7C7F817A7A7A7E7E7E7E7E7E696968999CA0CF
        D9DDCCD4D8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C9D2D5CFD4DAC8C9D33BB73F02BC0200C90000C80000C7
        0000CD003DB340A4BBACD3D5E1CAD2D6C8D0D3C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D1D5CCD4D8CBD2D68B8C8E6C6C6C
        8080807E7E7E7E7E7E7A79788F9294B8BFC3D0D9DDC8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5CED6DAC0
        C8CC878B8B6A6A698181817E7E7E7E7E7E7C7B7B8C8F91B5BCBFD1DADEC7CFD3
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4CDD5D9CFD7DB979C9E6B6B6A7D7D7D7F7F7F7D7D7D7978778B8F8FB4
        BBBECFD7DCC9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8CFD4D0D5DDCDD4DA71A87716B61700CB0000C90000C80000C8
        0000CA0000B4005CB861D3CFDFD0D2DCC7D0D3C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CBD3D7D0D9DE969A9D7C7D7C7D7C7C
        7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F959A9CD4DBE0C9D1D5C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CBD3D7CFD7DC90
        94977576767E7E7D7E7E7E7E7E7E7E7E7E7E7E7E6E6E6F939699D3DBE0C9D1D5
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4CAD2D6D6DDE2A3A9AC7C7E7E7C7B7B7F7F7F7F7F7F7F7F7F7F7F7F6F6F708E
        9193CFD7DBCBD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4CBD3D7D2D3DEB9C2C33CA13F02A40200AC0002AA0102A90102A9
        0100A90000A8003CA03FAFAEBAD1D3E0CAD2D6C8CFD3C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6CCD4D8C0C7CB77797B626261696868
        6867686868686867686867685E5D5D787A7CB1B8BDCCD6DAC9D1D5C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6CCD4D8BBC2C578
        7A7C5F5F5E6968696868686869686868686768676464637D8082B1BABECFD8DC
        C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D0
        D4CDD6DAC8D0D5878A8C6161606766676867686868686867686968695F5D5D72
        7375ABB1B6CCD5D9CAD3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4CAD2D6CCD1D8BEC6C98FB7977DB68482BA8984BA8C84BA8C84BA
        8C83BA8B7ABA828DB597B7BBC2CCD1D8CAD2D6C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D5BEC6CA9EA3A6969B9D9A9FA1
        9A9EA1999EA0999DA0999D9F969A9C9DA3A5B3BBBFCBD4D8C8D1D5C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D6C0C7CBA9
        AFB1A3A9ACA8AEB0A8ADB0A7ADB0A6ACAFA6AAADA3A8ABA9AFB3BBC2C7CCD4D8
        C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1
        D5CCD4D8C4CCD0A7ADB0979D9F9AA0A29CA1A39BA1A39B9FA29B9FA1989C9D9C
        A2A4B2B9BCCAD3D7C9D3D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C9D0D4CECEDCD5CDE3D7CFE4D7D0E4D7D0E4D7D0
        E4D7D0E4D7CFE4CFCEDDC8CFD3C7D0D3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4CAD2D6CDD6DACED7DB
        CED7DBCED6DBCDD6DACDD6DACBD3D7C8D0D4C7CFD3C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CA
        D3D7CCD5D9CDD6DACDD6DACDD5DACCD5D9CCD5D9CAD3D7C8D1D5C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C7D0D4C9D2D6CCD5D9CED8DBCED7DBCDD6DBCDD6DACDD6DACBD4D8C8
        D1D5C7D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1
        D5C9D1D5C9D1D5C9D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9D1D5C9D0D4C9D0D4
        C8D0D4C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9
        D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9D1D5C9
        D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
      NumGlyphs = 4
      OnMouseDown = btn2MouseDown
      OnMouseUp = btn2MouseUp
    end
    object btnStartAirComp1: TVrDemoButton
      Left = 191
      Top = 83
      Width = 153
      Height = 25
      Hint = '5511A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'COMPRESOR 1'
      TabOrder = 8
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnStartAirComp2: TVrDemoButton
      Left = 191
      Top = 112
      Width = 153
      Height = 25
      Hint = '5511A0002A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'COMPRESOR 2'
      TabOrder = 9
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnChillUnit1: TVrDemoButton
      Left = 191
      Top = 216
      Width = 153
      Height = 25
      Hint = '5161A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'FAILURE'
      TabOrder = 10
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnChillUnit2: TVrDemoButton
      Left = 191
      Top = 285
      Width = 153
      Height = 25
      Hint = '5161A0002A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'FAILURE'
      TabOrder = 11
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnSewage: TVrDemoButton
      Left = 191
      Top = 388
      Width = 153
      Height = 25
      Hint = '5281A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL FAILURE'
      TabOrder = 12
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnICCP: TVrDemoButton
      Left = 191
      Top = 490
      Width = 153
      Height = 25
      Hint = '6331E0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL FAILURE'
      TabOrder = 13
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnMed: TVrDemoButton
      Left = 191
      Top = 587
      Width = 153
      Height = 25
      Hint = '4364E5001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'CALL ALARM'
      TabOrder = 14
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnRudderPS: TVrDemoButton
      Left = 682
      Top = 216
      Width = 153
      Height = 25
      Hint = '5610E0005A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL ALARM'
      TabOrder = 15
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnRUDDERSB: TVrDemoButton
      Left = 476
      Top = 216
      Width = 153
      Height = 25
      Hint = '5610E0005B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL ALARM'
      TabOrder = 16
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnAlarmColumnAudio: TVrDemoButton
      Left = 579
      Top = 490
      Width = 153
      Height = 25
      Hint = '4365E5011B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'SUPPLY MISSING'
      TabOrder = 17
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnAccomodLadder: TVrDemoButton
      Left = 579
      Top = 587
      Width = 153
      Height = 25
      Hint = '6234E0004A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL ALARM'
      TabOrder = 18
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnPilyBilgeppm: TVrDemoButton
      Left = 658
      Top = 323
      Width = 131
      Height = 25
      Hint = '5932A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = '15 ppm'
      TabOrder = 19
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnOilyBilgeFail: TVrDemoButton
      Left = 658
      Top = 354
      Width = 131
      Height = 25
      Hint = '5932A0001B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'FAILURE'
      TabOrder = 20
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnProvis: TVrDemoButton
      Left = 483
      Top = 96
      Width = 153
      Height = 25
      Hint = '5162A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL FAILURE'
      TabOrder = 0
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnCold: TVrDemoButton
      Left = 673
      Top = 96
      Width = 153
      Height = 25
      Hint = '4363E5001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'LOCK IN ALARM'
      TabOrder = 1
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnFWGen1Run: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 96
      Width = 153
      Height = 30
      Hint = '5310A0001B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'RUNNING'
      TabOrder = 6
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnFWGen1Fail: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 136
      Width = 153
      Height = 30
      Hint = '5310A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'FAILURE'
      TabOrder = 7
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnFWGen2Run: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 306
      Width = 153
      Height = 30
      Hint = '5310A0002B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'RUNNING'
      TabOrder = 4
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnFWGen2Fail: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 346
      Width = 153
      Height = 30
      Hint = '5310A0002A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'FAILURE'
      TabOrder = 5
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnHotColdP12: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 534
      Width = 153
      Height = 30
      Hint = '5322A0001B'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'PUMP 1 PUMP 2'
      TabOrder = 2
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object btnHotColdFail: TVrDemoButton
      Tag = 1
      Left = 967
      Top = 574
      Width = 153
      Height = 30
      Hint = '5322A0001A'
      FontEnter.Charset = ANSI_CHARSET
      FontEnter.Color = clBlack
      FontEnter.Height = -13
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = ANSI_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -11
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      Font3D.ShadowColor = clGray
      Caption = 'GENERAL FAILURE'
      TabOrder = 3
      TabStop = True
      OnMouseDown = btnStartAirComp1TMouseDown
    end
    object edt1: TEdit
      Tag = 10
      Left = 579
      Top = 361
      Width = 59
      Height = 22
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 21
    end
  end
  object pm1: TPopupMenu
    Left = 247
    Top = 497
    object mniAlarm1: TMenuItem
      Caption = 'Alarm'
      OnClick = mniAlarm1Click
    end
    object mniEnable1: TMenuItem
      Caption = 'Enable'
      OnClick = mniEnable1Click
    end
    object mniDisable1: TMenuItem
      Caption = 'Disable'
      OnClick = mniDisable1Click
    end
    object mniFalse1: TMenuItem
      Caption = 'False'
      OnClick = mniFalse1Click
    end
  end
end
