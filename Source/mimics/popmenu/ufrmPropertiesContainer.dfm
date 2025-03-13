object frmContainer: TfrmContainer
  Left = 0
  Top = 0
  Caption = 'Properties - Link Container'
  ClientHeight = 462
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 15
    Width = 363
    Height = 395
    ActivePage = ts1
    MultiLine = True
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Geometry'
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object pnlScreenSize: TPanel
          Left = 16
          Top = 18
          Width = 321
          Height = 89
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 0
          object lbl7: TLabel
            Left = 14
            Top = 24
            Width = 22
            Height = 13
            Caption = 'Top:'
          end
          object lbl8: TLabel
            Left = 14
            Top = 51
            Width = 23
            Height = 13
            Caption = 'Left:'
          end
          object lbl1: TLabel
            Left = 165
            Top = 24
            Width = 32
            Height = 13
            Caption = 'Width:'
          end
          object lbl2: TLabel
            Left = 165
            Top = 54
            Width = 35
            Height = 13
            Caption = 'Height:'
          end
          object edtTop: TEdit
            Left = 64
            Top = 21
            Width = 90
            Height = 21
            TabOrder = 0
          end
          object edtLeft: TEdit
            Left = 64
            Top = 48
            Width = 90
            Height = 21
            TabOrder = 1
          end
          object edtHeight: TEdit
            Left = 215
            Top = 48
            Width = 90
            Height = 21
            TabOrder = 2
          end
          object edtWidth: TEdit
            Left = 215
            Top = 21
            Width = 90
            Height = 21
            TabOrder = 3
          end
        end
        object pnl13: TPanel
          Left = 30
          Top = 11
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Position'
          ParentBackground = False
          TabOrder = 1
        end
        object pnl14: TPanel
          Left = 16
          Top = 122
          Width = 321
          Height = 119
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 2
          object lbl3: TLabel
            Left = 14
            Top = 21
            Width = 31
            Height = 13
            Caption = 'Angle:'
          end
          object lbl4: TLabel
            Left = 14
            Top = 48
            Width = 69
            Height = 13
            Caption = 'Vertical shear:'
          end
          object lbl5: TLabel
            Left = 14
            Top = 80
            Width = 82
            Height = 13
            Caption = 'Horizontal shear:'
          end
          object edtAngle: TEdit
            Left = 106
            Top = 18
            Width = 199
            Height = 21
            TabOrder = 0
          end
          object edtVerti: TEdit
            Left = 106
            Top = 45
            Width = 199
            Height = 21
            TabOrder = 1
          end
          object edtHoriz: TEdit
            Left = 106
            Top = 77
            Width = 199
            Height = 21
            TabOrder = 2
          end
        end
        object pnl15: TPanel
          Left = 30
          Top = 113
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Rotation'
          ParentBackground = False
          TabOrder = 3
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'Link Container'
      ImageIndex = 1
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object lbl6: TLabel
          Left = 22
          Top = 37
          Width = 74
          Height = 13
          Caption = 'Link source file:'
        end
        object lbl9: TLabel
          Left = 22
          Top = 64
          Width = 90
          Height = 13
          Caption = 'Link source object:'
        end
        object edt1: TEdit
          Left = 120
          Top = 34
          Width = 205
          Height = 21
          TabOrder = 0
        end
        object edt2: TEdit
          Left = 120
          Top = 61
          Width = 205
          Height = 21
          TabOrder = 1
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'General'
      ImageIndex = 2
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object lbl10: TLabel
          Left = 20
          Top = 55
          Width = 65
          Height = 13
          Caption = 'Object name:'
        end
        object lbl11: TLabel
          Left = 20
          Top = 26
          Width = 56
          Height = 13
          Caption = 'Objet type:'
        end
        object lbl13: TLabel
          Left = 20
          Top = 256
          Width = 80
          Height = 13
          Caption = 'Objet tab-order:'
        end
        object edtName: TEdit
          Left = 111
          Top = 52
          Width = 221
          Height = 21
          TabOrder = 0
        end
        object edtType: TEdit
          Left = 111
          Top = 23
          Width = 221
          Height = 21
          TabOrder = 1
        end
        object pnl16: TPanel
          Left = 20
          Top = 91
          Width = 312
          Height = 150
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 2
          object lbl12: TLabel
            Left = 16
            Top = 48
            Width = 50
            Height = 13
            Caption = 'Help Text:'
          end
          object rbText: TRadioButton
            Left = 16
            Top = 25
            Width = 57
            Height = 17
            Caption = 'Text'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
          end
          object rbTextFile: TRadioButton
            Left = 91
            Top = 25
            Width = 73
            Height = 17
            Caption = 'Text File'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 1
          end
          object rbHelpFile: TRadioButton
            Left = 185
            Top = 25
            Width = 57
            Height = 17
            Caption = 'Help File'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 2
          end
          object mmoHelp: TMemo
            Left = 91
            Top = 48
            Width = 205
            Height = 73
            Lines.Strings = (
              '')
            ScrollBars = ssVertical
            TabOrder = 3
          end
        end
        object pnl17: TPanel
          Left = 36
          Top = 73
          Width = 57
          Height = 34
          BevelOuter = bvNone
          Caption = 'Object Help'
          ParentBackground = False
          TabOrder = 3
        end
        object edtTabOrdr: TEdit
          Left = 111
          Top = 253
          Width = 221
          Height = 21
          TabOrder = 4
        end
      end
    end
    object ts4: TTabSheet
      Caption = 'Movement'
      ImageIndex = 3
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object pnl19: TPanel
          Left = 16
          Top = 18
          Width = 321
          Height = 152
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl14: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl15: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl16: TLabel
            Left = 10
            Top = 78
            Width = 62
            Height = 13
            Caption = 'Move offset:'
          end
          object edtExprHM: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 0
          end
          object edtMinHM: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 1
          end
          object edtOffsetHM: TEdit
            Left = 98
            Top = 75
            Width = 167
            Height = 21
            TabOrder = 2
          end
          object edtMaxHM: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 3
          end
          object chkSliderHM: TCheckBox
            Left = 10
            Top = 112
            Width = 82
            Height = 17
            Caption = 'Slider action'
            TabOrder = 4
          end
          object chkConfirmHM: TCheckBox
            Left = 98
            Top = 112
            Width = 71
            Height = 17
            Caption = 'Confirmed'
            TabOrder = 5
          end
          object btnAdvHM: TButton
            Left = 190
            Top = 108
            Width = 75
            Height = 25
            Caption = 'Advanced'
            TabOrder = 6
          end
        end
        object pnl21: TPanel
          Left = 16
          Top = 185
          Width = 321
          Height = 136
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 3
          object lbl17: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl18: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl19: TLabel
            Left = 10
            Top = 78
            Width = 62
            Height = 13
            Caption = 'Move offset:'
          end
          object chkSliderVM: TCheckBox
            Left = 10
            Top = 102
            Width = 82
            Height = 17
            Caption = 'Slider action'
            TabOrder = 0
          end
          object chkConfirmVM: TCheckBox
            Left = 98
            Top = 102
            Width = 71
            Height = 17
            Caption = 'Confirmed'
            TabOrder = 1
          end
          object btnAdvVM: TButton
            Left = 190
            Top = 98
            Width = 75
            Height = 25
            Caption = 'Advanced'
            TabOrder = 2
          end
          object edtOffsetVM: TEdit
            Left = 98
            Top = 75
            Width = 167
            Height = 21
            TabOrder = 3
          end
          object edtMaxVM: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 4
          end
          object edtMinVM: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 5
          end
          object edtExprVM: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 6
          end
        end
        object pnl20: TPanel
          Left = 30
          Top = 176
          Width = 91
          Height = 13
          BevelOuter = bvNone
          Caption = 'Vertical Movement'
          ParentBackground = False
          TabOrder = 2
        end
        object pnl18: TPanel
          Left = 30
          Top = 10
          Width = 107
          Height = 13
          BevelOuter = bvNone
          Caption = 'Horizontal movement'
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object ts5: TTabSheet
      Caption = 'Script'
      ImageIndex = 4
      object pnl5: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object lbl20: TLabel
          Left = 24
          Top = 24
          Width = 102
          Height = 13
          Caption = 'Callable entry points:'
        end
        object mmoCallable: TMemo
          Left = 24
          Top = 43
          Width = 296
          Height = 237
          TabOrder = 0
        end
        object btnEdtCallable: TButton
          Left = 24
          Top = 286
          Width = 84
          Height = 25
          Caption = 'Edit'
          TabOrder = 1
        end
      end
    end
    object ts6: TTabSheet
      Caption = 'Variables'
      ImageIndex = 5
      object pnl8: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
      end
    end
    object ts7: TTabSheet
      Caption = 'Menus'
      ImageIndex = 6
      object pnl9: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object RzSeparator1: TRzSeparator
          Left = 21
          Top = 192
          Width = 313
          HighlightColor = clSilver
          ShowGradient = True
          Color = clSilver
          ParentColor = False
        end
        object lbl21: TLabel
          Left = 32
          Top = 208
          Width = 55
          Height = 13
          Caption = 'Menu Text:'
        end
        object lbl22: TLabel
          Left = 32
          Top = 238
          Width = 34
          Height = 13
          Caption = 'Action:'
        end
        object lbl23: TLabel
          Left = 32
          Top = 264
          Width = 54
          Height = 13
          Caption = 'Parameter:'
        end
        object btnNew2: TButton
          Left = 21
          Top = 304
          Width = 75
          Height = 25
          Caption = 'New'
          TabOrder = 0
        end
        object btnDuplicate2: TButton
          Left = 140
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Duplicate'
          TabOrder = 1
        end
        object btnDel2: TButton
          Left = 259
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 2
        end
        object edtParam: TEdit
          Left = 104
          Top = 264
          Width = 230
          Height = 21
          TabOrder = 3
        end
        object cbbAction: TComboBox
          Left = 104
          Top = 232
          Width = 201
          Height = 21
          TabOrder = 4
        end
        object edtMenuText: TEdit
          Left = 104
          Top = 205
          Width = 230
          Height = 21
          TabOrder = 5
        end
      end
    end
    object ts8: TTabSheet
      Caption = 'Procedures'
      ImageIndex = 7
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object lst1: TListBox
          Left = 11
          Top = 20
          Width = 233
          Height = 309
          ItemHeight = 13
          TabOrder = 0
        end
        object btnNew1: TButton
          Left = 257
          Top = 20
          Width = 84
          Height = 25
          Caption = 'New'
          TabOrder = 1
        end
        object btnEdt: TButton
          Left = 257
          Top = 51
          Width = 84
          Height = 25
          Caption = 'Edit'
          TabOrder = 2
        end
        object btnDuplicate1: TButton
          Left = 257
          Top = 82
          Width = 84
          Height = 25
          Caption = 'Duplicate'
          TabOrder = 3
        end
        object btnDel1: TButton
          Left = 257
          Top = 113
          Width = 84
          Height = 25
          Caption = 'Delete'
          TabOrder = 4
        end
        object btnRename: TButton
          Left = 257
          Top = 144
          Width = 84
          Height = 25
          Caption = 'Rename'
          TabOrder = 5
        end
      end
    end
    object ts9: TTabSheet
      Caption = 'Scaling'
      ImageIndex = 8
      object pnl10: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object pnl23: TPanel
          Left = 16
          Top = 18
          Width = 321
          Height = 143
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl24: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl25: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl26: TLabel
            Left = 10
            Top = 78
            Width = 68
            Height = 13
            Caption = 'Percent scale:'
          end
          object lbl30: TLabel
            Left = 10
            Top = 105
            Width = 58
            Height = 13
            Caption = 'Fix location:'
          end
          object edtExprHS: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 0
          end
          object edtMinHS: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 1
          end
          object edtPercentHS: TEdit
            Left = 98
            Top = 75
            Width = 167
            Height = 21
            TabOrder = 2
          end
          object edtMaxHS: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 3
          end
          object edtFixHS: TEdit
            Left = 98
            Top = 102
            Width = 167
            Height = 21
            TabOrder = 4
          end
        end
        object pnl25: TPanel
          Left = 16
          Top = 185
          Width = 321
          Height = 142
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 3
          object lbl27: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl28: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl29: TLabel
            Left = 10
            Top = 78
            Width = 68
            Height = 13
            Caption = 'Percent scale:'
          end
          object lbl31: TLabel
            Left = 10
            Top = 105
            Width = 58
            Height = 13
            Caption = 'Fix location:'
          end
          object edtPercentVS: TEdit
            Left = 98
            Top = 75
            Width = 167
            Height = 21
            TabOrder = 0
          end
          object edtMaxVS: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 1
          end
          object edtMinVS: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 2
          end
          object edtExprVS: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 3
          end
          object edtFixVS: TEdit
            Left = 98
            Top = 102
            Width = 167
            Height = 21
            TabOrder = 4
          end
        end
        object pnl24: TPanel
          Left = 30
          Top = 176
          Width = 78
          Height = 13
          BevelOuter = bvNone
          Caption = 'Vertical scaling'
          ParentBackground = False
          TabOrder = 2
        end
        object pnl22: TPanel
          Left = 30
          Top = 10
          Width = 91
          Height = 13
          BevelOuter = bvNone
          Caption = 'Horizontal scaling'
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object ts10: TTabSheet
      Caption = 'Rotation/Fill'
      ImageIndex = 9
      object pnl11: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object pnl27: TPanel
          Left = 16
          Top = 18
          Width = 321
          Height = 143
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl32: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl33: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl34: TLabel
            Left = 10
            Top = 78
            Width = 69
            Height = 13
            Caption = 'Center offset:'
          end
          object lbl35: TLabel
            Left = 10
            Top = 105
            Width = 69
            Height = 13
            Caption = 'Min/max angle'
          end
          object edtExprR: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 0
          end
          object edtMinR: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 1
          end
          object edtOffsetR: TEdit
            Left = 98
            Top = 75
            Width = 80
            Height = 21
            TabOrder = 2
          end
          object edtMaxR: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 3
          end
          object edtMinAngleR: TEdit
            Left = 98
            Top = 102
            Width = 80
            Height = 21
            TabOrder = 4
          end
          object edtMaxAngleR: TEdit
            Left = 184
            Top = 102
            Width = 80
            Height = 21
            TabOrder = 5
          end
          object edt12: TEdit
            Left = 184
            Top = 75
            Width = 80
            Height = 21
            TabOrder = 6
          end
        end
        object pnl29: TPanel
          Left = 16
          Top = 185
          Width = 321
          Height = 142
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 3
          object lbl36: TLabel
            Left = 10
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object lbl37: TLabel
            Left = 10
            Top = 51
            Width = 73
            Height = 13
            Caption = 'Expr. min/max:'
          end
          object lbl38: TLabel
            Left = 10
            Top = 78
            Width = 46
            Height = 13
            Caption = 'Direction:'
          end
          object lbl39: TLabel
            Left = 10
            Top = 105
            Width = 42
            Height = 13
            Caption = 'Fill style:'
          end
          object edtMaxF: TEdit
            Left = 184
            Top = 48
            Width = 81
            Height = 21
            TabOrder = 0
          end
          object edtMinF: TEdit
            Left = 98
            Top = 48
            Width = 80
            Height = 21
            TabOrder = 1
          end
          object edtExprF: TEdit
            Left = 98
            Top = 21
            Width = 167
            Height = 21
            TabOrder = 2
          end
          object cbbDir: TComboBox
            Left = 98
            Top = 75
            Width = 111
            Height = 21
            TabOrder = 3
            Text = 'cbbDir'
          end
          object cbbStyle: TComboBox
            Left = 98
            Top = 102
            Width = 166
            Height = 21
            TabOrder = 4
          end
          object chkBipolar: TCheckBox
            Left = 215
            Top = 79
            Width = 50
            Height = 17
            Caption = 'Bipolar'
            TabOrder = 5
          end
        end
        object pnl28: TPanel
          Left = 30
          Top = 180
          Width = 19
          Height = 13
          BevelOuter = bvNone
          Caption = 'Fill'
          ParentBackground = False
          TabOrder = 2
        end
        object pnl26: TPanel
          Left = 30
          Top = 10
          Width = 41
          Height = 13
          BevelOuter = bvNone
          Caption = 'Rotation'
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object ts11: TTabSheet
      Caption = 'Color Animation'
      ImageIndex = 10
      object pnl7: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object pnl31: TPanel
          Left = 16
          Top = 18
          Width = 321
          Height = 63
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl40: TLabel
            Left = 14
            Top = 24
            Width = 60
            Height = 13
            Caption = 'Expr. count:'
          end
          object lblCount: TLabel
            Left = 102
            Top = 24
            Width = 6
            Height = 13
            Caption = '0'
          end
          object btnEdtExprList: TButton
            Left = 232
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Edit'
            TabOrder = 0
          end
        end
        object pnl30: TPanel
          Left = 30
          Top = 11
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Expression list'
          ParentBackground = False
          TabOrder = 0
        end
        object pnl33: TPanel
          Left = 16
          Top = 102
          Width = 321
          Height = 63
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 3
          object lbl41: TLabel
            Left = 14
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object edtExprVV: TEdit
            Left = 102
            Top = 22
            Width = 145
            Height = 21
            TabOrder = 0
          end
        end
        object pnl35: TPanel
          Left = 16
          Top = 178
          Width = 321
          Height = 63
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 5
          object lbl43: TLabel
            Left = 14
            Top = 24
            Width = 42
            Height = 13
            Caption = 'Point ID:'
          end
          object edtPointID: TEdit
            Left = 102
            Top = 22
            Width = 145
            Height = 21
            TabOrder = 0
            Text = 'edt3'
          end
        end
        object pnl32: TPanel
          Left = 30
          Top = 91
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Visibility'
          ParentBackground = False
          TabOrder = 2
        end
        object pnl34: TPanel
          Left = 30
          Top = 171
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Alarm state'
          ParentBackground = False
          TabOrder = 4
        end
        object pnl37: TPanel
          Left = 16
          Top = 258
          Width = 321
          Height = 63
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 7
          object lbl42: TLabel
            Left = 14
            Top = 24
            Width = 56
            Height = 13
            Caption = 'Expression:'
          end
          object edtExprCI: TEdit
            Left = 102
            Top = 22
            Width = 145
            Height = 21
            TabOrder = 0
            Text = 'edt3'
          end
        end
        object pnl36: TPanel
          Left = 30
          Top = 251
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Color Index'
          ParentBackground = False
          TabOrder = 6
        end
      end
    end
    object ts12: TTabSheet
      Caption = 'Events'
      ImageIndex = 11
      object pnl12: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 349
        ParentBackground = False
        TabOrder = 0
        object lbl44: TLabel
          Left = 32
          Top = 167
          Width = 32
          Height = 13
          Caption = 'Event:'
        end
        object RzSeparator2: TRzSeparator
          Left = 21
          Top = 156
          Width = 313
          Height = 1
          HighlightColor = clSilver
          ShowGradient = True
          Color = clSilver
          ParentColor = False
        end
        object lbl45: TLabel
          Left = 32
          Top = 253
          Width = 34
          Height = 13
          Caption = 'Action:'
        end
        object lbl46: TLabel
          Left = 32
          Top = 279
          Width = 54
          Height = 13
          Caption = 'Parameter:'
        end
        object RzSeparator3: TRzSeparator
          Left = 21
          Top = 239
          Width = 313
          Height = 1
          HighlightColor = clSilver
          ShowGradient = True
          Color = clSilver
          ParentColor = False
        end
        object cbbAction2: TComboBox
          Left = 104
          Top = 247
          Width = 201
          Height = 21
          TabOrder = 0
        end
        object edtParam2: TEdit
          Left = 104
          Top = 279
          Width = 230
          Height = 21
          TabOrder = 1
        end
        object btnNew3: TButton
          Left = 32
          Top = 306
          Width = 75
          Height = 24
          Caption = 'New'
          TabOrder = 2
        end
        object btnDuplicate3: TButton
          Left = 140
          Top = 306
          Width = 75
          Height = 24
          Caption = 'Duplicate'
          TabOrder = 3
        end
        object btnDelete3: TButton
          Left = 259
          Top = 306
          Width = 75
          Height = 24
          Caption = 'Delete'
          TabOrder = 4
        end
        object cbbEvent: TComboBox
          Left = 104
          Top = 164
          Width = 201
          Height = 21
          TabOrder = 5
        end
      end
    end
  end
  object btnOk: TButton
    Left = 8
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 104
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btnApply: TButton
    Left = 200
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
  end
  object btnHelp: TButton
    Left = 296
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
  end
end
