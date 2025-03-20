object frmScenarioLoader: TfrmScenarioLoader
  Left = 271
  Top = 199
  BorderStyle = bsNone
  Caption = 'Scenario Loader'
  ClientHeight = 842
  ClientWidth = 1687
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 1687
    Height = 842
    ActivePage = tsScenario
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsSession: TTabSheet
      Caption = 'Session'
      object pnlSessionScenarioLoader: TPanel
        Left = 0
        Top = 0
        Width = 1679
        Height = 814
        Align = alClient
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 8
          Width = 89
          Height = 13
          Caption = 'Available Session :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 295
          Top = 8
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
        object btnRefreshSession: TBitBtn
          Left = 8
          Top = 255
          Width = 97
          Height = 25
          Caption = 'Refresh'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF33339993707399933333773337F3777FF3399933000339
            9933377333777F3377F3399333707333993337733337333337FF993333333333
            399377F33333F333377F993333303333399377F33337FF333373993333707333
            333377F333777F333333993333101333333377F333777F3FFFFF993333000399
            999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
            99933773FF777F3F777F339993707399999333773F373F77777F333999999999
            3393333777333777337333333999993333333333377777333333}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = btnRefreshSessionClick
        end
        object btnResumeSession: TBitBtn
          Left = 111
          Top = 255
          Width = 74
          Height = 25
          Caption = 'Resume'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = btnResumeSessionClick
        end
        object mmoSessionDesc: TMemo
          Left = 295
          Top = 27
          Width = 282
          Height = 89
          Color = clBtnFace
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object lstAvailSession: TListBox
          Left = 8
          Top = 27
          Width = 281
          Height = 222
          ItemHeight = 13
          TabOrder = 3
          OnMouseUp = lstAvailSessionMouseUp
        end
      end
    end
    object tsScenario: TTabSheet
      Caption = 'Scenario'
      ImageIndex = 1
      object rzDatePick: TRzDateTimePicker
        Left = 352
        Top = 30
        Width = 225
        Height = 21
        Date = 41690.000000000000000000
        Format = ''
        Time = 0.559576562496658900
        DateFormat = dfLong
        Enabled = False
        TabOrder = 0
      end
      object rzTimePick: TRzDateTimePicker
        Left = 351
        Top = 55
        Width = 98
        Height = 21
        Date = 41690.000000000000000000
        Format = 'HH:mm:ss'
        Time = 0.559576562496658900
        DateMode = dmUpDown
        Enabled = False
        Kind = dtkTime
        TabOrder = 1
      end
      object pnlScenarioLoader: TPanel
        Left = 0
        Top = 0
        Width = 1679
        Height = 814
        Align = alClient
        Color = clGray
        ParentBackground = False
        TabOrder = 2
        ExplicitLeft = 3
        object lblTime: TLabel
          Left = 317
          Top = 59
          Width = 29
          Height = 13
          Caption = 'Time :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDate: TLabel
          Left = 316
          Top = 34
          Width = 30
          Height = 13
          Caption = 'Date :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblInitial: TLabel
          Left = 295
          Top = 165
          Width = 81
          Height = 13
          Caption = 'Initial Condition :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNames: TLabel
          Left = 8
          Top = 8
          Width = 94
          Height = 13
          Caption = 'Available Scenario :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblScenarioDesc: TLabel
          Left = 295
          Top = 86
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
          Left = 316
          Top = 9
          Width = 95
          Height = 13
          Caption = 'Override Start Date'
        end
        object mmoDesc: TMemo
          Left = 295
          Top = 105
          Width = 282
          Height = 54
          Color = clBtnFace
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object lstScenario: TListBox
          Left = 8
          Top = 27
          Width = 281
          Height = 222
          ItemHeight = 13
          TabOrder = 1
          OnMouseUp = lstScenarioMouseUp
        end
        object mmoInitial: TMemo
          Left = 295
          Top = 184
          Width = 282
          Height = 65
          Color = clBtnFace
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object btn1: TBitBtn
          Left = 351
          Top = 255
          Width = 98
          Height = 25
          Caption = 'Save Mimics'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 3
          Visible = False
        end
        object btn2: TBitBtn
          Left = 455
          Top = 255
          Width = 98
          Height = 25
          Caption = 'Load Mimics'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 4
          Visible = False
        end
        object btnLoad: TBitBtn
          Left = 111
          Top = 255
          Width = 74
          Height = 25
          Caption = 'Load'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 5
          OnClick = btnLoadClick
        end
        object btnRefreshScen: TBitBtn
          Left = 8
          Top = 255
          Width = 97
          Height = 25
          Caption = 'Refresh'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF33339993707399933333773337F3777FF3399933000339
            9933377333777F3377F3399333707333993337733337333337FF993333333333
            399377F33333F333377F993333303333399377F33337FF333373993333707333
            333377F333777F333333993333101333333377F333777F3FFFFF993333000399
            999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
            99933773FF777F3F777F339993707399999333773F373F77777F333999999999
            3393333777333777337333333999993333333333377777333333}
          NumGlyphs = 2
          TabOrder = 6
          OnClick = btnRefreshScenClick
        end
        object chkOverrideDate: TCheckBox
          Left = 295
          Top = 7
          Width = 21
          Height = 17
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          OnClick = chkOverrideDateClick
        end
      end
    end
  end
end
