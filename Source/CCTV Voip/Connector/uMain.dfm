object fConnectorFrm: TfConnectorFrm
  Left = 0
  Top = 0
  Caption = 'Connector'
  ClientHeight = 200
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlName: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 41
    Align = alTop
    Caption = 'CONNECTOR'
    Color = clGrayText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlClient: TPanel
    Left = 0
    Top = 159
    Width = 357
    Height = 41
    Align = alBottom
    Alignment = taRightJustify
    Caption = 'Waiting  '
    TabOrder = 1
    OnClick = pnlClientClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 357
    Height = 118
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object ppMenu: TPopupMenu
    Left = 296
    Top = 88
    object Showwarningonfaileddevicecheck1: TMenuItem
      Caption = 'Show warning on failed device check'
      OnClick = Showwarningonfaileddevicecheck1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miHide1: TMenuItem
      Caption = 'Hide Debug Window'
      OnClick = miHide1Click
    end
    object miShow1: TMenuItem
      Caption = 'Show Debug Window'
      OnClick = miShow1Click
    end
    object miExit1: TMenuItem
      Caption = 'Close Connector'
      OnClick = miExit1Click
    end
  end
  object tmrInternalRunChk: TTimer
    Enabled = False
    OnTimer = tmrInternalRunChkTimer
    Left = 24
    Top = 8
  end
  object tmrDeviceTender: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmrDeviceTenderTimer
    Left = 104
    Top = 72
  end
end
