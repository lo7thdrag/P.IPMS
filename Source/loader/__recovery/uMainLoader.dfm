object frrmLoader: TfrrmLoader
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'IPMS Loader'
  ClientHeight = 197
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pmMain
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 32
    Width = 83
    Height = 13
    Caption = 'Instructor Host : '
  end
  object lbl2: TLabel
    Left = 8
    Top = 57
    Width = 78
    Height = 13
    Caption = 'Instructor Port :'
  end
  object lbl3: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Instructor :'
  end
  object lblStatus: TLabel
    Left = 104
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Disconnect'
  end
  object edtInsServer: TEdit
    Left = 104
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtInsPort: TEdit
    Left = 104
    Top = 53
    Width = 73
    Height = 21
    TabOrder = 1
  end
  object edtAppName: TEdit
    Left = 8
    Top = 82
    Width = 190
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object btnExecApp1: TFlatButton
    Left = 255
    Top = 80
    Width = 41
    Height = 25
    Caption = 'Pick..'
    TabOrder = 3
    OnClick = btnExecApp1Click
  end
  object btnSave: TFlatButton
    Left = 8
    Top = 169
    Width = 290
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object edtAppName2: TEdit
    Left = 8
    Top = 111
    Width = 190
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object btnExecApp2: TFlatButton
    Left = 255
    Top = 109
    Width = 41
    Height = 25
    Caption = 'Pick..'
    TabOrder = 5
    OnClick = btnExecApp2Click
  end
  object edtAppName3: TEdit
    Left = 8
    Top = 140
    Width = 190
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object btnExecApp3: TFlatButton
    Left = 255
    Top = 138
    Width = 41
    Height = 25
    Caption = 'Pick..'
    TabOrder = 8
    OnClick = btnExecApp3Click
  end
  object btn1: TFlatButton
    Left = 208
    Top = 80
    Width = 41
    Height = 25
    Caption = 'Clear'
    TabOrder = 9
    OnClick = btn1Click
  end
  object btn2: TFlatButton
    Left = 208
    Top = 109
    Width = 41
    Height = 25
    Caption = 'Clear'
    TabOrder = 10
    OnClick = btn2Click
  end
  object btn3: TFlatButton
    Left = 208
    Top = 138
    Width = 41
    Height = 25
    Caption = 'Clear'
    TabOrder = 11
    OnClick = btn3Click
  end
  object pmMain: TPopupMenu
    Left = 72
    Top = 196
    object ShowPanel1: TMenuItem
      Caption = 'Show &Panel'
      OnClick = ShowPanel1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Exit1: TMenuItem
      Caption = 'E&xit'
      OnClick = Exit1Click
    end
  end
  object dlgOpenApp: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Application|*.exe'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Title = 'Pick Application..'
    Left = 8
    Top = 196
  end
  object tmr1: TTimer
    Interval = 500
    OnTimer = tmr1Timer
    Left = 40
    Top = 196
  end
end
