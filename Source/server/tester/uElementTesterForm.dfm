object frmTester: TfrmTester
  Left = 252
  Top = 91
  BorderStyle = bsNone
  Caption = 'Element Tester'
  ClientHeight = 842
  ClientWidth = 1687
  Color = clGray
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
  object pnlElementTesterBackground: TPanel
    Left = 0
    Top = 0
    Width = 1687
    Height = 842
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 763
    ExplicitTop = 344
    object lblController: TLabel
      Left = 16
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Controller :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblElement: TLabel
      Left = 238
      Top = 11
      Width = 59
      Height = 13
      Caption = 'Element ID :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pgcElement: TPageControl
      Left = 5
      Top = 146
      Width = 752
      Height = 551
      ActivePage = tsElement
      TabOrder = 0
      object tsElement: TTabSheet
        Caption = 'Element Control'
        object grpElementInput: TGroupBox
          Left = 3
          Top = 3
          Width = 738
          Height = 518
          Caption = 'Element Input'
          TabOrder = 0
        end
      end
    end
    object btnDisableElement: TButton
      Tag = 2
      Left = 591
      Top = 39
      Width = 98
      Height = 25
      Caption = 'Disable All Element'
      TabOrder = 1
      OnClick = btnEnableElmentClick
    end
    object btnEnableElment: TButton
      Tag = 1
      Left = 591
      Top = 8
      Width = 98
      Height = 25
      Caption = 'Enable All Element'
      TabOrder = 2
      OnClick = btnEnableElmentClick
    end
    object btnFollwer: TButton
      Left = 460
      Top = 115
      Width = 125
      Height = 25
      Caption = 'My Follower'
      TabOrder = 3
      OnClick = btnFollwerClick
    end
    object cbbController: TComboBox
      Left = 76
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnSelect = cbbControllerSelect
    end
    object cbbElement: TComboBox
      Left = 303
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnSelect = cbbElementSelect
    end
    object grpInfo: TGroupBox
      Left = 8
      Top = 35
      Width = 446
      Height = 105
      Caption = '                      '
      Color = clGray
      ParentBackground = False
      ParentColor = False
      TabOrder = 6
      object lblName: TLabel
        Left = 25
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Name :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblElementType: TLabel
        Left = 289
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Type : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSysDec: TLabel
        Left = 12
        Top = 47
        Width = 47
        Height = 13
        Caption = 'SysDesc :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblAlarmGroup: TLabel
        Left = 5
        Top = 70
        Width = 54
        Height = 13
        Caption = 'Alarm Grp :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMimicID: TLabel
        Left = 289
        Top = 47
        Width = 32
        Height = 13
        Caption = 'Mimic :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = -1
        Width = 61
        Height = 13
        Caption = 'Element Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtElementName: TEdit
        Left = 64
        Top = 21
        Width = 222
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtElementType: TEdit
        Left = 332
        Top = 21
        Width = 61
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtSysDesc: TEdit
        Left = 64
        Top = 44
        Width = 222
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtAlarmGroup: TEdit
        Left = 64
        Top = 67
        Width = 222
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtMimicID: TEdit
        Left = 332
        Top = 44
        Width = 61
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object btnGoto: TButton
        Left = 289
        Top = 66
        Width = 104
        Height = 25
        Caption = 'Goto Element..'
        TabOrder = 5
        OnClick = btnGotoClick
      end
    end
    object mmoFollower: TMemo
      Left = 460
      Top = 8
      Width = 125
      Height = 101
      TabOrder = 7
    end
  end
end
