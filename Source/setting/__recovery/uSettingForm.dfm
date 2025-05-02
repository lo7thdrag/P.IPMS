object frmSetting: TfrmSetting
  Left = 425
  Top = 102
  BorderStyle = bsToolWindow
  Caption = 'IPMS Setting'
  ClientHeight = 763
  ClientWidth = 936
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
    936
    763)
  PixelsPerInch = 96
  TextHeight = 13
  object grpDatabase: TGroupBox
    Left = 24
    Top = 8
    Width = 249
    Height = 142
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Database'
    Color = 7960953
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object lblServer: TLabel
      Left = 16
      Top = 20
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
    object lbl1: TLabel
      Left = 16
      Top = 66
      Width = 22
      Height = 15
      Caption = 'User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 16
      Top = 89
      Width = 51
      Height = 15
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lblDBName: TLabel
      Left = 16
      Top = 43
      Width = 52
      Height = 15
      Caption = 'DB Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 112
      Width = 44
      Height = 15
      Caption = 'Protocol'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtConnection: TEdit
      Left = 80
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtUser: TEdit
      Left = 80
      Top = 62
      Width = 153
      Height = 21
      TabOrder = 2
    end
    object edtPassword: TEdit
      Left = 80
      Top = 85
      Width = 153
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtDBName: TEdit
      Left = 80
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtDBProtocol: TEdit
      Left = 80
      Top = 108
      Width = 153
      Height = 21
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 8
    Top = 729
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
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 87
    Top = 729
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
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object grp1: TGroupBox
    Left = 24
    Top = 307
    Width = 249
    Height = 114
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Instructor'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object lbl2: TLabel
      Left = 16
      Top = 67
      Width = 73
      Height = 15
      Caption = 'Loaded App :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 16
      Top = 19
      Width = 23
      Height = 15
      Caption = 'Host'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 16
      Top = 42
      Width = 23
      Height = 15
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtAppName: TEdit
      Left = 16
      Top = 86
      Width = 209
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtInsHost: TEdit
      Left = 80
      Top = 15
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtInsPort: TEdit
      Left = 80
      Top = 38
      Width = 153
      Height = 21
      TabOrder = 2
    end
  end
  object grpSimEngineSet: TGroupBox
    Left = 24
    Top = 157
    Width = 249
    Height = 68
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Sim Engine Setting'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object lblSimEngineSvr: TLabel
      Left = 16
      Top = 19
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
    object lblSimEnginePort: TLabel
      Left = 16
      Top = 42
      Width = 23
      Height = 15
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtSimEngineSvr: TEdit
      Left = 80
      Top = 15
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtSimEnginePort: TEdit
      Left = 80
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 1
    end
  end
  object grpLPUSet: TGroupBox
    Left = 24
    Top = 232
    Width = 249
    Height = 68
    Anchors = [akLeft, akTop, akRight]
    Caption = 'LPU Setting'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 5
    object lblLPUServer: TLabel
      Left = 16
      Top = 19
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
    object lblLPUPort: TLabel
      Left = 16
      Top = 43
      Width = 23
      Height = 15
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtLPUServer: TEdit
      Left = 80
      Top = 15
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtLPUPort: TEdit
      Left = 80
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 1
    end
  end
  object grpRole: TGroupBox
    Left = 24
    Top = 514
    Width = 249
    Height = 47
    Caption = 'Role'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 15
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbRoleName: TComboBox
      Left = 80
      Top = 15
      Width = 153
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'IPMS'
        'AUX'
        'PCS'
        'E')
    end
  end
  object grpIDServo: TGroupBox
    Left = 323
    Top = 8
    Width = 188
    Height = 226
    Caption = 'Servo ID'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 7
    object lbl6: TLabel
      Left = 15
      Top = 20
      Width = 57
      Height = 13
      Caption = 'RPM ME PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 15
      Top = 43
      Width = 57
      Height = 13
      Caption = 'RPM ME SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 15
      Top = 66
      Width = 77
      Height = 13
      Caption = 'RPM SHAFT PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 15
      Top = 89
      Width = 77
      Height = 13
      Caption = 'RPM SHAFT SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 15
      Top = 112
      Width = 37
      Height = 13
      Caption = 'CPP PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 15
      Top = 135
      Width = 37
      Height = 13
      Caption = 'CPP SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl12: TLabel
      Left = 15
      Top = 158
      Width = 60
      Height = 13
      Caption = 'RUDDER PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 15
      Top = 181
      Width = 60
      Height = 13
      Caption = 'RUDDER SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtIDRPMMEPS: TEdit
      Left = 104
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtIDRPMMESB: TEdit
      Left = 104
      Top = 41
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtIDRPMSHAFTPS: TEdit
      Left = 104
      Top = 66
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edtIDRPMSHAFTSB: TEdit
      Left = 104
      Top = 91
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object edtIDCPPSB: TEdit
      Left = 104
      Top = 141
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object edtIDRUDDERPS: TEdit
      Left = 104
      Top = 166
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object edtIDRUDDERSB: TEdit
      Left = 104
      Top = 191
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object edtIDCPPPS: TEdit
      Left = 104
      Top = 116
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object grpServoDegree: TGroupBox
    Left = 319
    Top = 513
    Width = 192
    Height = 227
    Caption = 'Servo Degree'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 8
    object lbl14: TLabel
      Left = 15
      Top = 23
      Width = 57
      Height = 13
      Caption = 'RPM ME PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl15: TLabel
      Left = 15
      Top = 48
      Width = 57
      Height = 13
      Caption = 'RPM ME SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl16: TLabel
      Left = 15
      Top = 73
      Width = 77
      Height = 13
      Caption = 'RPM SHAFT PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 15
      Top = 98
      Width = 77
      Height = 13
      Caption = 'RPM SHAFT SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl18: TLabel
      Left = 15
      Top = 123
      Width = 37
      Height = 13
      Caption = 'CPP PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl19: TLabel
      Left = 15
      Top = 148
      Width = 37
      Height = 13
      Caption = 'CPP SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl20: TLabel
      Left = 15
      Top = 173
      Width = 60
      Height = 13
      Caption = 'RUDDER PS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl21: TLabel
      Left = 15
      Top = 198
      Width = 60
      Height = 13
      Caption = 'RUDDER SB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtDegRPMMEPS: TEdit
      Left = 108
      Top = 19
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtDegRPMMESB: TEdit
      Left = 108
      Top = 44
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtDegRPMSHAFTPS: TEdit
      Left = 108
      Top = 69
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edtDegRPMSHAFTSB: TEdit
      Left = 108
      Top = 94
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object edtDegCPPSB: TEdit
      Left = 108
      Top = 144
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object edtDegRUDDERPS: TEdit
      Left = 108
      Top = 169
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object edtDegRUDDERSB: TEdit
      Left = 108
      Top = 194
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object edtDegCPPPS: TEdit
      Left = 108
      Top = 119
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object grp3: TGroupBox
    Left = 24
    Top = 568
    Width = 249
    Height = 47
    Caption = 'Form PCS'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 9
    object lbl22: TLabel
      Left = 16
      Top = 17
      Width = 67
      Height = 15
      Caption = 'ID Form PCS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbidFormPCS: TComboBox
      Left = 137
      Top = 17
      Width = 96
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'PCS Kiri'
        'PCS Tengah'
        'PCS Kanan')
    end
  end
  object grp4: TGroupBox
    Left = 323
    Top = 238
    Width = 188
    Height = 115
    Caption = 'Mode'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 10
    object lbl23: TLabel
      Left = 15
      Top = 17
      Width = 59
      Height = 13
      Caption = 'Mode Servo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl24: TLabel
      Left = 15
      Top = 40
      Width = 52
      Height = 13
      Caption = 'Servo Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl25: TLabel
      Left = 15
      Top = 63
      Width = 55
      Height = 13
      Caption = 'Alarm Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object lbl26: TLabel
      Left = 15
      Top = 86
      Width = 79
      Height = 13
      Caption = 'Emergency Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object edtServoPort: TEdit
      Left = 104
      Top = 38
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtAlarmPort: TEdit
      Left = 104
      Top = 63
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtEmergencyPort: TEdit
      Left = 104
      Top = 88
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object cbbModeServo: TComboBox
      Left = 104
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'On'
        'Off')
    end
  end
  object grpConsoleIP: TGroupBox
    Left = 561
    Top = 8
    Width = 344
    Height = 705
    Caption = 'grpConsoleIP'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 11
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 428
    Width = 249
    Height = 79
    Caption = 'Monitor'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 12
    object Label3: TLabel
      Left = 16
      Top = 22
      Width = 48
      Height = 15
      Caption = 'Instructor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 49
      Width = 29
      Height = 15
      Caption = 'Mimic'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbInstrukturMonitor: TComboBox
      Left = 80
      Top = 19
      Width = 153
      Height = 21
      ItemIndex = 1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Text = '2'
      Items.Strings = (
        '1'
        '2')
    end
    object cbbMimcMonitor: TComboBox
      Left = 80
      Top = 46
      Width = 153
      Height = 21
      TabOrder = 1
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '')
    end
  end
  object btnShare: TButton
    Left = 166
    Top = 729
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
    TabOrder = 13
    OnClick = btnCancelClick
  end
  object grpMainEngine: TGroupBox
    Left = 323
    Top = 357
    Width = 188
    Height = 152
    Caption = 'Main  Engine Consol Setting'
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 14
    object Label23: TLabel
      Left = 15
      Top = 52
      Width = 11
      Height = 13
      Caption = 'ID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 15
      Top = 77
      Width = 76
      Height = 13
      Caption = 'Screen_Gauges'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 15
      Top = 127
      Width = 81
      Height = 13
      Caption = 'Screen_Signaling'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 15
      Top = 27
      Width = 25
      Height = 13
      Caption = 'Posisi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 15
      Top = 102
      Width = 84
      Height = 13
      Caption = 'Screen_PMS/HMI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbPosisiMainEngine: TComboBox
      Left = 104
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 0
      Items.Strings = (
        ''
        'Kanan'
        'Kiri')
    end
    object cbbIdMainEngine: TComboBox
      Left = 104
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 1
      Items.Strings = (
        '1'
        '2')
    end
    object cbbScreenGaugesMainEngine: TComboBox
      Left = 104
      Top = 73
      Width = 73
      Height = 21
      TabOrder = 2
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object cbbScrPMSMainEngine: TComboBox
      Left = 104
      Top = 98
      Width = 73
      Height = 21
      TabOrder = 3
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object cbbScreenSignalingMainEngine: TComboBox
      Left = 104
      Top = 123
      Width = 73
      Height = 21
      TabOrder = 4
      Items.Strings = (
        '0'
        '1'
        '2')
    end
  end
  object grpGeneratorConsolSetting: TGroupBox
    Left = 24
    Top = 622
    Width = 249
    Height = 53
    Caption = 'Generator Consol Setting '
    Color = 7960953
    ParentBackground = False
    ParentColor = False
    TabOrder = 15
    object Label27: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 15
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
    end
    object cbbNameGeneratorConsol: TComboBox
      Left = 80
      Top = 21
      Width = 153
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Generator 1'
        'Generator 2'
        'Generator 3'
        'Generator 4'
        '')
    end
  end
  object ComboBox8: TComboBox
    Left = 120
    Top = 31
    Width = 73
    Height = 21
    TabOrder = 16
    Items.Strings = (
      'PCS Kiri'
      'PCS Tengah'
      'PCS Kanan')
  end
end
