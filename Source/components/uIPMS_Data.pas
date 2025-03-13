unit uIPMS_Data;

interface

uses
  Classes, Graphics;

type
  TSensorType = (StpTemperature, StpPressure, StpElectricalPower, StpFlow,
    StpContents, StpLevel, StpElectricalCurrent, StpSpeed, StpFrequency,
    StpResistance, StpConductivity, StpVoltage, StpHumidity, StpCosPhi,
    StpVolume, StpAngle, StpDelta);

  //Analog Sensor Enumeration
  TStatus_AS = (AStaDisableUnavailable, AStaValOK, AStaValHighLow,
    AStaTooLow, AStaTooHigh, AStaWireBreak);
  TStyle_AS = (AStyLeftToRight, AStyTopToBottom);

  //Tank Sensor Enumeration
  TStatus_TS = (TStaDisableUnavailable, TStaValOK, TStaValHighLow,
    TStaTooLowTooHigh);

  //Motor Control Enumeration
  TStatus_MC = (MCtaDisableUnavailable, MCtaStopped, MCtaRunning,
    MCtaNotReadyForUse, MCtaFailedToStart, MCtaRunningFailStop_Faulted_Undetermined);
  TType_MC = (stCentrfgl_pump, stPston_pump, stFan_sngleSpeed,
    stGenerator, stSparator, stFilter);
  TFace_MC = (MCfcRight, MCfcBottom, MCfcLeft, MCfcTop);
  TGenType_MC = (MCgtG1, MCgtG2, MCgtG3, MCgtG4, MCgtEG);

  //Motor Control DualSpeed Enumeration
  TStatus_MD = (MDtaDisableUnavailable, MDtaStopped, MDtaRemoteSupplyLow,
    MDtaRemoteExhaustHigh, MDtaStop_FanNotReady, MDtaStop_FailSupplyLow,
    MDtaStop_FailExhaustHigh, MDtaRunSupplyLow_FailStop,
    MDtaRunSupplyLow_FailExhaustHigh, MDtaRunExhaustHigh_FailSupplyLow1,
    MDtaRunExhaustHigh_FailSupplyLow2, MDtaUndeterminedFaulted);
  TType_MD = (mtBidirectional_fan, mtDoubleSpeed_fan);

  //Motor Control Standby Enumeration
  TStatus_MS = (MStaStoppedNotStandby, MStaRunningFailStandby,
    MStaStoppedFailStandby);

  //Switch Element Enumeration
  TStatus_SW = (SWtaDisabled, SWtaFalse, SWtaOk, SWtaIndicateAlarm, SWtaWarning,
    SWtaAlarm);
  TType_SW = (SWtpSWE, SWtpSWB, SWtpDAE);
  TStyle_SW = (SWtyUp, SWtyDown);
  TSize_SW = (SWszBig, SWszSmall);

  //Switch NBCD Enumeration
  TStatus_SN = (SNtaDisabled, SNtaClosed, SNtaOpen, SNtaAttention, SNtaAlarm);

  //Valve Control Enumeration
  TStatus_VC = (VCtaDisableUnavailable, VCtaClosed, VCtaOpen,
    VCtaNotReadyToClose, VCtaNotReadyToOpen, VCtaCloseFailed, VCtaOpenFailed);
  TStyle_VC = (VCtyHorizontal, VCtyVertical, VCtyBar);
  TType_VC = (VCtpStandart, VCtpNonReturn);

  //Valve Proportionally Enumeration
  TStatus_VP = (VPtaDisableUnavailable, VPtaAlmostClosed, VPtaNotClosed,
    VPtaNotReadyToUse, VPtaTooLow, VPtaTooHigh, VPtaFailed);
  TStyle_VP = (VPtyHorizontal, VPtyVertical);
  TType_VP = (VPtpStandart, VPtpNonReturn);

  //Setpoint Enumeration
  TStatus_SP = (SPtaDisableUnavailable, SPtaNormal);
  TStyle_SP = (SPtyLeftToRight, SPtyTopToBottom);

  //Running Hour Enumeration
  TStatus_RH = (RHtaDisableUnavailable, RHtaNotCounting, RHtaCounting);
  TStyle_RH = (RHtyLeftToRight, RHtyTopToBottom);

  //Switch Event Enumeration
  TStatus_SE = (SEtaDisableUnavailable, SEtaNormal);
  TStyle_SE = (SEtyLeftToRight, SEtyTopToBottom);

  //CircuitBreakerElement
  TStatus_CB = (CBtaDisabledUnavailable, CBtaOpen, CBtaClosed,
    CBtaNotReadyClose, CBtaNotReadyOpen, CBtaFailedCloseTripped,
    CBtaUndertermined, CBtaFailedOpen);
  TStyle_CB = (CBtyHorizontal, CBtyVertical);

  //Control Element Enumeration
  TStatus_CT = (CTtaDisableUnavailable, CTtaOFF, CTtaON, CTtaNotReadyToUse,
    CTtaAlarm);
  TStyle_CT = (CTtyButton, CTtyCheckbox);

  //Computer Enumeration
  TType_PC = (PCtpServer, PCtpClient);

const
  colBlack = TColor($000000);         //RGB(0,    0,    0)
  colGreen = TColor($00C300);         //RGB(0,    195,  0)
  colPink = TColor($FF00FF);          //RGB(255,  0,    255)
  colDarkGreen = TColor($008000);     //RGB(0,    128,  0)
  colYellow = TColor($00FFFF);        //RGB(255,  255,  0)
  colRed = TColor($0000FF);           //RGB(255,  0,    0)
  colSilverGrey = TColor($C0C0C0);    //RGB(192,  192,  192)
  colDarkGrey = TColor($242424);      //RGB(66,   66,   66)
  colMediumBlue = TColor($FF6F6F);    //RGB(111,  111,  255)

  colBrown = TColor($0041C3);         //RGB(195,  65,   0)
  colOlive = TColor($008080);         //RGB(128,  128,  0)
  colTealBlue = TColor($808000);      //RGB(0,    128,  128)
  colGrey = TColor($808080);          //RGB(128,  128,  128)
  colBrightGreen = TColor($00FF00);   //RGB(0,    255,  0)
  colOrange = TColor($0066FF);        //RGB(255,  102,  0)
  colWhite = TColor($FFFFFF);         //RGB(255,  255,  255)

implementation

end.
