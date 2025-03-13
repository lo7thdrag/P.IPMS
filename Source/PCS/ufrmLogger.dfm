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
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcLogger: TPageControl
    Left = 0
    Top = 0
    Width = 309
    Height = 207
    ActivePage = tsNetwork
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 248
    object tsNetwork: TTabSheet
      Caption = 'Network'
      ExplicitHeight = 220
      object mmoNetLogs: TMemo
        Left = 0
        Top = 0
        Width = 301
        Height = 179
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitWidth = 309
        ExplicitHeight = 248
      end
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 207
    Width = 309
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 80
    ExplicitTop = 24
    ExplicitWidth = 185
    object lblAsLPUClient: TLabel
      Left = 24
      Top = 2
      Width = 67
      Height = 13
      Caption = 'lblAsLPUClient'
    end
    object lblAsVREngineClient: TLabel
      Left = 24
      Top = 21
      Width = 94
      Height = 13
      Caption = 'lblAsVREngineClient'
    end
  end
end
