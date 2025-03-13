object frmPCSEditor: TfrmPCSEditor
  Left = 320
  Top = 90
  Caption = 'PCS Editor'
  ClientHeight = 410
  ClientWidth = 1354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 379
    Height = 39
    Alignment = taCenter
    AutoSize = False
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 11
    Top = 43
    Width = 373
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label37: TLabel
    Left = 8
    Top = 85
    Width = 1338
    Height = 298
    Alignment = taCenter
    AutoSize = False
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label38: TLabel
    Left = 11
    Top = 88
    Width = 1332
    Height = 292
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object lblName: TLabel
    Left = 25
    Top = 53
    Width = 82
    Height = 13
    Caption = 'Condition Name :'
  end
  object lbl1: TLabel
    Left = 40
    Top = 111
    Width = 45
    Height = 13
    Caption = 'Control : '
  end
  object lbl5: TLabel
    Left = 40
    Top = 238
    Width = 112
    Height = 13
    Caption = 'Gear Box Port Engaged'
  end
  object lbl7: TLabel
    Left = 40
    Top = 264
    Width = 140
    Height = 13
    Caption = 'Gear Box Starboard Engaged'
  end
  object lbl10: TLabel
    Left = 40
    Top = 290
    Width = 88
    Height = 13
    Caption = 'Mode Engine Port:'
    Visible = False
  end
  object lbl11: TLabel
    Left = 40
    Top = 330
    Width = 119
    Height = 13
    Caption = 'Mode Engine Starboard :'
    Visible = False
  end
  object lbl12: TLabel
    Left = 40
    Top = 188
    Width = 124
    Height = 13
    Caption = 'Main Engine Port Status : '
  end
  object lbl13: TLabel
    Left = 40
    Top = 213
    Width = 152
    Height = 13
    Caption = 'Main Engine Starboard Status : '
  end
  object lbl2: TLabel
    Left = 40
    Top = 136
    Width = 70
    Height = 13
    Caption = 'Remote Port : '
  end
  object lblModeEngStar: TLabel
    Left = 561
    Top = 330
    Width = 74
    Height = 13
    Caption = 'lblModeEngStar'
    Visible = False
  end
  object lblModeEngPort: TLabel
    Left = 561
    Top = 290
    Width = 74
    Height = 13
    Caption = 'lblModeEngPort'
    Visible = False
  end
  object lbl3: TLabel
    Left = 40
    Top = 162
    Width = 98
    Height = 13
    Caption = 'Remote Starboard : '
  end
  object lblWarning2: TLabel
    Left = 402
    Top = 53
    Width = 396
    Height = 13
    Caption = 
      '* Condition Name is already in use, Please use another condition' +
      ' name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object acttb1: TActionToolBar
    Left = 0
    Top = 0
    Width = 1354
    Height = 23
    ActionManager = actmgr1
    Caption = 'acttb1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object edtName: TEdit
    Left = 122
    Top = 49
    Width = 243
    Height = 21
    MaxLength = 35
    TabOrder = 1
    OnChange = edtNameChange
  end
  object cbbControl: TComboBox
    Tag = 1
    Left = 238
    Top = 107
    Width = 145
    Height = 21
    Hint = 'Control'
    Style = csDropDownList
    TabOrder = 2
    OnChange = cbbControlChange
    Items.Strings = (
      'Local'
      'Remote')
  end
  object cbbGearBoxPort: TComboBox
    Tag = 6
    Left = 238
    Top = 234
    Width = 145
    Height = 21
    Hint = 'Gear Box Port Engaged'
    Style = csDropDownList
    TabOrder = 3
    OnChange = cbbControlChange
    Items.Strings = (
      'Engaged'
      'Disengaged')
  end
  object cbbGearBoxStar: TComboBox
    Tag = 7
    Left = 238
    Top = 260
    Width = 145
    Height = 21
    Hint = 'Gear Box Starboard Engaged'
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbbControlChange
    Items.Strings = (
      'Engaged'
      'Disengaged')
  end
  object cbbModeEngPort: TComboBox
    Tag = 8
    Left = 238
    Top = 286
    Width = 145
    Height = 21
    Hint = 'Mode Engine Port'
    Style = csDropDownList
    TabOrder = 5
    Visible = False
    OnChange = cbbModeEngPortChange
    Items.Strings = (
      'Manouvering'
      'Transit')
  end
  object cbbModeEngStar: TComboBox
    Tag = 9
    Left = 238
    Top = 326
    Width = 145
    Height = 21
    Hint = 'Mode Engine Starboard'
    Style = csDropDownList
    TabOrder = 6
    Visible = False
    OnChange = cbbModeEngStarChange
    Items.Strings = (
      'Manouvering'
      'Transit')
  end
  object cbbMainEnginePort: TComboBox
    Tag = 4
    Left = 238
    Top = 184
    Width = 145
    Height = 21
    Hint = 'Main Engine Port Status'
    Style = csDropDownList
    TabOrder = 7
    OnChange = cbbControlChange
    Items.Strings = (
      'Not Running'
      'Running')
  end
  object cbbMainEngineStar: TComboBox
    Tag = 5
    Left = 238
    Top = 209
    Width = 145
    Height = 21
    Hint = 'Main Engine Starboard Status'
    Style = csDropDownList
    TabOrder = 8
    OnChange = cbbControlChange
    Items.Strings = (
      'Not Running'
      'Running')
  end
  object cbbRemotePort: TComboBox
    Tag = 2
    Left = 238
    Top = 132
    Width = 145
    Height = 21
    Hint = 'Remote Port'
    Style = csDropDownList
    TabOrder = 9
    OnChange = cbbControlChange
    Items.Strings = (
      'Auto'
      'Manual')
  end
  object trckbrHelmEngStar: TTrackBar
    Left = 389
    Top = 326
    Width = 150
    Height = 36
    TabOrder = 10
    Visible = False
    OnChange = trckbrHelmEngStarChange
  end
  object trckbrHelmEngPort: TTrackBar
    Left = 389
    Top = 286
    Width = 150
    Height = 36
    TabOrder = 11
    Visible = False
    OnChange = trckbrHelmEngPortChange
  end
  object cbbRemoteStar: TComboBox
    Tag = 3
    Left = 238
    Top = 158
    Width = 145
    Height = 21
    Hint = 'Remote Starboard'
    Style = csDropDownList
    TabOrder = 12
    OnChange = cbbControlChange
    Items.Strings = (
      'Auto'
      'Manual')
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actNew
          end
          item
            Action = actDelete
          end
          item
            Caption = '-'
          end
          item
            Action = actSave
          end
          item
            Action = actCancel
          end
          item
            Caption = '-'
          end
          item
            Action = actPick
          end>
        ActionBar = acttb1
      end>
    Left = 1000
    Top = 43
    StyleName = 'Platform Default'
    object actNew: TAction
      Caption = 'Ne&w'
      OnExecute = actNewExecute
    end
    object actPick: TAction
      Caption = '&Choose..'
      OnExecute = actPickExecute
    end
    object actSave: TAction
      Caption = 'Sa&ve / Update'
      OnExecute = actSaveExecute
    end
    object actDelete: TAction
      Caption = 'D&elete'
      OnExecute = actDeleteExecute
    end
    object actCancel: TAction
      Caption = 'Ca&ncel'
      OnExecute = actCancelExecute
    end
  end
end
