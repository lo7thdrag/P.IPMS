object frmPCSAlarm: TfrmPCSAlarm
  Left = 0
  Top = 0
  Caption = 'Alarm PCS'
  ClientHeight = 137
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object mpAlarmPCS: TMediaPlayer
    Left = 168
    Top = 48
    Width = 253
    Height = 30
    TabOrder = 0
    OnNotify = mpAlarmPCSNotify
  end
end
