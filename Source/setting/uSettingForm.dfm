object frmSetting: TfrmSetting
  Left = 425
  Top = 102
  BorderStyle = bsToolWindow
  Caption = 'IPMS Setting'
  ClientHeight = 700
  ClientWidth = 1173
  Color = 4799038
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1173
    700)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 8
    Top = 666
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitTop = 1437
  end
  object btnCancel: TButton
    Left = 87
    Top = 666
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelClick
    ExplicitTop = 1437
  end
  object grpIDServo: TGroupBox
    Left = 675
    Top = 66
    Width = 226
    Height = 264
    Caption = 'Servo ID'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object lbl6: TLabel
      Left = 18
      Top = 21
      Width = 76
      Height = 18
      Caption = 'RPM ME PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 18
      Top = 50
      Width = 76
      Height = 18
      Caption = 'RPM ME SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 18
      Top = 79
      Width = 102
      Height = 18
      Caption = 'RPM SHAFT PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 18
      Top = 108
      Width = 102
      Height = 18
      Caption = 'RPM SHAFT SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 18
      Top = 137
      Width = 50
      Height = 18
      Caption = 'CPP PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 18
      Top = 166
      Width = 50
      Height = 18
      Caption = 'CPP SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl12: TLabel
      Left = 18
      Top = 195
      Width = 83
      Height = 18
      Caption = 'RUDDER PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 18
      Top = 224
      Width = 83
      Height = 18
      Caption = 'RUDDER SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtIDRPMMEPS: TEdit
      Left = 135
      Top = 17
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtIDRPMMESB: TEdit
      Left = 135
      Top = 46
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtIDRPMSHAFTPS: TEdit
      Left = 135
      Top = 75
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtIDRPMSHAFTSB: TEdit
      Left = 135
      Top = 104
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtIDCPPSB: TEdit
      Left = 135
      Top = 162
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtIDRUDDERPS: TEdit
      Left = 135
      Top = 191
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtIDRUDDERSB: TEdit
      Left = 135
      Top = 220
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtIDCPPPS: TEdit
      Left = 135
      Top = 133
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object grpConsoleIP: TGroupBox
    Left = 907
    Top = 63
    Width = 344
    Height = 705
    Caption = 'grpConsoleIP'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object lbl27: TLabel
      Left = 20
      Top = 24
      Width = 63
      Height = 15
      Caption = 'Instruktur IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl28: TLabel
      Left = 20
      Top = 49
      Width = 36
      Height = 15
      Caption = 'ACS IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl29: TLabel
      Left = 20
      Top = 74
      Width = 61
      Height = 15
      Caption = 'Mimic Kiri IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl30: TLabel
      Left = 20
      Top = 99
      Width = 54
      Height = 15
      Caption = 'PCS Kiri IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl31: TLabel
      Left = 20
      Top = 124
      Width = 86
      Height = 15
      Caption = 'Mimic Tengah IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl32: TLabel
      Left = 20
      Top = 149
      Width = 74
      Height = 15
      Caption = 'PCS Kanan IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl33: TLabel
      Left = 20
      Top = 174
      Width = 81
      Height = 15
      Caption = 'Mimic Kanan IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl34: TLabel
      Left = 20
      Top = 199
      Width = 98
      Height = 15
      Caption = 'Emergency Stop IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl35: TLabel
      Left = 20
      Top = 224
      Width = 44
      Height = 15
      Caption = 'CCTV IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl36: TLabel
      Left = 20
      Top = 249
      Width = 32
      Height = 15
      Caption = 'Server'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 20
      Top = 274
      Width = 70
      Height = 15
      Caption = 'Monitoring IP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 20
      Top = 299
      Width = 69
      Height = 15
      Caption = 'Gen PS FWD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 20
      Top = 324
      Width = 69
      Height = 15
      Caption = 'Gen SB FWD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 20
      Top = 349
      Width = 64
      Height = 15
      Caption = 'Gen PS AFT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 20
      Top = 374
      Width = 64
      Height = 15
      Caption = 'Gen SB AFT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 20
      Top = 399
      Width = 82
      Height = 15
      Caption = 'Gen Emergency'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 20
      Top = 424
      Width = 30
      Height = 15
      Caption = 'Shore'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 20
      Top = 449
      Width = 89
      Height = 15
      Caption = 'Main Engine 1 PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 20
      Top = 474
      Width = 91
      Height = 15
      Caption = 'Main Engine 2 PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 20
      Top = 499
      Width = 89
      Height = 15
      Caption = 'Main Engine 1 SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 20
      Top = 524
      Width = 91
      Height = 15
      Caption = 'Main Engine 2 SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 20
      Top = 549
      Width = 55
      Height = 15
      Caption = 'Auxiliary-1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 20
      Top = 574
      Width = 57
      Height = 15
      Caption = 'Auxiliary-2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 20
      Top = 599
      Width = 57
      Height = 15
      Caption = 'Auxiliary-3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 20
      Top = 624
      Width = 94
      Height = 15
      Caption = 'Diesel Generator-1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 20
      Top = 649
      Width = 96
      Height = 15
      Caption = 'Diesel Generator-2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 20
      Top = 674
      Width = 96
      Height = 15
      Caption = 'Diesel Generator-3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtInstrukturIP: TEdit
      Left = 156
      Top = 21
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtACSIP: TEdit
      Left = 156
      Top = 46
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtMimicKiriIP: TEdit
      Left = 156
      Top = 71
      Width = 153
      Height = 21
      TabOrder = 2
    end
    object edtPCSKiriIP: TEdit
      Left = 156
      Top = 96
      Width = 153
      Height = 21
      TabOrder = 3
    end
    object edtPCSKananIP: TEdit
      Left = 156
      Top = 146
      Width = 153
      Height = 21
      TabOrder = 4
    end
    object edtMimicTengahIP: TEdit
      Left = 156
      Top = 121
      Width = 153
      Height = 21
      TabOrder = 5
    end
    object edtMimicKananIP: TEdit
      Left = 156
      Top = 171
      Width = 153
      Height = 21
      TabOrder = 6
    end
    object edtEmergencyStopIP: TEdit
      Left = 156
      Top = 196
      Width = 153
      Height = 21
      TabOrder = 7
    end
    object edtCCTVIP: TEdit
      Left = 156
      Top = 221
      Width = 153
      Height = 21
      TabOrder = 8
    end
    object edtServer: TEdit
      Left = 156
      Top = 246
      Width = 153
      Height = 21
      TabOrder = 9
    end
    object Edit1: TEdit
      Left = 156
      Top = 271
      Width = 153
      Height = 21
      TabOrder = 10
    end
    object Edit2: TEdit
      Left = 156
      Top = 296
      Width = 153
      Height = 21
      TabOrder = 11
    end
    object Edit3: TEdit
      Left = 156
      Top = 321
      Width = 153
      Height = 21
      TabOrder = 12
    end
    object Edit4: TEdit
      Left = 156
      Top = 346
      Width = 153
      Height = 21
      TabOrder = 13
    end
    object Edit5: TEdit
      Left = 156
      Top = 446
      Width = 153
      Height = 21
      TabOrder = 14
    end
    object Edit6: TEdit
      Left = 156
      Top = 421
      Width = 153
      Height = 21
      TabOrder = 15
    end
    object Edit7: TEdit
      Left = 156
      Top = 396
      Width = 153
      Height = 21
      TabOrder = 16
    end
    object Edit8: TEdit
      Left = 156
      Top = 371
      Width = 153
      Height = 21
      TabOrder = 17
    end
    object Edit9: TEdit
      Left = 156
      Top = 471
      Width = 153
      Height = 21
      TabOrder = 18
    end
    object Edit10: TEdit
      Left = 156
      Top = 496
      Width = 153
      Height = 21
      TabOrder = 19
    end
    object Edit11: TEdit
      Left = 156
      Top = 521
      Width = 153
      Height = 21
      TabOrder = 20
    end
    object Edit12: TEdit
      Left = 156
      Top = 546
      Width = 153
      Height = 21
      TabOrder = 21
    end
    object Edit13: TEdit
      Left = 156
      Top = 571
      Width = 153
      Height = 21
      TabOrder = 22
    end
    object Edit14: TEdit
      Left = 156
      Top = 596
      Width = 153
      Height = 21
      TabOrder = 23
    end
    object Edit15: TEdit
      Left = 156
      Top = 621
      Width = 153
      Height = 21
      TabOrder = 24
    end
    object Edit16: TEdit
      Left = 156
      Top = 646
      Width = 153
      Height = 21
      TabOrder = 25
    end
    object Edit17: TEdit
      Left = 156
      Top = 671
      Width = 153
      Height = 21
      TabOrder = 26
    end
  end
  object btnShare: TButton
    Left = 166
    Top = 666
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'Share'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelClick
    ExplicitTop = 1437
  end
  object Panel1: TPanel
    Left = 24
    Top = 68
    Width = 265
    Height = 159
    Color = 7960953
    ParentBackground = False
    TabOrder = 5
    object Label2: TLabel
      Left = 17
      Top = 119
      Width = 53
      Height = 18
      Caption = 'Protocol'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 17
      Top = 71
      Width = 29
      Height = 18
      Caption = 'User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblDBName: TLabel
      Left = 17
      Top = 47
      Width = 66
      Height = 18
      Caption = 'DB Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 17
      Top = 95
      Width = 64
      Height = 18
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblServer: TLabel
      Left = 17
      Top = 23
      Width = 40
      Height = 18
      Caption = 'Server'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtConnection: TEdit
      Left = 96
      Top = 21
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtDBName: TEdit
      Left = 96
      Top = 45
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtDBProtocol: TEdit
      Left = 96
      Top = 117
      Width = 153
      Height = 21
      TabOrder = 2
    end
    object edtPassword: TEdit
      Left = 96
      Top = 93
      Width = 153
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtUser: TEdit
      Left = 96
      Top = 69
      Width = 153
      Height = 21
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 29
    Width = 265
    Height = 31
    Caption = 'DATABASE SETTING'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 24
    Top = 252
    Width = 265
    Height = 31
    Caption = 'SIM ENGINE SETTING'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object Panel4: TPanel
    Left = 24
    Top = 391
    Width = 265
    Height = 31
    Caption = 'LPU SETTING'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object pnlSimEngineSetting: TPanel
    Left = 24
    Top = 291
    Width = 265
    Height = 75
    Color = 7960953
    ParentBackground = False
    TabOrder = 9
    object lblSimEnginePort: TLabel
      Left = 17
      Top = 41
      Width = 28
      Height = 18
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblSimEngineSvr: TLabel
      Left = 17
      Top = 17
      Width = 40
      Height = 18
      Caption = 'Server'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtSimEnginePort: TEdit
      Left = 96
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtSimEngineSvr: TEdit
      Left = 96
      Top = 15
      Width = 153
      Height = 21
      TabOrder = 1
    end
  end
  object Panel6: TPanel
    Left = 24
    Top = 530
    Width = 265
    Height = 31
    Caption = 'INSTRUCTOR SETTING'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
  end
  object Panel7: TPanel
    Left = 652
    Top = 355
    Width = 249
    Height = 25
    Caption = 'MONITOR'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object Panel8: TPanel
    Left = 652
    Top = 492
    Width = 249
    Height = 31
    Caption = 'ROLE'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object Panel9: TPanel
    Left = 652
    Top = 563
    Width = 249
    Height = 31
    Caption = 'FROM PCS'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
  end
  object Panel10: TPanel
    Left = 652
    Top = 727
    Width = 249
    Height = 31
    Caption = 'GENERATOR SETTING'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 14
  end
  object Panel11: TPanel
    Left = 670
    Top = 29
    Width = 231
    Height = 31
    Caption = 'SERVO ID'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 15
  end
  object Panel12: TPanel
    Left = 8
    Top = 762
    Width = 218
    Height = 25
    Caption = 'MODE'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 16
  end
  object Panel15: TPanel
    Left = 377
    Top = 803
    Width = 218
    Height = 25
    Caption = 'Servo Degree'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 17
  end
  object Panel13: TPanel
    Left = 897
    Top = 8
    Width = 344
    Height = 31
    Caption = 'DATABASE'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 18
  end
  object Panel16: TPanel
    Left = 338
    Top = 29
    Width = 273
    Height = 52
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 19
    object Label28: TLabel
      Left = 16
      Top = 13
      Width = 89
      Height = 18
      Caption = 'Consol Setting'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 13
      Width = 129
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'INSTRUCTOR'
      OnChange = ComboBox1Change
      Items.Strings = (
        'INSTRUCTOR'
        'ACS'
        'MIMIC KIRI'
        'MCR LEFT'
        'MIMIC TENGAH'
        'MCR RIGHT'
        'MIMIC KANAN'
        'EMERGENCY STOP'
        'DIESEL GENERATOR'
        'MAIN ENGINE'
        'AUXILIARY'
        'MAIN SWITCHBOARD')
    end
  end
  object pnlLpuSetting: TPanel
    Left = 24
    Top = 430
    Width = 265
    Height = 75
    Color = 7960953
    ParentBackground = False
    TabOrder = 20
    object lblLPUPort: TLabel
      Left = 20
      Top = 39
      Width = 28
      Height = 18
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblLPUServer: TLabel
      Left = 20
      Top = 14
      Width = 40
      Height = 18
      Caption = 'Server'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtLPUPort: TEdit
      Left = 92
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtLPUServer: TEdit
      Left = 92
      Top = 14
      Width = 153
      Height = 21
      TabOrder = 1
    end
  end
  object PnlInstructor: TPanel
    Left = 24
    Top = 567
    Width = 265
    Height = 75
    Color = 7960953
    ParentBackground = False
    TabOrder = 21
    object lbl2: TLabel
      Left = 16
      Top = 75
      Width = 92
      Height = 18
      Caption = 'Loaded App :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 20
      Top = 14
      Width = 29
      Height = 18
      Caption = 'Host'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 20
      Top = 39
      Width = 28
      Height = 18
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtAppName: TEdit
      Left = 16
      Top = 94
      Width = 209
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtInsHost: TEdit
      Left = 92
      Top = 14
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtInsPort: TEdit
      Left = 92
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 2
    end
  end
  object Panel5: TPanel
    Left = 8
    Top = 792
    Width = 218
    Height = 143
    Color = 7960953
    ParentBackground = False
    TabOrder = 22
    object lbl23: TLabel
      Left = 12
      Top = 19
      Width = 75
      Height = 18
      Caption = 'Mode Servo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl24: TLabel
      Left = 12
      Top = 48
      Width = 67
      Height = 18
      Caption = 'Servo Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl25: TLabel
      Left = 12
      Top = 77
      Width = 73
      Height = 18
      Caption = 'Alarm Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl26: TLabel
      Left = 12
      Top = 106
      Width = 105
      Height = 18
      Caption = 'Emergency Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbModeServo: TComboBox
      Left = 132
      Top = 15
      Width = 74
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'On'
        'Off')
    end
    object edtAlarmPort: TEdit
      Left = 132
      Top = 73
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtEmergencyPort: TEdit
      Left = 132
      Top = 102
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtServoPort: TEdit
      Left = 132
      Top = 44
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel18: TPanel
    Left = 377
    Top = 836
    Width = 218
    Height = 260
    Color = 7960953
    ParentBackground = False
    TabOrder = 23
    object lbl14: TLabel
      Left = 14
      Top = 20
      Width = 76
      Height = 18
      Caption = 'RPM ME PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl15: TLabel
      Left = 14
      Top = 49
      Width = 76
      Height = 18
      Caption = 'RPM ME SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl16: TLabel
      Left = 14
      Top = 78
      Width = 102
      Height = 18
      Caption = 'RPM SHAFT PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 14
      Top = 107
      Width = 102
      Height = 18
      Caption = 'RPM SHAFT SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl18: TLabel
      Left = 14
      Top = 136
      Width = 50
      Height = 18
      Caption = 'CPP PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl19: TLabel
      Left = 14
      Top = 165
      Width = 50
      Height = 18
      Caption = 'CPP SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl20: TLabel
      Left = 14
      Top = 194
      Width = 83
      Height = 18
      Caption = 'RUDDER PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl21: TLabel
      Left = 14
      Top = 223
      Width = 83
      Height = 18
      Caption = 'RUDDER SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtDegCPPPS: TEdit
      Left = 131
      Top = 132
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtDegCPPSB: TEdit
      Left = 131
      Top = 161
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtDegRPMMEPS: TEdit
      Left = 131
      Top = 16
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtDegRPMMESB: TEdit
      Left = 131
      Top = 45
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtDegRPMSHAFTPS: TEdit
      Left = 131
      Top = 74
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtDegRPMSHAFTSB: TEdit
      Left = 131
      Top = 103
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtDegRUDDERPS: TEdit
      Left = 131
      Top = 190
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtDegRUDDERSB: TEdit
      Left = 131
      Top = 219
      Width = 73
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object Panel19: TPanel
    Left = 652
    Top = 388
    Width = 249
    Height = 79
    Color = 7960953
    ParentBackground = False
    TabOrder = 24
    object Label3: TLabel
      Left = 13
      Top = 16
      Width = 58
      Height = 18
      Caption = 'Instructor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 45
      Width = 36
      Height = 18
      Caption = 'Mimic'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbInstrukturMonitor: TComboBox
      Left = 84
      Top = 12
      Width = 153
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Text = '2'
      Items.Strings = (
        '1'
        '2')
    end
    object cbbMimcMonitor: TComboBox
      Left = 84
      Top = 41
      Width = 153
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '')
    end
  end
  object Panel20: TPanel
    Left = 652
    Top = 510
    Width = 249
    Height = 47
    Color = 7960953
    ParentBackground = False
    TabOrder = 25
    object Label1: TLabel
      Left = 20
      Top = 16
      Width = 41
      Height = 18
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbRoleName: TComboBox
      Left = 76
      Top = 13
      Width = 153
      Height = 26
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'IPMS'
        'AUX'
        'PCS'
        'E')
    end
  end
  object Panel21: TPanel
    Left = 652
    Top = 645
    Width = 249
    Height = 47
    Color = 7960953
    ParentBackground = False
    TabOrder = 26
    object Label29: TLabel
      Left = 16
      Top = 15
      Width = 83
      Height = 18
      Caption = 'ID Form PCS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 137
      Top = 11
      Width = 96
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'PCS Kiri'
        'PCS Tengah'
        'PCS Kanan')
    end
  end
  object Panel23: TPanel
    Left = 652
    Top = 774
    Width = 249
    Height = 53
    Color = 7960953
    ParentBackground = False
    TabOrder = 27
    object Label30: TLabel
      Left = 16
      Top = 18
      Width = 41
      Height = 18
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox3: TComboBox
      Left = 80
      Top = 14
      Width = 153
      Height = 26
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'Generator 1'
        'Generator 2'
        'Generator 3'
        'Generator 4'
        '')
    end
  end
  object Panel22: TPanel
    Left = 354
    Top = 425
    Width = 265
    Height = 214
    Color = 4799038
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 28
    object Panel14: TPanel
      Left = 0
      Top = 0
      Width = 265
      Height = 31
      Caption = 'MAIN ENGINE CONSOL SETTING'
      Color = 7960953
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel17: TPanel
      Left = 0
      Top = 37
      Width = 265
      Height = 174
      Color = 7960953
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object Label22: TLabel
        Left = 35
        Top = 20
        Width = 34
        Height = 18
        Caption = 'Posisi'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 35
        Top = 49
        Width = 14
        Height = 18
        Caption = 'ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 35
        Top = 78
        Width = 98
        Height = 18
        Caption = 'Screen_Gauges'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 35
        Top = 136
        Width = 106
        Height = 18
        Caption = 'Screen_Signaling'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 35
        Top = 107
        Width = 107
        Height = 18
        Caption = 'Screen_PMS/HMI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object cbbIdMainEngine: TComboBox
        Left = 156
        Top = 45
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '1'
        Items.Strings = (
          '1'
          '2')
      end
      object cbbPosisiMainEngine: TComboBox
        Left = 156
        Top = 16
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'Kanan'
        Items.Strings = (
          'Kanan'
          'Kiri')
      end
      object cbbScreenGaugesMainEngine: TComboBox
        Left = 156
        Top = 74
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = '0'
        Items.Strings = (
          '0'
          '1'
          '2')
      end
      object cbbScreenSignalingMainEngine: TComboBox
        Left = 156
        Top = 132
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = '0'
        Items.Strings = (
          '0'
          '1'
          '2')
      end
      object cbbScrPMSMainEngine: TComboBox
        Left = 156
        Top = 103
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 4
        Text = '0'
        Items.Strings = (
          '0'
          '1'
          '2')
      end
    end
  end
end
