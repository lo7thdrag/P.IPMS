object frmAlarmPresentation: TfrmAlarmPresentation
  Left = 0
  Top = 0
  Caption = 'frmAlarmPresentation'
  ClientHeight = 1023
  ClientWidth = 1604
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 13
    Width = 102
    Height = 19
    Caption = 'Alarm count :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 116
    Top = 15
    Width = 9
    Height = 19
    BiDiMode = bdLeftToRight
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object lvAlarmPresentation: TListView
    Left = -2
    Top = 38
    Width = 1500
    Height = 967
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clBlack
    Columns = <
      item
        Caption = 'Date'
        Width = 100
      end
      item
        Caption = 'UTC'
        Tag = 1
        Width = 100
      end
      item
        Caption = 'Mim'
        Tag = 2
        Width = 100
      end
      item
        Caption = 'Class'
        Tag = 3
        Width = 100
      end
      item
        Caption = 'Element ID'
        Tag = 4
        Width = 150
      end
      item
        Caption = 'Message'
        Tag = 5
        Width = 500
      end
      item
        Caption = 'Status'
        Tag = 6
        Width = 190
      end
      item
        Caption = 'Duration'
        Tag = 7
        Width = 100
      end
      item
        Caption = 'Ack'
        Tag = 8
        Width = 53
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvAlarmPresentationClick
    OnCustomDrawItem = lvAlarmPresentationCustomDrawItem
    OnKeyUp = lvAlarmPresentationKeyUp
  end
end
