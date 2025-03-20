object frmScenBuilder: TfrmScenBuilder
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Scenario Builder'
  ClientHeight = 842
  ClientWidth = 1687
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object scrlbx1: TScrollBox
    Left = 0
    Top = 0
    Width = 1687
    Height = 842
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
  end
  object pgc2: TPageControl
    Left = 0
    Top = 0
    Width = 1687
    Height = 842
    ActivePage = tsBuilder
    Align = alClient
    TabOrder = 1
    object tsBuilder: TTabSheet
      Caption = 'Scenario Builder'
      object acttb1: TActionToolBar
        Left = 0
        Top = 0
        Width = 1679
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
      end
      object pnlScenarioBuilderBackgraound: TPanel
        Left = 0
        Top = 23
        Width = 1679
        Height = 791
        Align = alClient
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 1
        object pgc1: TPageControl
          Left = 0
          Top = 158
          Width = 1679
          Height = 633
          ActivePage = tsFA
          Align = alClient
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          object tsPMS: TTabSheet
            Caption = 'PMS'
            object pnlPMSBackgraound: TPanel
              Left = 0
              Top = 0
              Width = 1671
              Height = 605
              Align = alClient
              Color = clGray
              DoubleBuffered = True
              ParentBackground = False
              ParentDoubleBuffered = False
              TabOrder = 0
              object lblPMSState: TLabel
                Left = 12
                Top = 22
                Width = 75
                Height = 13
                Caption = 'PMS Condition :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblPMSInfo: TLabel
                Left = 12
                Top = 49
                Width = 60
                Height = 13
                Caption = 'Description :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtPMSName: TEdit
                Left = 93
                Top = 18
                Width = 268
                Height = 21
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                Text = '<None>'
              end
              object btnPMSPick: TButton
                Tag = 1
                Left = 363
                Top = 18
                Width = 50
                Height = 25
                Caption = 'Pick..'
                TabOrder = 1
                OnClick = btnPickClick
              end
              object mmoPMSInfo: TMemo
                Left = 93
                Top = 45
                Width = 268
                Height = 156
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 2
              end
              object btnClearPMS: TButton
                Tag = 1
                Left = 363
                Top = 49
                Width = 50
                Height = 25
                Caption = 'Clear'
                TabOrder = 3
                OnClick = btnClearPMSClick
              end
            end
          end
          object tsPCS: TTabSheet
            Caption = 'PCS'
            ImageIndex = 1
            object pnlPCSBackgraound: TPanel
              Left = 0
              Top = 0
              Width = 1671
              Height = 605
              Align = alClient
              BevelOuter = bvNone
              Color = clGray
              ParentBackground = False
              TabOrder = 0
              object lblPCSState: TLabel
                Left = 12
                Top = 22
                Width = 74
                Height = 13
                Caption = 'PCS Condition :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblPCSInfo: TLabel
                Left = 12
                Top = 49
                Width = 60
                Height = 13
                Caption = 'Description :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object btnPCSPick: TButton
                Tag = 2
                Left = 367
                Top = 16
                Width = 50
                Height = 25
                Caption = 'Pick..'
                TabOrder = 0
                OnClick = btnPickClick
              end
              object mmoPCSInfo: TMemo
                Left = 93
                Top = 45
                Width = 268
                Height = 148
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 1
              end
              object btnClearPCS: TButton
                Tag = 1
                Left = 367
                Top = 47
                Width = 50
                Height = 25
                Caption = 'Clear'
                TabOrder = 2
                OnClick = btnClearPCSClick
              end
              object edtPCSName: TEdit
                Left = 93
                Top = 18
                Width = 268
                Height = 21
                Enabled = False
                ReadOnly = True
                TabOrder = 3
                Text = '<None>'
              end
            end
          end
          object tsElement: TTabSheet
            Caption = 'Element Data'
            ImageIndex = 2
            TabVisible = False
            object lbl1: TLabel
              Left = 3
              Top = 22
              Width = 93
              Height = 13
              Caption = 'Element Condition :'
            end
            object edtElementName: TEdit
              Left = 93
              Top = 18
              Width = 268
              Height = 21
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              Text = '<None>'
            end
            object btnPickElement: TButton
              Tag = 3
              Left = 367
              Top = 16
              Width = 50
              Height = 25
              Caption = 'Pick..'
              TabOrder = 1
              OnClick = btnPickClick
            end
            object btnClearElement: TButton
              Tag = 1
              Left = 367
              Top = 47
              Width = 50
              Height = 25
              Caption = 'Clear'
              TabOrder = 2
              OnClick = btnClearElementClick
            end
          end
          object tsTANK: TTabSheet
            Caption = 'TANK'
            ImageIndex = 2
            object pnlTANkBackgraound: TPanel
              Left = 0
              Top = 0
              Width = 1671
              Height = 605
              Align = alClient
              BevelOuter = bvNone
              Color = clGray
              ParentBackground = False
              TabOrder = 0
              object lblFFState: TLabel
                Left = 12
                Top = 22
                Width = 81
                Height = 13
                Caption = 'TANK Condition :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblFFInfo: TLabel
                Left = 12
                Top = 49
                Width = 60
                Height = 13
                Caption = 'Description :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object btnFFPick: TButton
                Tag = 4
                Left = 367
                Top = 16
                Width = 50
                Height = 25
                Caption = 'Pick..'
                TabOrder = 0
                OnClick = btnPickClick
              end
              object mmoTANKInfo: TMemo
                Left = 93
                Top = 45
                Width = 268
                Height = 148
                ReadOnly = True
                TabOrder = 1
              end
              object btnClearTANK: TButton
                Tag = 1
                Left = 367
                Top = 47
                Width = 50
                Height = 25
                Caption = 'Clear'
                TabOrder = 2
                OnClick = btnClearTANKClick
              end
              object edtTANKName: TEdit
                Left = 93
                Top = 18
                Width = 268
                Height = 21
                Enabled = False
                ReadOnly = True
                TabOrder = 3
                Text = '<None>'
              end
            end
          end
          object tsFA: TTabSheet
            Caption = 'Function Allocation'
            ImageIndex = 3
            object pnlFABackgraound: TPanel
              Left = 0
              Top = 0
              Width = 1671
              Height = 605
              Align = alClient
              BevelOuter = bvNone
              Color = clGray
              ParentBackground = False
              TabOrder = 0
              object lblFAState: TLabel
                Left = 12
                Top = 22
                Width = 68
                Height = 13
                Caption = 'FA Condition :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblFAInfo: TLabel
                Left = 12
                Top = 49
                Width = 60
                Height = 13
                Caption = 'Description :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtFAName: TEdit
                Left = 93
                Top = 18
                Width = 268
                Height = 21
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                Text = '<None>'
              end
              object btnFAPick: TButton
                Tag = 5
                Left = 367
                Top = 16
                Width = 50
                Height = 25
                Caption = 'Pick..'
                TabOrder = 1
                OnClick = btnPickClick
              end
              object mmoFAInfo: TMemo
                Left = 93
                Top = 45
                Width = 268
                Height = 148
                ReadOnly = True
                TabOrder = 2
              end
              object btnClearFA: TButton
                Tag = 1
                Left = 367
                Top = 47
                Width = 50
                Height = 25
                Caption = 'Clear'
                TabOrder = 3
                OnClick = btnClearFAClick
              end
            end
          end
        end
        object grpScenario: TGroupBox
          Left = 0
          Top = 0
          Width = 1679
          Height = 158
          Align = alTop
          Caption = '                   '
          TabOrder = 1
          object lblName: TLabel
            Left = 16
            Top = 32
            Width = 78
            Height = 13
            Caption = 'Scenario Name :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDescription: TLabel
            Left = 16
            Top = 91
            Width = 60
            Height = 13
            Caption = 'Description :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 15
            Top = -1
            Width = 41
            Height = 13
            Caption = 'Scenario'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object edtName: TEdit
            Left = 100
            Top = 29
            Width = 317
            Height = 21
            TabOrder = 0
          end
          object mmoDescription: TMemo
            Left = 100
            Top = 56
            Width = 317
            Height = 89
            TabOrder = 1
          end
        end
      end
    end
    object tsRunScenario: TTabSheet
      Caption = 'Running Session'
      ImageIndex = 1
      object pnlRunningSessionBackground: TPanel
        Left = 0
        Top = 0
        Width = 1679
        Height = 814
        Align = alClient
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        object lbl2: TLabel
          Left = 16
          Top = 32
          Width = 73
          Height = 13
          Caption = 'Session Name :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 16
          Top = 91
          Width = 60
          Height = 13
          Caption = 'Description :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSessionID: TLabel
          Left = 100
          Top = 153
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 16
          Top = 153
          Width = 57
          Height = 13
          Caption = 'Session ID :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object acttb2: TActionToolBar
          Left = 0
          Top = 0
          Width = 1679
          Height = 23
          ActionManager = actmgr2
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
        end
        object edt1: TEdit
          Left = 100
          Top = 29
          Width = 317
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object mmo1: TMemo
          Left = 100
          Top = 56
          Width = 317
          Height = 89
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
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
      end
      item
        Items = <
          item
            Action = actNew
          end
          item
            Action = actSave
          end
          item
            Action = actDelete
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
      end
      item
        Items = <
          item
            Action = actNew
          end
          item
            Action = actSave
          end
          item
            Action = actCancel
          end
          item
            Action = actDelete
          end
          item
            Caption = '-'
          end
          item
            Action = actPick
          end>
        ActionBar = acttb1
      end>
    Left = 272
    Top = 8
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
  object actmgr2: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
        Items = <
          item
            Action = Action1
          end
          item
            Action = actDeleteRS
          end
          item
            Action = actDeleteAll
            Caption = '&Delete All'
          end
          item
            Caption = '-'
          end
          item
            Action = actChooseRS
          end>
      end
      item
        Items = <
          item
            Action = Action1
          end
          item
            Action = actDeleteRS
          end
          item
            Action = actDeleteAll
            Caption = '&Delete All'
          end
          item
            Caption = '-'
          end
          item
            Action = actChooseRS
          end>
        ActionBar = acttb2
      end>
    Left = 304
    Top = 8
    StyleName = 'Platform Default'
    object Action1: TAction
      Caption = 'Save &As..'
      Hint = 'Save As New Scenario'
      OnExecute = Action1Execute
    end
    object actDeleteRS: TAction
      Caption = 'De&lete'
      Hint = 'Delete Session'
      OnExecute = actDeleteRSExecute
    end
    object actChooseRS: TAction
      Caption = 'C&hoose..'
      Hint = 'Choose Session'
      OnExecute = actChooseRSExecute
    end
    object actDeleteAll: TAction
      Caption = 'Delete &All'
      Hint = 'Delete All Session'
      OnExecute = actDeleteAllExecute
    end
  end
  object actmgr3: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = act4
          end
          item
            Caption = '-'
          end
          item
            Action = act5
          end
          item
            Caption = '-'
          end
          item
            Action = act2
          end>
      end
      item
        Items = <
          item
            Action = act4
          end
          item
            Action = act5
          end
          item
            Caption = '-'
          end
          item
            Action = act2
          end>
      end
      item
        Items = <
          item
            Action = act4
          end
          item
            Action = act5
          end
          item
            Caption = '-'
          end
          item
            Action = act2
          end>
      end>
    Left = 336
    Top = 8
    StyleName = 'Platform Default'
    object act2: TAction
      Caption = '&Reload'
      OnExecute = act2Execute
    end
    object act4: TAction
      Caption = 'D&elete'
      OnExecute = act4Execute
    end
    object act5: TAction
      Caption = 'Ca&ncel'
    end
  end
end
