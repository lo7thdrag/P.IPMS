object frmMainPanel: TfrmMainPanel
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'INSTRUCTOR PANEL'
  ClientHeight = 599
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 580
    Width = 629
    Height = 19
    Panels = <
      item
        Text = 'Simulation Stopped'
        Width = 150
      end
      item
        Text = 'Game Time'
        Width = 150
      end
      item
        Text = 'Real Time'
        Width = 50
      end>
  end
  object pgcPanel: TPageControl
    Left = 0
    Top = 0
    Width = 629
    Height = 580
    ActivePage = tsSystemState
    Align = alClient
    TabOrder = 1
    object tsScenarioLoader: TTabSheet
      Caption = 'Scenario Loader'
    end
    object tsScenarioBuilder: TTabSheet
      Caption = 'Scenario Builder'
      ImageIndex = 1
    end
    object tsRunEvent: TTabSheet
      Caption = 'Log Runner'
      ImageIndex = 2
    end
    object tsSystemState: TTabSheet
      Caption = 'System State'
      ImageIndex = 3
      object grpNetwork: TGroupBox
        Left = 16
        Top = 3
        Width = 297
        Height = 126
        Caption = 'Network'
        TabOrder = 0
        object lblControllerState: TLabel
          Left = 104
          Top = 24
          Width = 65
          Height = 13
          Caption = '<Undefined>'
        end
        object lblMimicState: TLabel
          Left = 104
          Top = 47
          Width = 65
          Height = 13
          Caption = '<Undefined>'
        end
        object lbl1: TLabel
          Left = 16
          Top = 24
          Width = 54
          Height = 13
          Caption = 'Controller :'
        end
        object lbl2: TLabel
          Left = 16
          Top = 47
          Width = 70
          Height = 13
          Caption = 'Mimic System :'
        end
        object lbl3: TLabel
          Left = 16
          Top = 71
          Width = 72
          Height = 13
          Caption = 'PCS Interfaces'
        end
        object lblPCSSystem: TLabel
          Left = 104
          Top = 71
          Width = 65
          Height = 13
          Caption = '<Undefined>'
        end
        object lbl4: TLabel
          Left = 16
          Top = 95
          Width = 107
          Height = 13
          Caption = 'Engine Room System :'
        end
        object lblERSystem: TLabel
          Left = 136
          Top = 95
          Width = 65
          Height = 13
          Caption = '<Undefined>'
        end
      end
      object btnNetwork: TButton
        Left = 319
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Start Network'
        TabOrder = 1
        OnClick = btnNetworkClick
      end
      object mmo1: TMemo
        Left = 16
        Top = 149
        Width = 297
        Height = 270
        TabOrder = 2
      end
    end
  end
  object mmMain: TMainMenu
    Left = 416
    Top = 232
    object Window1: TMenuItem
      Caption = '&System'
      object ControlPanel1: TMenuItem
        Caption = 'Control &Panel'
        OnClick = ControlPanel1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'C&lose'
      end
    end
    object About1: TMenuItem
      Caption = '&About'
    end
  end
end
