object frmFAEditor: TfrmFAEditor
  Left = 0
  Top = 0
  Caption = 'Function Allocation Editor'
  ClientHeight = 502
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
    Height = 392
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
    Height = 386
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
  object lblAlarm_IPMS: TLabel
    Left = 75
    Top = 404
    Width = 32
    Height = 16
    Caption = 'IPMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_IAS: TLabel
    Left = 75
    Top = 430
    Width = 23
    Height = 16
    Caption = 'IAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Navigation: TLabel
    Left = 75
    Top = 352
    Width = 68
    Height = 16
    Caption = 'Navigation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Ballast: TLabel
    Left = 75
    Top = 378
    Width = 43
    Height = 16
    Caption = 'Ballast'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRole_PCS: TLabel
    Left = 462
    Top = 112
    Width = 24
    Height = 16
    Caption = 'PCS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRole_E: TLabel
    Left = 561
    Top = 112
    Width = 7
    Height = 16
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRole_IPMS: TLabel
    Left = 253
    Top = 112
    Width = 32
    Height = 16
    Caption = 'IPMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRole_AUX: TLabel
    Left = 360
    Top = 112
    Width = 27
    Height = 16
    Caption = 'AUX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Propultion: TLabel
    Left = 75
    Top = 196
    Width = 66
    Height = 16
    Caption = 'Propultion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Auxiliary: TLabel
    Left = 75
    Top = 222
    Width = 56
    Height = 16
    Caption = 'Auxiliary'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_DGSETS: TLabel
    Left = 75
    Top = 144
    Width = 47
    Height = 16
    Caption = 'DGSETS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Distribution: TLabel
    Left = 75
    Top = 170
    Width = 75
    Height = 16
    Caption = 'Distribution'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_HVAC: TLabel
    Left = 75
    Top = 300
    Width = 36
    Height = 16
    Caption = 'HVAC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_FFDC: TLabel
    Left = 75
    Top = 326
    Width = 29
    Height = 16
    Caption = 'FFDC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Fuel: TLabel
    Left = 75
    Top = 248
    Width = 25
    Height = 16
    Caption = 'Fuel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAlarm_Domest: TLabel
    Left = 75
    Top = 274
    Width = 49
    Height = 16
    Caption = 'Domest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
  object CheckBox27: TCheckBox
    Tag = 3
    Left = 465
    Top = 195
    Width = 17
    Height = 17
    TabOrder = 2
  end
  object CheckBox28: TCheckBox
    Tag = 4
    Left = 465
    Top = 221
    Width = 17
    Height = 17
    TabOrder = 3
  end
  object CheckBox25: TCheckBox
    Tag = 1
    Left = 465
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 4
  end
  object CheckBox26: TCheckBox
    Tag = 2
    Left = 465
    Top = 169
    Width = 17
    Height = 17
    TabOrder = 5
  end
  object CheckBox31: TCheckBox
    Tag = 7
    Left = 465
    Top = 299
    Width = 17
    Height = 17
    TabOrder = 6
  end
  object CheckBox32: TCheckBox
    Tag = 8
    Left = 465
    Top = 325
    Width = 17
    Height = 17
    TabOrder = 7
  end
  object CheckBox29: TCheckBox
    Tag = 5
    Left = 465
    Top = 247
    Width = 17
    Height = 17
    TabOrder = 8
  end
  object CheckBox30: TCheckBox
    Tag = 6
    Left = 465
    Top = 273
    Width = 17
    Height = 17
    TabOrder = 9
  end
  object CheckBox19: TCheckBox
    Tag = 7
    Left = 365
    Top = 299
    Width = 17
    Height = 17
    TabOrder = 10
  end
  object CheckBox20: TCheckBox
    Tag = 8
    Left = 365
    Top = 325
    Width = 17
    Height = 17
    TabOrder = 11
  end
  object CheckBox17: TCheckBox
    Tag = 5
    Left = 365
    Top = 247
    Width = 17
    Height = 17
    TabOrder = 12
  end
  object CheckBox18: TCheckBox
    Tag = 6
    Left = 365
    Top = 273
    Width = 17
    Height = 17
    TabOrder = 13
  end
  object CheckBox23: TCheckBox
    Tag = 11
    Left = 365
    Top = 403
    Width = 17
    Height = 17
    TabOrder = 14
  end
  object CheckBox24: TCheckBox
    Tag = 12
    Left = 365
    Top = 429
    Width = 17
    Height = 17
    Enabled = False
    TabOrder = 15
  end
  object CheckBox21: TCheckBox
    Tag = 9
    Left = 365
    Top = 351
    Width = 17
    Height = 17
    TabOrder = 16
  end
  object CheckBox22: TCheckBox
    Tag = 10
    Left = 365
    Top = 377
    Width = 17
    Height = 17
    TabOrder = 17
  end
  object CheckBox43: TCheckBox
    Tag = 7
    Left = 556
    Top = 299
    Width = 17
    Height = 17
    TabOrder = 18
  end
  object CheckBox44: TCheckBox
    Tag = 8
    Left = 556
    Top = 325
    Width = 17
    Height = 17
    TabOrder = 19
  end
  object CheckBox41: TCheckBox
    Tag = 5
    Left = 556
    Top = 247
    Width = 17
    Height = 17
    TabOrder = 20
  end
  object CheckBox42: TCheckBox
    Tag = 6
    Left = 556
    Top = 273
    Width = 17
    Height = 17
    TabOrder = 21
  end
  object CheckBox47: TCheckBox
    Tag = 11
    Left = 556
    Top = 403
    Width = 17
    Height = 17
    TabOrder = 22
  end
  object CheckBox48: TCheckBox
    Tag = 12
    Left = 556
    Top = 429
    Width = 17
    Height = 17
    Enabled = False
    TabOrder = 23
  end
  object CheckBox45: TCheckBox
    Tag = 9
    Left = 556
    Top = 351
    Width = 17
    Height = 17
    TabOrder = 24
  end
  object CheckBox46: TCheckBox
    Tag = 10
    Left = 556
    Top = 377
    Width = 17
    Height = 17
    TabOrder = 25
  end
  object CheckBox35: TCheckBox
    Tag = 11
    Left = 465
    Top = 403
    Width = 17
    Height = 17
    TabOrder = 26
  end
  object CheckBox36: TCheckBox
    Tag = 12
    Left = 465
    Top = 429
    Width = 17
    Height = 17
    Enabled = False
    TabOrder = 27
  end
  object CheckBox33: TCheckBox
    Tag = 9
    Left = 465
    Top = 351
    Width = 17
    Height = 17
    TabOrder = 28
  end
  object CheckBox34: TCheckBox
    Tag = 10
    Left = 465
    Top = 377
    Width = 17
    Height = 17
    TabOrder = 29
  end
  object CheckBox39: TCheckBox
    Tag = 3
    Left = 556
    Top = 195
    Width = 17
    Height = 17
    TabOrder = 30
  end
  object CheckBox40: TCheckBox
    Tag = 4
    Left = 556
    Top = 221
    Width = 17
    Height = 17
    TabOrder = 31
  end
  object CheckBox37: TCheckBox
    Tag = 1
    Left = 556
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 32
  end
  object CheckBox38: TCheckBox
    Tag = 2
    Left = 556
    Top = 169
    Width = 17
    Height = 17
    TabOrder = 33
  end
  object CheckBox11: TCheckBox
    Tag = 11
    Left = 260
    Top = 404
    Width = 17
    Height = 17
    TabOrder = 34
  end
  object CheckBox12: TCheckBox
    Tag = 12
    Left = 260
    Top = 430
    Width = 17
    Height = 17
    Enabled = False
    TabOrder = 35
  end
  object CheckBox9: TCheckBox
    Tag = 9
    Left = 260
    Top = 352
    Width = 17
    Height = 17
    TabOrder = 36
  end
  object CheckBox10: TCheckBox
    Tag = 10
    Left = 260
    Top = 378
    Width = 17
    Height = 17
    TabOrder = 37
  end
  object CheckBox15: TCheckBox
    Tag = 3
    Left = 365
    Top = 195
    Width = 17
    Height = 17
    TabOrder = 38
  end
  object CheckBox16: TCheckBox
    Tag = 4
    Left = 365
    Top = 221
    Width = 17
    Height = 17
    TabOrder = 39
  end
  object CheckBox13: TCheckBox
    Tag = 1
    Left = 365
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 40
  end
  object CheckBox14: TCheckBox
    Tag = 2
    Left = 365
    Top = 169
    Width = 17
    Height = 17
    TabOrder = 41
  end
  object CheckBox3: TCheckBox
    Tag = 3
    Left = 260
    Top = 196
    Width = 17
    Height = 17
    TabOrder = 42
  end
  object CheckBox4: TCheckBox
    Tag = 4
    Left = 260
    Top = 222
    Width = 17
    Height = 17
    TabOrder = 43
  end
  object CheckBox1: TCheckBox
    Tag = 1
    Left = 260
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 44
  end
  object CheckBox2: TCheckBox
    Tag = 2
    Left = 260
    Top = 170
    Width = 17
    Height = 17
    TabOrder = 45
  end
  object CheckBox7: TCheckBox
    Tag = 7
    Left = 260
    Top = 300
    Width = 17
    Height = 17
    TabOrder = 46
  end
  object CheckBox8: TCheckBox
    Tag = 8
    Left = 260
    Top = 326
    Width = 17
    Height = 17
    TabOrder = 47
  end
  object CheckBox5: TCheckBox
    Tag = 5
    Left = 260
    Top = 248
    Width = 17
    Height = 17
    TabOrder = 48
  end
  object CheckBox6: TCheckBox
    Tag = 6
    Left = 260
    Top = 274
    Width = 17
    Height = 17
    TabOrder = 49
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
    Left = 1296
    Top = 98
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
