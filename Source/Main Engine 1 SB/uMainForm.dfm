object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Main Form'
  ClientHeight = 500
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tmrBlinkTimer: TTimer
    OnTimer = tmrBlinkMe1Timer
    Left = 432
    Top = 440
  end
end
