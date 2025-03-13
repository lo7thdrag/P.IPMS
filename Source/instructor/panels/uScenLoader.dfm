object frmScenarioLoader: TfrmScenarioLoader
  Left = 271
  Top = 199
  Caption = 'Scenario Loader'
  ClientHeight = 315
  ClientWidth = 595
  Color = clBtnFace
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
    Width = 595
    Height = 315
    ActivePage = tsScenario
    Align = alClient
    TabOrder = 0
    object tsSession: TTabSheet
      Caption = 'Session'
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Available Session :'
      end
      object lbl2: TLabel
        Left = 295
        Top = 8
        Width = 60
        Height = 13
        Caption = 'Description :'
      end
      object lstAvailSession: TListBox
        Left = 8
        Top = 27
        Width = 281
        Height = 222
        ItemHeight = 13
        TabOrder = 0
        OnMouseUp = lstAvailSessionMouseUp
      end
      object btnRefreshSession: TBitBtn
        Left = 8
        Top = 255
        Width = 97
        Height = 25
        Caption = 'Refresh'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btnRefreshSessionClick
      end
      object btnResumeSession: TBitBtn
        Left = 111
        Top = 255
        Width = 74
        Height = 25
        Caption = 'Resume'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 2
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
        TabOrder = 3
      end
    end
    object tsScenario: TTabSheet
      Caption = 'Scenario'
      ImageIndex = 1
      object lblNames: TLabel
        Left = 8
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Available Scenario :'
      end
      object lblScenarioDesc: TLabel
        Left = 295
        Top = 86
        Width = 60
        Height = 13
        Caption = 'Description :'
      end
      object lblInitial: TLabel
        Left = 295
        Top = 165
        Width = 81
        Height = 13
        Caption = 'Initial Condition :'
      end
      object lblDate: TLabel
        Left = 316
        Top = 34
        Width = 30
        Height = 13
        Caption = 'Date :'
      end
      object lblTime: TLabel
        Left = 317
        Top = 59
        Width = 29
        Height = 13
        Caption = 'Time :'
      end
      object lstScenario: TListBox
        Left = 8
        Top = 27
        Width = 281
        Height = 222
        ItemHeight = 13
        TabOrder = 0
        OnMouseUp = lstScenarioMouseUp
      end
      object mmoDesc: TMemo
        Left = 295
        Top = 105
        Width = 282
        Height = 54
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
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
      object btnRefreshScen: TBitBtn
        Left = 8
        Top = 255
        Width = 97
        Height = 25
        Caption = 'Refresh'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btnRefreshScenClick
      end
      object btnLoad: TBitBtn
        Left = 111
        Top = 255
        Width = 74
        Height = 25
        Caption = 'Load'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = btnLoadClick
      end
      object btn1: TBitBtn
        Left = 351
        Top = 255
        Width = 98
        Height = 25
        Caption = 'Save Mimics'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 5
        Visible = False
      end
      object btn2: TBitBtn
        Left = 455
        Top = 255
        Width = 98
        Height = 25
        Caption = 'Load Mimics'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 6
        Visible = False
      end
      object chkOverrideDate: TCheckBox
        Left = 295
        Top = 7
        Width = 122
        Height = 17
        Caption = 'Override Start Date'
        TabOrder = 7
        OnClick = chkOverrideDateClick
      end
      object rzDatePick: TRzDateTimePicker
        Left = 352
        Top = 30
        Width = 225
        Height = 21
        Date = 41690.559576562500000000
        Time = 41690.559576562500000000
        DateFormat = dfLong
        Enabled = False
        TabOrder = 8
      end
      object rzTimePick: TRzDateTimePicker
        Left = 351
        Top = 55
        Width = 98
        Height = 21
        Date = 41690.559576562500000000
        Format = 'HH:mm:ss'
        Time = 41690.559576562500000000
        DateMode = dmUpDown
        Enabled = False
        Kind = dtkTime
        TabOrder = 9
      end
    end
  end
end
