object frmLogs: TfrmLogs
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Logger'
  ClientHeight = 248
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object mmoLogs: TMemo
    Left = 0
    Top = 0
    Width = 309
    Height = 248
    Align = alClient
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 0
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 88
    Top = 40
  end
end
