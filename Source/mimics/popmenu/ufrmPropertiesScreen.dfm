object frmScreen: TfrmScreen
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsToolWindow
  Caption = 'Properties - Screen'
  ClientHeight = 476
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 8
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 104
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnApply: TButton
    Left = 200
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 296
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Help'
    Enabled = False
    TabOrder = 3
  end
  object pgc1: TPageControl
    Left = 8
    Top = 15
    Width = 363
    Height = 395
    ActivePage = tsEvents
    MultiLine = True
    TabOrder = 4
    object tsColors: TTabSheet
      Caption = 'Colors'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlZbakc: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
        object pnlFill: TPanel
          Left = 24
          Top = 191
          Width = 305
          Height = 141
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 0
          object lbl5: TLabel
            Left = 35
            Top = 28
            Width = 24
            Height = 13
            Caption = 'Style'
          end
          object lbl6: TLabel
            Left = 35
            Top = 55
            Width = 25
            Height = 13
            Caption = 'Color'
          end
          object cbb6: TComboBox
            Left = 98
            Top = 20
            Width = 190
            Height = 21
            TabOrder = 0
            Items.Strings = (
              'None')
          end
          object cbb7: TComboBox
            Left = 98
            Top = 47
            Width = 190
            Height = 21
            TabOrder = 1
          end
        end
        object pnlLine: TPanel
          Left = 24
          Top = 26
          Width = 305
          Height = 154
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl1: TLabel
            Left = 16
            Top = 24
            Width = 24
            Height = 13
            Caption = 'Style'
          end
          object lbl2: TLabel
            Left = 16
            Top = 50
            Width = 25
            Height = 13
            Caption = 'Color'
          end
          object lbl3: TLabel
            Left = 16
            Top = 77
            Width = 28
            Height = 13
            Caption = 'Width'
          end
          object lbl4: TLabel
            Left = 16
            Top = 104
            Width = 58
            Height = 13
            Caption = 'Arrowheads'
          end
          object cbb1: TComboBox
            Left = 98
            Top = 21
            Width = 190
            Height = 21
            TabOrder = 0
            Items.Strings = (
              'None')
          end
          object cbb2: TComboBox
            Left = 98
            Top = 102
            Width = 92
            Height = 21
            TabOrder = 1
          end
          object cbb3: TComboBox
            Left = 98
            Top = 48
            Width = 190
            Height = 21
            TabOrder = 2
          end
          object cbb4: TComboBox
            Left = 98
            Top = 75
            Width = 95
            Height = 21
            TabOrder = 3
          end
          object chk1: TCheckBox
            Left = 199
            Top = 79
            Width = 80
            Height = 17
            Caption = 'Closed'
            TabOrder = 4
          end
          object cbb5: TComboBox
            Left = 196
            Top = 102
            Width = 92
            Height = 21
            TabOrder = 5
          end
        end
        object pnl2: TPanel
          Left = 40
          Top = 186
          Width = 25
          Height = 13
          BevelOuter = bvNone
          Caption = 'Fill'
          ParentBackground = False
          TabOrder = 2
        end
        object pnl1: TPanel
          Left = 40
          Top = 19
          Width = 25
          Height = 13
          BevelOuter = bvNone
          Caption = 'Line'
          ParentBackground = False
          TabOrder = 3
        end
      end
    end
    object tsGeometry: TTabSheet
      Caption = 'Geometry'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl8: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
        object pnlScreenSize: TPanel
          Left = 24
          Top = 26
          Width = 201
          Height = 89
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl7: TLabel
            Left = 16
            Top = 21
            Width = 28
            Height = 13
            Caption = 'Width'
          end
          object lbl8: TLabel
            Left = 16
            Top = 48
            Width = 31
            Height = 13
            Caption = 'Height'
          end
          object edtWidth: TEdit
            Left = 68
            Top = 21
            Width = 113
            Height = 21
            TabOrder = 0
          end
          object edtHeight: TEdit
            Left = 68
            Top = 48
            Width = 113
            Height = 21
            TabOrder = 1
          end
        end
        object pnl3: TPanel
          Left = 40
          Top = 18
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Screen size'
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object tsGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl9: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
        object lbl10: TLabel
          Left = 24
          Top = 55
          Width = 61
          Height = 13
          Caption = 'Object name'
        end
        object lbl9: TLabel
          Left = 24
          Top = 26
          Width = 52
          Height = 13
          Caption = 'Objet type'
        end
        object pnl4: TPanel
          Left = 37
          Top = 111
          Width = 302
          Height = 150
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 0
          object lbl12: TLabel
            Left = 16
            Top = 48
            Width = 46
            Height = 13
            Caption = 'Help Text'
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
            Left = 95
            Top = 25
            Width = 73
            Height = 17
            Caption = 'Text File'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 1
          end
          object rbHelpFile: TRadioButton
            Left = 198
            Top = 25
            Width = 57
            Height = 17
            Caption = 'Help File'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 2
          end
          object mmoHelp: TMemo
            Left = 95
            Top = 48
            Width = 185
            Height = 73
            Lines.Strings = (
              '')
            ScrollBars = ssVertical
            TabOrder = 3
          end
        end
        object pnl5: TPanel
          Left = 53
          Top = 93
          Width = 57
          Height = 34
          BevelOuter = bvNone
          Caption = 'Object Help'
          ParentBackground = False
          TabOrder = 1
        end
        object edtName: TEdit
          Left = 104
          Top = 52
          Width = 223
          Height = 21
          TabOrder = 2
        end
        object edtType: TEdit
          Left = 104
          Top = 23
          Width = 223
          Height = 21
          TabOrder = 3
        end
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 3
      object pnl15: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
      end
    end
    object tsAmbient: TTabSheet
      Caption = 'AmbientProperties'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl10: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
        object lbl11: TLabel
          Left = 24
          Top = 26
          Width = 50
          Height = 13
          Caption = 'Fore Color'
        end
        object lbl13: TLabel
          Left = 24
          Top = 53
          Width = 50
          Height = 13
          Caption = 'Back Color'
        end
        object pnl7: TPanel
          Left = 24
          Top = 162
          Width = 305
          Height = 89
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 1
          object lbl14: TLabel
            Left = 8
            Top = 21
            Width = 39
            Height = 13
            Caption = 'Map File'
          end
          object edtFont: TEdit
            Left = 68
            Top = 16
            Width = 171
            Height = 21
            TabOrder = 0
          end
          object btnEdtFile: TButton
            Left = 68
            Top = 52
            Width = 85
            Height = 25
            Caption = 'Edit File'
            TabOrder = 1
          end
          object btnEdtText: TButton
            Left = 159
            Top = 52
            Width = 80
            Height = 25
            Caption = 'Edit Text'
            TabOrder = 2
          end
        end
        object cbb9: TComboBox
          Left = 92
          Top = 50
          Width = 181
          Height = 21
          TabOrder = 2
        end
        object cbb8: TComboBox
          Left = 92
          Top = 23
          Width = 181
          Height = 21
          TabOrder = 3
        end
        object btnFont: TButton
          Left = 92
          Top = 88
          Width = 89
          Height = 25
          Caption = 'Font'
          TabOrder = 4
        end
        object pnl6: TPanel
          Left = 32
          Top = 154
          Width = 57
          Height = 13
          BevelOuter = bvNone
          Caption = 'Screen size'
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object tsVariables: TTabSheet
      Caption = 'Variables'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl14: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
      end
    end
    object tsProcedures: TTabSheet
      Caption = 'Procedures'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl12: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
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
    object tsScript: TTabSheet
      Caption = 'Script'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl13: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
        ParentBackground = False
        TabOrder = 0
        object lbl15: TLabel
          Left = 24
          Top = 24
          Width = 98
          Height = 13
          Caption = 'Callable entry points'
        end
        object btnEdtCallable: TButton
          Left = 24
          Top = 286
          Width = 84
          Height = 25
          Caption = 'Edit'
          TabOrder = 0
        end
        object mmoCallable: TMemo
          Left = 24
          Top = 43
          Width = 296
          Height = 237
          TabOrder = 1
        end
      end
    end
    object tsMenus: TTabSheet
      Caption = 'Menus'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl11: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 348
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
        object lbl16: TLabel
          Left = 32
          Top = 208
          Width = 51
          Height = 13
          Caption = 'Menu Text'
        end
        object lbl17: TLabel
          Left = 32
          Top = 238
          Width = 30
          Height = 13
          Caption = 'Action'
        end
        object lbl18: TLabel
          Left = 32
          Top = 264
          Width = 50
          Height = 13
          Caption = 'Parameter'
        end
        object btnDel2: TButton
          Left = 259
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Delete'
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
        object btnNew2: TButton
          Left = 21
          Top = 304
          Width = 75
          Height = 25
          Caption = 'New'
          TabOrder = 2
        end
        object edtMenuText: TEdit
          Left = 104
          Top = 205
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
        object edtParam: TEdit
          Left = 104
          Top = 264
          Width = 230
          Height = 21
          TabOrder = 5
        end
      end
    end
  end
end
