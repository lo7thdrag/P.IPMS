object frmAlarmSummaryDIST: TfrmAlarmSummaryDIST
  Left = 0
  Top = 0
  Caption = 'frmAlarmSummaryDIST'
  ClientHeight = 1023
  ClientWidth = 1604
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblAlmStr: TLabel
    Left = 13
    Top = 11
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lblAckStr: TLabel
    Left = 36
    Top = 11
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lvAlarmSummary: TListView
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
        Width = 200
      end
      item
        Caption = 'UTC'
        Width = 100
      end
      item
        Caption = 'Mim'
        Width = 100
      end
      item
        Caption = 'Class'
        Width = 100
      end
      item
        Caption = 'Element ID'
        Width = 150
      end
      item
        Caption = 'Message'
        Width = 500
      end
      item
        Caption = 'Status'
        Width = 190
      end
      item
        Caption = 'Duration'
        Width = 100
      end
      item
        Caption = 'Ack'
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
    OnCustomDrawItem = lvAlarmSummaryCustomDrawItem
  end
end
