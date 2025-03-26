object frmMimicPanel: TfrmMimicPanel
  Left = 329
  Top = 283
  BorderStyle = bsNone
  Caption = 'Mimic Panel'
  ClientHeight = 800
  ClientWidth = 735
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object scrlbxMimic: TScrollBox
    Left = 0
    Top = 3
    Width = 735
    Height = 794
    Align = alClient
    AutoScroll = False
    BorderStyle = bsNone
    TabOrder = 0
    ExplicitHeight = 750
  end
  object pnlHideShowBarTop: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 3
    Align = alTop
    BevelEdges = []
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    OnClick = pnlHideShowBarTopClick
  end
  object pnlHideShowBtm: TPanel
    Left = 0
    Top = 797
    Width = 735
    Height = 3
    Align = alBottom
    BevelEdges = []
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 2
    OnClick = pnlHideShowBarTopClick
    ExplicitTop = 477
  end
end
