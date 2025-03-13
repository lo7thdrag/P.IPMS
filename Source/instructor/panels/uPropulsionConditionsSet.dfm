object frmPropulsionConditions: TfrmPropulsionConditions
  Left = 0
  Top = 0
  Caption = 'Propulsion Conditions'
  ClientHeight = 693
  ClientWidth = 1354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPS_PropulsionConditions: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 689
    TabOrder = 0
    object lbl1: TLabel
      Left = 100
      Top = 29
      Width = 480
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'PROPULSION CONDITIONS ME PS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 8
      Top = 88
      Width = 212
      Height = 422
      Alignment = taCenter
      AutoSize = False
      Caption = 'STARTING INTERLOCKS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 232
      Top = 88
      Width = 212
      Height = 594
      Alignment = taCenter
      AutoSize = False
      Caption = 'ALARMS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 455
      Top = 88
      Width = 212
      Height = 422
      Alignment = taCenter
      AutoSize = False
      Caption = 'SAFETIES STOP'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 8
      Top = 520
      Width = 212
      Height = 162
      Alignment = taCenter
      AutoSize = False
      Caption = 'CLUTCH INTERLOCKS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 455
      Top = 520
      Width = 212
      Height = 162
      Alignment = taCenter
      AutoSize = False
      Caption = 'CPP FAILURE'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object pnlPS_StartingInterlocks: TPanel
      Left = 10
      Top = 108
      Width = 208
      Height = 398
      TabOrder = 0
      object btnPS_SI_RemoteStartInterlock: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'REMOTE START INTERLOCK'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_TurningGearEngaged: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 42
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'TURNING GEAR ENGAGED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_ManHandleAtStop: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 74
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'MAN HANDLE AT STOP'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_FuelRackAtStop: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 106
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FUEL RACK AT STOP'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_Clutched: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 138
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCHED'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_StartingFault: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 170
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STARTING FAULT'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_SlowTurningFault: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 202
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SLOW TURNING FAULT'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_STCSequenceFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 234
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC SEQUENCE FAIL'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_SafetyStop: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 298
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOP'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_PrelubeFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 330
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PRELUBRICATION FAILURE'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_PrelubeInProgress: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 362
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PRELUB IN PROGRESS'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SI_SafetyStopSysFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 266
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOP SYS FAIL'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlPS_ClutchInterlocks: TPanel
      Left = 10
      Top = 540
      Width = 208
      Height = 138
      TabOrder = 1
      object btnPS_CI_PitchNotZero: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PITCH NOT ZERO'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_CI_ShaftLocked: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 41
        Width = 186
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT LOCKED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_CI_PCSClutchInterlock: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 72
        Width = 186
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PCS CLUTCH INTERLOCK'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_CI_ClutchAllowedLOP: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 103
        Width = 186
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH ALLOWED LOP'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlPS_Alarms: TPanel
      Left = 234
      Top = 108
      Width = 208
      Height = 570
      TabOrder = 2
      object btnPS_Alarms_EngineControllerWatchdog: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ENGINE CONTROLLER WATCHDOG'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_CtrlPowerSupplyOn: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 43
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CTRL POWER SUPPLY ON'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_SafetyPowerSuppOn: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 76
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY POWER SUPP ON'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_STCSequenceAlarm: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 109
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC SEQUENCE ALARM'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_GovernorMinorFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 142
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GOVERNOR MINOR FAIL'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_STCInManualMode: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 175
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC IN MANUAL MODE'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_LocalCtrlFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 208
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LOCAL CTRL FAIL'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_ClutchFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 241
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH FAIL'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_DeclutchFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 274
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'DECLUTCH FAIL'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_CommFailEC_PLC: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 307
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'COMM FAIL EC And PLC'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_PLCMonitoringFail: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 340
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PLC MONITORING FAIL'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_ClutchFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 373
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH FAILURE'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_BridgeLeverOORFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 406
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BRIDGE LEVER OOR FAILURE'
        TabOrder = 12
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_MCRLeverOORFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 439
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'MCR LEVER OOR FAILURE'
        TabOrder = 13
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_GeneralSensorFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 472
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GENERAL SENSOR FAILURE'
        TabOrder = 14
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_TrailAlarm: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 505
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'TRAIL ALARM'
        TabOrder = 15
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_Alarms_ResetSafetyStopPossible: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 538
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'RESET SAFETY STOP POSSIBLE'
        TabOrder = 16
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlPS_SafetiesStop: TPanel
      Left = 457
      Top = 108
      Width = 208
      Height = 398
      TabOrder = 3
      object btnPS_SS_SafetyStopOverriden: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOPS OVERRIDEN'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_Overspeed: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 42
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'OVERSPEED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_LOPressureVeryLow: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 74
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LO PRESSURE VERY LOW'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_BearTempVeryHigh: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 106
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BEAR TEMP VERY HIGH'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_FwHtExpTkLevelVeryLow: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 138
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FW HT EXP TK LEVEL VERY LOW'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_FwTempVeryHigh: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 170
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FW TEMP VERY HIGH'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_ConRodBearTempVeryHigh: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 202
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CON ROD BEAR TEMP VERY HIGH'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_RedGearSafetyStop: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 234
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'RED GEAR SAFETY STOP'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_OilMistDetHigh: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 266
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'OIL MIST DET HIGH'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_EmergencyShutdown: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 298
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'EMERGENCY SHUTDOWN'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_LocalEmergStop: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 330
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LOCAL EMERG STOP'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_SS_EngInletLubOilVeryHigh: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 362
        Width = 186
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ENG INLET LUB OIL VERY HIGH'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlPS_CPP: TPanel
      Left = 457
      Top = 540
      Width = 208
      Height = 138
      TabOrder = 4
      object btnPS_CPP_ControlFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'CPP PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CONTROL FAILURE'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_CPP_FollowUpFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 57
        Width = 186
        Height = 25
        Hint = 'CPP PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FOLLOW UP FAILURE'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnPS_CPP_BackupSupplyFailure: TVrDemoButton
        Tag = 1
        Left = 11
        Top = 104
        Width = 186
        Height = 25
        Hint = 'CPP PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BACKUP SUPPLY FAILURE'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlPS_Shaft: TPanel
      Left = 279
      Top = 767
      Width = 250
      Height = 108
      TabOrder = 5
      Visible = False
      object lbl13: TLabel
        Left = 96
        Top = 9
        Width = 54
        Height = 19
        Caption = 'SHAFT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPS_GB_ShaftLock: TVrDemoButton
        Tag = 1
        Left = 24
        Top = 34
        Width = 201
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT LOCK'
        TabOrder = 0
      end
      object btnPS_GB_ShaftPowerLimited: TVrDemoButton
        Tag = 1
        Left = 24
        Top = 65
        Width = 201
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT POWER LIMITED'
        TabOrder = 1
      end
    end
    object pnlPS_Failure: TPanel
      Left = 279
      Top = 881
      Width = 250
      Height = 108
      TabOrder = 6
      Visible = False
      object lbl15: TLabel
        Left = 96
        Top = 9
        Width = 71
        Height = 19
        Caption = 'FAILURE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPS_ME_Failure: TVrDemoButton
        Tag = 1
        Left = 24
        Top = 34
        Width = 201
        Height = 25
        Hint = 'Main Engine PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ME FAILURE'
        TabOrder = 0
      end
      object btnPS_GB_Failure: TVrDemoButton
        Tag = 1
        Left = 24
        Top = 65
        Width = 201
        Height = 25
        Hint = 'Gearbox PS'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GB FAILURE'
        TabOrder = 1
      end
    end
  end
  object pnlSB_PropulsionConditions: TPanel
    Left = 681
    Top = 0
    Width = 675
    Height = 689
    TabOrder = 1
    object lbl6: TLabel
      Left = 100
      Top = 29
      Width = 480
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'PROPULSION CONDITIONS ME SB'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 8
      Top = 88
      Width = 212
      Height = 422
      Alignment = taCenter
      AutoSize = False
      Caption = 'STARTING INTERLOCKS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 232
      Top = 88
      Width = 212
      Height = 594
      Alignment = taCenter
      AutoSize = False
      Caption = 'ALARMS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 455
      Top = 88
      Width = 212
      Height = 422
      Alignment = taCenter
      AutoSize = False
      Caption = 'SAFETIES STOP'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 455
      Top = 520
      Width = 212
      Height = 162
      Alignment = taCenter
      AutoSize = False
      Caption = 'CPP FAILURE'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 8
      Top = 520
      Width = 212
      Height = 162
      Alignment = taCenter
      AutoSize = False
      Caption = 'CLUTCH INTERLOCKS'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object pnlSB_StartingInterlocks: TPanel
      Left = 10
      Top = 108
      Width = 208
      Height = 398
      TabOrder = 0
      object btnSB_SI_RemoteStartInterlock: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 11
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'REMOTE START INTERLOCK'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_TurningGearEngaged: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 43
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'TURNING GEAR ENGAGED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_ManHandleAtStop: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 75
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'MAN HANDLE AT STOP'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_FuelRackAtStop: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 107
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FUEL RACK AT STOP'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_Clutched: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 139
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCHED'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_StartingFault: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 171
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STARTING FAULT'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_SlowTurningFault: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 203
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SLOW TURNING FAULT'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_STCSequenceFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 235
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC SEQUENCE FAIL'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_SafetyStop: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 299
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOP'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_PrelubeFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 331
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PRELUBRICATION FAILURE'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_PrelubeInProgress: TVrDemoButton
        Tag = 2
        Left = 14
        Top = 363
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PRELUB IN PROGRESS'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SI_SafetyStopSysFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 267
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOP SYS FAIL'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlSB_ClutchInterlocks: TPanel
      Left = 10
      Top = 540
      Width = 208
      Height = 138
      TabOrder = 1
      object btnSB_CI_PitchNotZero: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PITCH NOT ZERO'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_CI_ShaftLocked: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 41
        Width = 186
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT LOCKED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_CI_PCSClutchInterlock: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 72
        Width = 186
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PCS CLUTCH INTERLOCK'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_CI_ClutchAllowedLOP: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 103
        Width = 186
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH ALLOWED LOP'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlSB_Alarms: TPanel
      Left = 234
      Top = 108
      Width = 208
      Height = 570
      TabOrder = 2
      object btnSB_Alarms_EngineControllerWatchdog: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ENGINE CONTROLLER WATCHDOG'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_CtrlPowerSupplyOn: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 43
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CTRL POWER SUPPLY ON'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_SafetyPowerSuppOn: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 76
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY POWER SUPP ON'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_STCSequenceAlarm: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 109
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC SEQUENCE ALARM'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_GovernorMinorFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 142
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GOVERNOR MINOR FAIL'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_STCInManualMode: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 175
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'STC IN MANUAL MODE'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_LocalCtrlFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 208
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LOCAL CTRL FAIL'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_ClutchFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 241
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH FAIL'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_DeclutchFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 274
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'DECLUTCH FAIL'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_CommFailEC_PLC: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 307
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'COMM FAIL EC And PLC'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_PLCMonitoringFail: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 340
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'PLC MONITORING FAIL'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_ClutchFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 373
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CLUTCH FAILURE'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_BridgeLeverOORFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 406
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BRIDGE LEVER OOR FAILURE'
        TabOrder = 12
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_MCRLeverOORFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 439
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'MCR LEVER OOR FAILURE'
        TabOrder = 13
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_GeneralSensorFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 472
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GENERAL SENSOR FAILURE'
        TabOrder = 14
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_TrailAlarm: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 505
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'TRAIL ALARM'
        TabOrder = 15
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_Alarms_ResetSafetyStopPossible: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 538
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'RESET SAFETY STOP POSSIBLE'
        TabOrder = 16
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlSB_SafetiesStop: TPanel
      Left = 457
      Top = 108
      Width = 208
      Height = 398
      TabOrder = 3
      object btnSB_SS_SafetyStopOverriden: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SAFETY STOPS OVERRIDEN'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_Overspeed: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 42
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'OVERSPEED'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_LOPressureVeryLow: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 74
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LO PRESSURE VERY LOW'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_BearTempVeryHigh: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 106
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BEAR TEMP VERY HIGH'
        TabOrder = 3
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_FwHtExpTkLevelVeryLow: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 138
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FW HT EXP TK LEVEL VERY LOW'
        TabOrder = 4
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_FwTempVeryHigh: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 170
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FW TEMP VERY HIGH'
        TabOrder = 5
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_ConRodBearTempVeryHigh: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 202
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CON ROD BEAR TEMP VERY HIGH'
        TabOrder = 6
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_RedGearSafetyStop: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 234
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'RED GEAR SAFETY STOP'
        TabOrder = 7
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_OilMistDetHigh: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 266
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'OIL MIST DET HIGH'
        TabOrder = 8
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_EmergencyShutdown: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 298
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'EMERGENCY SHUTDOWN'
        TabOrder = 9
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_LocalEmergStop: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 330
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'LOCAL EMERG STOP'
        TabOrder = 10
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_SS_EngInletLubOilVeryHigh: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 362
        Width = 186
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -12
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ENG INLET LUB OIL VERY HIGH'
        TabOrder = 11
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlSB_CPP: TPanel
      Left = 457
      Top = 540
      Width = 208
      Height = 138
      TabOrder = 4
      object btnSB_CPP_ControlFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 10
        Width = 186
        Height = 25
        Hint = 'CPP SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'CONTROL FAILURE'
        TabOrder = 0
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_CPP_FollowUpFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 57
        Width = 186
        Height = 25
        Hint = 'CPP SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'FOLLOW UP FAILURE'
        TabOrder = 1
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
      object btnSB_CPP_BackupSupplyFailure: TVrDemoButton
        Tag = 2
        Left = 11
        Top = 104
        Width = 186
        Height = 25
        Hint = 'CPP SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'BACKUP SUPPLY FAILURE'
        TabOrder = 2
        OnMouseDown = btnPropulsionConditionsMouseDown
      end
    end
    object pnlSB_ShaftLock: TPanel
      Left = 279
      Top = 767
      Width = 250
      Height = 108
      TabOrder = 5
      Visible = False
      object lbl14: TLabel
        Left = 96
        Top = 9
        Width = 54
        Height = 19
        Caption = 'SHAFT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSB_GB_ShaftLock: TVrDemoButton
        Tag = 2
        Left = 24
        Top = 34
        Width = 201
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT LOCK'
        TabOrder = 0
      end
      object btnSB_GB_ShaftPowerLimited: TVrDemoButton
        Tag = 2
        Left = 24
        Top = 65
        Width = 201
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'SHAFT POWER LIMITED'
        TabOrder = 1
      end
    end
    object pnlSB_Failure: TPanel
      Left = 279
      Top = 881
      Width = 250
      Height = 108
      TabOrder = 6
      Visible = False
      object lbl16: TLabel
        Left = 96
        Top = 9
        Width = 71
        Height = 19
        Caption = 'FAILURE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSB_ME_Failure: TVrDemoButton
        Tag = 2
        Left = 24
        Top = 34
        Width = 201
        Height = 25
        Hint = 'Main Engine SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'ME FAILURE'
        TabOrder = 0
      end
      object btnSB_GB_Failure: TVrDemoButton
        Tag = 2
        Left = 24
        Top = 65
        Width = 201
        Height = 25
        Hint = 'Gearbox SB'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'GB FAILURE'
        TabOrder = 1
      end
    end
  end
  object pmAlarm: TPopupMenu
    Left = 608
    Top = 696
    object mniAlarmOn: TMenuItem
      Tag = 1
      Caption = 'Alarm On'
      OnClick = mniAlarmOnClick
    end
    object mniAlarmOff: TMenuItem
      Tag = 2
      Caption = 'Alarm Off'
      OnClick = mniAlarmOnClick
    end
  end
end
