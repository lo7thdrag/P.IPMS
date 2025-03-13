object frmTester: TfrmTester
  Left = 252
  Top = 91
  BorderStyle = bsToolWindow
  Caption = 'Element Tester'
  ClientHeight = 704
  ClientWidth = 761
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
  object lblController: TLabel
    Left = 16
    Top = 12
    Width = 54
    Height = 13
    Caption = 'Controller :'
  end
  object lblElement: TLabel
    Left = 238
    Top = 11
    Width = 59
    Height = 13
    Caption = 'Element ID :'
  end
  object cbbController: TComboBox
    Left = 76
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnSelect = cbbControllerSelect
  end
  object cbbElement: TComboBox
    Left = 303
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnSelect = cbbElementSelect
  end
  object grpInfo: TGroupBox
    Left = 8
    Top = 35
    Width = 446
    Height = 105
    Caption = 'Element Info'
    TabOrder = 2
    object lblName: TLabel
      Left = 25
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object lblElementType: TLabel
      Left = 289
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Type : '
    end
    object lblSysDec: TLabel
      Left = 12
      Top = 47
      Width = 47
      Height = 13
      Caption = 'SysDesc :'
    end
    object lblAlarmGroup: TLabel
      Left = 5
      Top = 70
      Width = 54
      Height = 13
      Caption = 'Alarm Grp :'
    end
    object lblMimicID: TLabel
      Left = 289
      Top = 47
      Width = 32
      Height = 13
      Caption = 'Mimic :'
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
  object btnFollwer: TButton
    Left = 460
    Top = 115
    Width = 125
    Height = 25
    Caption = 'My Follower'
    TabOrder = 3
    OnClick = btnFollwerClick
  end
  object pgcElement: TPageControl
    Left = 5
    Top = 146
    Width = 752
    Height = 551
    ActivePage = tsElement
    TabOrder = 4
    object tsElement: TTabSheet
      Caption = 'Element Control'
      ExplicitHeight = 529
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
  object mmoFollower: TMemo
    Left = 460
    Top = 8
    Width = 125
    Height = 101
    TabOrder = 5
  end
  object btnEnableElment: TButton
    Tag = 1
    Left = 591
    Top = 8
    Width = 98
    Height = 25
    Caption = 'Enable All Element'
    TabOrder = 6
    OnClick = btnEnableElmentClick
  end
  object btnDisableElement: TButton
    Tag = 2
    Left = 591
    Top = 39
    Width = 98
    Height = 25
    Caption = 'Disable All Element'
    TabOrder = 7
    OnClick = btnEnableElmentClick
  end
end
