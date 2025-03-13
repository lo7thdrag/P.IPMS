object frmNetStatus: TfrmNetStatus
  Left = 0
  Top = 0
  Caption = 'Network Status'
  ClientHeight = 296
  ClientWidth = 697
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
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 273
    Caption = 'Host'
    TabOrder = 0
    object lbl1: TLabel
      Left = 26
      Top = 27
      Width = 80
      Height = 13
      Caption = 'Instructor Host :'
    end
    object lbl2: TLabel
      Left = 26
      Top = 52
      Width = 78
      Height = 13
      Caption = 'Instructor Port :'
    end
    object lbl3: TLabel
      Left = 26
      Top = 102
      Width = 104
      Height = 13
      Caption = 'Engine Room Server :'
    end
    object lbl4: TLabel
      Left = 26
      Top = 127
      Width = 92
      Height = 13
      Caption = 'Engine Room Port :'
    end
    object lbl5: TLabel
      Left = 26
      Top = 177
      Width = 89
      Height = 13
      Caption = 'Controller Server :'
    end
    object lbl6: TLabel
      Left = 26
      Top = 202
      Width = 77
      Height = 13
      Caption = 'Controller Port :'
    end
    object lblInsHost: TLabel
      Left = 137
      Top = 27
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lblInsPort: TLabel
      Left = 137
      Top = 52
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lblERServer: TLabel
      Left = 137
      Top = 102
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lblERPort: TLabel
      Left = 137
      Top = 127
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lblLPUServer: TLabel
      Left = 137
      Top = 177
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lblLPUPort: TLabel
      Left = 137
      Top = 202
      Width = 41
      Height = 13
      Caption = '<None>'
    end
    object lbl7: TLabel
      Left = 26
      Top = 77
      Width = 84
      Height = 13
      Caption = 'Instructor State :'
    end
    object lblInsState: TLabel
      Left = 137
      Top = 77
      Width = 40
      Height = 13
      Caption = 'Stopped'
    end
    object lbl9: TLabel
      Left = 26
      Top = 152
      Width = 98
      Height = 13
      Caption = 'Engine Room State :'
    end
    object lblERState: TLabel
      Left = 137
      Top = 152
      Width = 40
      Height = 13
      Caption = 'Stopped'
    end
    object lbl11: TLabel
      Left = 26
      Top = 227
      Width = 83
      Height = 13
      Caption = 'Controller State :'
    end
    object lblLPUState: TLabel
      Left = 137
      Top = 227
      Width = 40
      Height = 13
      Caption = 'Stopped'
    end
  end
  object grp2: TGroupBox
    Left = 255
    Top = 8
    Width = 426
    Height = 273
    Caption = 'Clients'
    TabOrder = 1
    object lbl8: TLabel
      Left = 16
      Top = 24
      Width = 90
      Height = 13
      Caption = 'Instructor Clients :'
    end
    object lbl10: TLabel
      Left = 16
      Top = 136
      Width = 104
      Height = 13
      Caption = 'Engine Room Clients :'
    end
    object lbl12: TLabel
      Left = 224
      Top = 24
      Width = 89
      Height = 13
      Caption = 'Controller Clients :'
    end
    object mmoInstructor: TMemo
      Left = 16
      Top = 40
      Width = 185
      Height = 89
      TabOrder = 0
    end
    object mm0ER: TMemo
      Left = 16
      Top = 152
      Width = 185
      Height = 89
      TabOrder = 1
    end
    object mmoCtrl: TMemo
      Left = 224
      Top = 40
      Width = 185
      Height = 89
      TabOrder = 2
    end
  end
end
