object OptionsFrm: TOptionsFrm
  Left = 353
  Top = 323
  Width = 453
  Height = 139
  Caption = 'Options'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    445
    112)
  PixelsPerInch = 96
  TextHeight = 13
  object WaveOutTest: TLabel
    Left = 6
    Top = 19
    Width = 79
    Height = 13
    Caption = 'Waveout audio :'
  end
  object Label13: TLabel
    Left = 7
    Top = 51
    Width = 72
    Height = 13
    Caption = 'Wavein audio :'
  end
  object WaveOutList: TComboBox
    Left = 102
    Top = 15
    Width = 333
    Height = 21
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnChange = WaveOutListChange
  end
  object WaveInList: TComboBox
    Left = 102
    Top = 47
    Width = 333
    Height = 21
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    OnChange = WaveInListChange
  end
  object Test: TButton
    Tag = 1
    Left = 194
    Top = 78
    Width = 137
    Height = 20
    Caption = 'Test Audio Device'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = TestClick
  end
end
