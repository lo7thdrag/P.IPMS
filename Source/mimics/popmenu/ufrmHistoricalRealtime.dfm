object frmHistoricalRealtime: TfrmHistoricalRealtime
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Historical & Realtime Trending'
  ClientHeight = 523
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblHistDate1: TLabel
    Left = 56
    Top = 391
    Width = 70
    Height = 16
    Caption = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblHistTime1: TLabel
    Left = 66
    Top = 407
    Width = 50
    Height = 16
    Caption = 'hh:nn:ss'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblHistTime2: TLabel
    Left = 746
    Top = 407
    Width = 50
    Height = 16
    Caption = 'hh:nn:ss'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblHistDate2: TLabel
    Left = 736
    Top = 391
    Width = 70
    Height = 16
    Caption = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnPrintScreen: TButton
    Left = 848
    Top = 224
    Width = 80
    Height = 50
    Caption = 'PRINT SCREEN'
    TabOrder = 0
  end
  object btnExit: TButton
    Left = 848
    Top = 288
    Width = 80
    Height = 50
    Caption = 'EXIT'
    TabOrder = 1
    OnClick = btnExitClick
  end
  object cht1: TChart
    Left = 0
    Top = 24
    Width = 834
    Height = 361
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Labels = False
    BottomAxis.LabelsFormat.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 15.000000000000000000
    LeftAxis.MinorTickCount = 1
    View3D = False
    View3DOptions.Orthogonal = False
    View3DWalls = False
    BevelOuter = bvNone
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      LinePen.Color = clRed
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 461
    Width = 818
    Height = 52
    ColCount = 1
    DefaultColWidth = 120
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
  end
  object btnNext2: TButton
    Left = 781
    Top = 430
    Width = 25
    Height = 25
    Caption = '>>'
    TabOrder = 4
    OnClick = btnNext1Click
  end
  object btnNext1: TButton
    Left = 750
    Top = 430
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 5
    OnClick = btnNext1Click
  end
  object btnPrev2: TButton
    Left = 56
    Top = 429
    Width = 25
    Height = 25
    Caption = '<<'
    TabOrder = 6
    OnClick = btnPrev1Click
  end
  object btnPrev1: TButton
    Left = 87
    Top = 429
    Width = 25
    Height = 25
    Caption = '<'
    TabOrder = 7
    OnClick = btnPrev1Click
  end
  object pnlPause: TPanel
    Left = 848
    Top = 24
    Width = 80
    Height = 50
    BevelInner = bvRaised
    Caption = 'PAUSE'
    TabOrder = 8
    OnClick = pnlPauseClick
  end
  object btnWidden: TButton
    Left = 848
    Top = 88
    Width = 80
    Height = 25
    Caption = 'WIDDEN'
    TabOrder = 10
    OnClick = btnWiddenClick
  end
  object btnNarrow: TButton
    Left = 848
    Top = 113
    Width = 80
    Height = 25
    Caption = 'NARROW'
    TabOrder = 11
    OnClick = btnWiddenClick
  end
  object btnSpan: TButton
    Left = 848
    Top = 88
    Width = 80
    Height = 50
    Caption = 'SPAN'
    TabOrder = 9
    OnClick = btnSpanClick
  end
end
