object frmSetting: TfrmSetting
  Left = 425
  Top = 102
  BorderStyle = bsToolWindow
  Caption = 'IPMS Setting'
  ClientHeight = 633
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    476
    633)
  PixelsPerInch = 96
  TextHeight = 13
  object grpDatabase: TGroupBox
    Left = 8
    Top = 6
    Width = 236
    Height = 149
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Database'
    TabOrder = 0
    ExplicitWidth = 235
    object lblServer: TLabel
      Left = 16
      Top = 20
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object lbl1: TLabel
      Left = 16
      Top = 63
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object lblPassword: TLabel
      Left = 16
      Top = 87
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object lblDBName: TLabel
      Left = 16
      Top = 39
      Width = 43
      Height = 13
      Caption = 'DB Name'
    end
    object Label2: TLabel
      Left = 16
      Top = 111
      Width = 39
      Height = 13
      Caption = 'Protocol'
    end
    object edtConnection: TEdit
      Left = 80
      Top = 11
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtUser: TEdit
      Left = 80
      Top = 59
      Width = 153
      Height = 21
      TabOrder = 2
    end
    object edtPassword: TEdit
      Left = 80
      Top = 83
      Width = 153
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtDBName: TEdit
      Left = 80
      Top = 35
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtDBProtocol: TEdit
      Left = 80
      Top = 107
      Width = 153
      Height = 21
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 8
    Top = 599
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 89
    Top = 599
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 342
    Width = 236
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Instructor'
    TabOrder = 3
    ExplicitWidth = 235
    object lbl2: TLabel
      Left = 16
      Top = 67
      Width = 64
      Height = 13
      Caption = 'Loaded App :'
    end
    object lbl3: TLabel
      Left = 16
      Top = 19
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object lbl4: TLabel
      Left = 16
      Top = 43
      Width = 20
      Height = 13
      Caption = 'Port'
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
      Top = 39
      Width = 153
      Height = 21
      TabOrder = 2
    end
  end
  object grpSimEngineSet: TGroupBox
    Left = 8
    Top = 156
    Width = 236
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Sim Engine Setting'
    TabOrder = 4
    ExplicitWidth = 235
    object lblSimEngineSvr: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object lblSimEnginePort: TLabel
      Left = 16
      Top = 43
      Width = 20
      Height = 13
      Caption = 'Port'
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
    Left = 8
    Top = 223
    Width = 236
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    Caption = 'LPU Setting'
    TabOrder = 5
    ExplicitWidth = 235
    object lblLPUServer: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object lblLPUPort: TLabel
      Left = 16
      Top = 43
      Width = 20
      Height = 13
      Caption = 'Port'
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
    Left = 8
    Top = 294
    Width = 243
    Height = 49
    Caption = 'Role'
    TabOrder = 6
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object cbbRoleName: TComboBox
      Left = 80
      Top = 15
      Width = 145
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
  object grp2: TGroupBox
    Left = 8
    Top = 415
    Width = 243
    Height = 50
    Caption = 'Mimic Monitor Setting'
    TabOrder = 7
    object lbl5: TLabel
      Left = 16
      Top = 17
      Width = 25
      Height = 13
      Caption = 'Mimic'
    end
    object cbbMimicMonitor: TComboBox
      Left = 81
      Top = 13
      Width = 96
      Height = 21
      TabOrder = 0
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3')
    end
  end
  object grpIDServo: TGroupBox
    Left = 283
    Top = 8
    Width = 185
    Height = 218
    Caption = 'Servo ID'
    TabOrder = 8
    object lbl6: TLabel
      Left = 7
      Top = 14
      Width = 53
      Height = 13
      Caption = 'RPM ME PS'
    end
    object lbl7: TLabel
      Left = 7
      Top = 41
      Width = 53
      Height = 13
      Caption = 'RPM ME SB'
    end
    object lbl8: TLabel
      Left = 7
      Top = 68
      Width = 71
      Height = 13
      Caption = 'RPM SHAFT PS'
    end
    object lbl9: TLabel
      Left = 7
      Top = 94
      Width = 71
      Height = 13
      Caption = 'RPM SHAFT SB'
    end
    object lbl10: TLabel
      Left = 7
      Top = 118
      Width = 34
      Height = 13
      Caption = 'CPP PS'
    end
    object lbl11: TLabel
      Left = 7
      Top = 143
      Width = 34
      Height = 13
      Caption = 'CPP SB'
    end
    object lbl12: TLabel
      Left = 7
      Top = 167
      Width = 56
      Height = 13
      Caption = 'RUDDER PS'
    end
    object lbl13: TLabel
      Left = 7
      Top = 191
      Width = 56
      Height = 13
      Caption = 'RUDDER SB'
    end
    object edtIDRPMMEPS: TEdit
      Left = 96
      Top = 11
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtIDRPMMESB: TEdit
      Left = 96
      Top = 38
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtIDRPMSHAFTPS: TEdit
      Left = 96
      Top = 65
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edtIDRPMSHAFTSB: TEdit
      Left = 96
      Top = 91
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object edtIDCPPSB: TEdit
      Left = 96
      Top = 140
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object edtIDRUDDERPS: TEdit
      Left = 96
      Top = 164
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object edtIDRUDDERSB: TEdit
      Left = 96
      Top = 188
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object edtIDCPPPS: TEdit
      Left = 96
      Top = 115
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object grpServoDegree: TGroupBox
    Left = 283
    Top = 359
    Width = 185
    Height = 227
    Caption = 'Servo Degree'
    TabOrder = 9
    object lbl14: TLabel
      Left = 7
      Top = 14
      Width = 53
      Height = 13
      Caption = 'RPM ME PS'
    end
    object lbl15: TLabel
      Left = 7
      Top = 41
      Width = 53
      Height = 13
      Caption = 'RPM ME SB'
    end
    object lbl16: TLabel
      Left = 7
      Top = 68
      Width = 71
      Height = 13
      Caption = 'RPM SHAFT PS'
    end
    object lbl17: TLabel
      Left = 7
      Top = 94
      Width = 71
      Height = 13
      Caption = 'RPM SHAFT SB'
    end
    object lbl18: TLabel
      Left = 7
      Top = 118
      Width = 34
      Height = 13
      Caption = 'CPP PS'
    end
    object lbl19: TLabel
      Left = 7
      Top = 143
      Width = 34
      Height = 13
      Caption = 'CPP SB'
    end
    object lbl20: TLabel
      Left = 7
      Top = 167
      Width = 56
      Height = 13
      Caption = 'RUDDER PS'
    end
    object lbl21: TLabel
      Left = 7
      Top = 191
      Width = 56
      Height = 13
      Caption = 'RUDDER SB'
    end
    object edtDegRPMMEPS: TEdit
      Left = 96
      Top = 11
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtDegRPMMESB: TEdit
      Left = 96
      Top = 36
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtDegRPMSHAFTPS: TEdit
      Left = 96
      Top = 63
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edtDegRPMSHAFTSB: TEdit
      Left = 96
      Top = 88
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object edtDegCPPSB: TEdit
      Left = 96
      Top = 140
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object edtDegRUDDERPS: TEdit
      Left = 96
      Top = 166
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object edtDegRUDDERSB: TEdit
      Left = 96
      Top = 191
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object edtDegCPPPS: TEdit
      Left = 96
      Top = 115
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object grp3: TGroupBox
    Left = 8
    Top = 471
    Width = 243
    Height = 115
    Caption = 'Form PCS'
    TabOrder = 10
    object lbl22: TLabel
      Left = 7
      Top = 17
      Width = 60
      Height = 13
      Caption = 'ID Form PCS'
    end
    object cbbidFormPCS: TComboBox
      Left = 80
      Top = 17
      Width = 97
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'PCS Kiri'
        'PCS Tengah'
        'PCS Kanan')
    end
  end
  object grp4: TGroupBox
    Left = 283
    Top = 232
    Width = 185
    Height = 121
    Caption = 'Mode'
    TabOrder = 11
    object lbl23: TLabel
      Left = 7
      Top = 14
      Width = 57
      Height = 13
      Caption = 'Mode Servo'
    end
    object lbl24: TLabel
      Left = 7
      Top = 41
      Width = 51
      Height = 13
      Caption = 'Servo Port'
    end
    object lbl25: TLabel
      Left = 7
      Top = 68
      Width = 50
      Height = 13
      Caption = 'Alarm Port'
    end
    object lbl26: TLabel
      Left = 7
      Top = 94
      Width = 76
      Height = 13
      Caption = 'Emergency Port'
    end
    object edtServoPort: TEdit
      Left = 96
      Top = 36
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtAlarmPort: TEdit
      Left = 96
      Top = 63
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtEmergencyPort: TEdit
      Left = 96
      Top = 88
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object cbbModeServo: TComboBox
      Left = 96
      Top = 9
      Width = 74
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'On'
        'Off')
    end
  end
  object grpConsoleIP: TGroupBox
    Left = 513
    Top = 8
    Width = 328
    Height = 305
    Caption = 'grpConsoleIP'
    TabOrder = 12
    object lbl27: TLabel
      Left = 20
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Instruktur IP'
    end
    object lbl28: TLabel
      Left = 20
      Top = 51
      Width = 33
      Height = 13
      Caption = 'ACS IP'
    end
    object lbl29: TLabel
      Left = 20
      Top = 78
      Width = 55
      Height = 13
      Caption = 'Mimic Kiri IP'
    end
    object lbl30: TLabel
      Left = 20
      Top = 105
      Width = 49
      Height = 13
      Caption = 'PCS Kiri IP'
    end
    object lbl31: TLabel
      Left = 20
      Top = 132
      Width = 77
      Height = 13
      Caption = 'Mimic Tengah IP'
    end
    object lbl32: TLabel
      Left = 20
      Top = 159
      Width = 65
      Height = 13
      Caption = 'PCS Kanan IP'
    end
    object lbl33: TLabel
      Left = 20
      Top = 186
      Width = 71
      Height = 13
      Caption = 'Mimic Kanan IP'
    end
    object lbl34: TLabel
      Left = 20
      Top = 213
      Width = 91
      Height = 13
      Caption = 'Emergency Stop IP'
    end
    object lbl35: TLabel
      Left = 20
      Top = 240
      Width = 39
      Height = 13
      Caption = 'CCTV IP'
    end
    object lbl36: TLabel
      Left = 20
      Top = 267
      Width = 32
      Height = 13
      Caption = 'Server'
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
      Top = 48
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object edtMimicKiriIP: TEdit
      Left = 156
      Top = 75
      Width = 153
      Height = 21
      TabOrder = 2
    end
    object edtPCSKiriIP: TEdit
      Left = 156
      Top = 102
      Width = 153
      Height = 21
      TabOrder = 3
    end
    object edtPCSKananIP: TEdit
      Left = 156
      Top = 156
      Width = 153
      Height = 21
      TabOrder = 4
    end
    object edtMimicTengahIP: TEdit
      Left = 156
      Top = 129
      Width = 153
      Height = 21
      TabOrder = 5
    end
    object edtMimicKananIP: TEdit
      Left = 156
      Top = 183
      Width = 153
      Height = 21
      TabOrder = 6
    end
    object edtEmergencyStopIP: TEdit
      Left = 156
      Top = 210
      Width = 153
      Height = 21
      TabOrder = 7
    end
    object edtCCTVIP: TEdit
      Left = 156
      Top = 237
      Width = 153
      Height = 21
      TabOrder = 8
    end
    object edtServer: TEdit
      Left = 156
      Top = 264
      Width = 153
      Height = 21
      TabOrder = 9
    end
  end
end
