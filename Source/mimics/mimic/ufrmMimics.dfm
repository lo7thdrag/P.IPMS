object frmMimics: TfrmMimics
  Left = 248
  Top = 138
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 544
  ClientWidth = 659
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 72
    Top = 9
    Width = 380
    Height = 23
    Color = 6488064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlDateTime: TPanel
    Left = 565
    Top = 8
    Width = 80
    Height = 24
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object lblDate: TLabel
      Left = 0
      Top = 0
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'DD-MM-YYYY'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTime: TLabel
      Left = 0
      Top = 11
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '00:00:00'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
    end
  end
  object pmScreen: TPopupMenu
    Left = 24
    Top = 8
    object PVScreen: TMenuItem
      Caption = 'Point View'
      Enabled = False
      OnClick = PVScreenClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object HlpScreen: TMenuItem
      Caption = 'Help'
      Enabled = False
    end
    object PropScreen: TMenuItem
      Caption = 'Properties'
      Enabled = False
      OnClick = PropScreenClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Datatrend1: TMenuItem
      Caption = 'Add to trend'
      OnClick = Datatrend1Click
    end
  end
end
