object frmTrending: TfrmTrending
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Historical & Realtime Trending'
  ClientHeight = 507
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object trndchrt1: TTrendChart
    Left = 0
    Top = 0
    Width = 779
    Height = 507
    OnDblClick = trndchrt1DblClick
    Align = alClient
    DoubleBuffered = True
    ForegroundColor = clBlack
    BackgroundColor = clBtnFace
    ChartColor = clBtnFace
    GridColor = clNavy
  end
  object pnl1: TPanel
    Left = 779
    Top = 0
    Width = 144
    Height = 507
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnPause: TButton
      Left = 32
      Top = 48
      Width = 73
      Height = 49
      Caption = 'PAUSE'
      TabOrder = 0
    end
    object btnSpan: TButton
      Left = 32
      Top = 120
      Width = 73
      Height = 49
      Caption = 'SPAN'
      TabOrder = 1
    end
    object btnPrint: TButton
      Left = 32
      Top = 224
      Width = 73
      Height = 49
      Caption = 'PRINT SCREEN'
      TabOrder = 2
      WordWrap = True
    end
    object btnExit: TButton
      Left = 32
      Top = 296
      Width = 73
      Height = 49
      Caption = 'EXIT'
      TabOrder = 3
      OnClick = btnExitClick
    end
    object Button1: TButton
      Left = 32
      Top = 383
      Width = 73
      Height = 49
      Caption = 'Test'
      TabOrder = 4
      Visible = False
      OnClick = Button1Click
    end
  end
end
