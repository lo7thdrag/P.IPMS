object frmPCSEditor: TfrmPCSEditor
  Left = 320
  Top = 90
  Caption = 'PCS Editor'
  ClientHeight = 401
  ClientWidth = 943
  Color = clGray
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
  object lblName: TLabel
    Left = 25
    Top = 53
    Width = 111
    Height = 17
    Caption = 'Condition Name :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 40
    Top = 110
    Width = 50
    Height = 17
    Caption = 'Control '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 40
    Top = 247
    Width = 148
    Height = 17
    Caption = 'Gear Box Port Engaged'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 40
    Top = 274
    Width = 192
    Height = 19
    Caption = 'Gear Box Starboard Engaged'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 40
    Top = 303
    Width = 112
    Height = 16
    Caption = 'Mode Engine Port'#13#10
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl11: TLabel
    Left = 40
    Top = 329
    Width = 151
    Height = 17
    Caption = 'Mode Engine Starboard '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl12: TLabel
    Left = 40
    Top = 193
    Width = 153
    Height = 17
    Caption = 'Main Engine Port Status '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl13: TLabel
    Left = 40
    Top = 220
    Width = 188
    Height = 17
    Caption = 'Main Engine Starboard Status '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 40
    Top = 137
    Width = 84
    Height = 17
    Caption = 'Remote Port '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object lblModeEngStar: TLabel
    Left = 561
    Top = 332
    Width = 78
    Height = 13
    Caption = 'lblModeEngStar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblModeEngPort: TLabel
    Left = 561
    Top = 281
    Width = 78
    Height = 13
    Caption = 'lblModeEngPort'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl3: TLabel
    Left = 40
    Top = 164
    Width = 119
    Height = 19
    Caption = 'Remote Starboard '#13#10
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
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
  object Label3: TLabel
    Left = 230
    Top = 107
    Width = 7
    Height = 23
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 230
    Top = 136
    Width = 5
    Height = 19
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 230
    Top = 192
    Width = 7
    Height = 19
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 230
    Top = 163
    Width = 5
    Height = 21
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 230
    Top = 218
    Width = 7
    Height = 21
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 230
    Top = 244
    Width = 5
    Height = 23
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 230
    Top = 274
    Width = 5
    Height = 19
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 230
    Top = 301
    Width = 5
    Height = 19
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 230
    Top = 328
    Width = 5
    Height = 18
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
  end
  object acttb1: TActionToolBar
    Left = 0
    Top = 0
    Width = 943
    Height = 23
    ActionManager = actmgr1
    Caption = 'acttb1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 10461087
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
    ExplicitWidth = 1284
  end
  object edtName: TEdit
    Left = 142
    Top = 51
    Width = 243
    Height = 21
    MaxLength = 35
    TabOrder = 1
    OnChange = edtNameChange
  end
  object cbbControl: TComboBox
    Tag = 1
    Left = 241
    Top = 108
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
    Left = 241
    Top = 245
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
    Left = 241
    Top = 273
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
    Left = 241
    Top = 301
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
    Left = 241
    Top = 327
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
    Left = 241
    Top = 191
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
    Left = 241
    Top = 218
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
    Left = 241
    Top = 135
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
    Left = 405
    Top = 312
    Width = 150
    Height = 36
    TabOrder = 10
    Visible = False
    OnChange = trckbrHelmEngStarChange
  end
  object trckbrHelmEngPort: TTrackBar
    Left = 405
    Top = 257
    Width = 150
    Height = 36
    TabOrder = 11
    Visible = False
    OnChange = trckbrHelmEngPortChange
  end
  object cbbRemoteStar: TComboBox
    Tag = 3
    Left = 241
    Top = 163
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
    Left = 848
    Top = 35
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
