object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CONTROLLER'
  ClientHeight = 262
  ClientWidth = 427
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
  object lblAsSimClient: TLabel
    Left = 8
    Top = 243
    Width = 65
    Height = 13
    Caption = 'lblAsSimClient'
  end
  object btnElementTest: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Element Test'
    TabOrder = 0
    OnClick = btnElementTestClick
  end
  object btnNetStart: TButton
    Left = 89
    Top = 8
    Width = 88
    Height = 25
    Caption = 'Network Start'
    TabOrder = 1
    OnClick = btnNetStartClick
  end
  object pgcLog: TPageControl
    Left = 8
    Top = 39
    Width = 409
    Height = 202
    ActivePage = tsElements
    TabOrder = 2
    object tsNetwork: TTabSheet
      Caption = 'Network'
      object mmoLogger: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 174
        Align = alClient
        TabOrder = 0
      end
    end
    object tsElements: TTabSheet
      Caption = 'Elements'
      ImageIndex = 1
      object mmoElementLog: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 174
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
