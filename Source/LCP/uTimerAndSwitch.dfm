object frmTimerAndSwitch: TfrmTimerAndSwitch
  Left = -612
  Top = 31
  BorderStyle = bsNone
  Caption = 'Timer and Switch'
  ClientHeight = 406
  ClientWidth = 587
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
  object pnl1: TPanel
    Left = 96
    Top = 25
    Width = 393
    Height = 129
    TabOrder = 0
    object vrclck1: TVrClock
      Left = 121
      Top = 40
      Width = 148
      Height = 42
      Threaded = True
      Palette.Low = clGreen
      Palette.High = clLime
      Color = clBlack
      ParentColor = False
    end
  end
  object pnl2: TPanel
    Left = 24
    Top = 168
    Width = 553
    Height = 225
    TabOrder = 1
    object grpRemote: TGroupBox
      Left = 32
      Top = 48
      Width = 97
      Height = 121
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 24
        Top = 16
        Width = 51
        Height = 13
        Caption = 'CONTROL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 50
        Top = 31
        Width = 45
        Height = 13
        Caption = 'REMOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 3
        Top = 31
        Width = 35
        Height = 13
        Caption = 'LOCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtchRemote: TVrRotarySwitch
        Left = 17
        Top = 50
        Width = 60
        Height = 62
        Radius = 30
        SwitchPositions.Strings = (
          ''
          '')
        SwitchAngleStart = 135
        SwitchAngleEnd = 225
        SwitchColor = clBlack
        ButtonColor = clBlack
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object grp1: TGroupBox
      Left = 160
      Top = 48
      Width = 97
      Height = 121
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      object lbl4: TLabel
        Left = 33
        Top = 17
        Width = 34
        Height = 13
        Caption = 'SPEED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 65
        Top = 35
        Width = 26
        Height = 13
        Caption = 'RISE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 3
        Top = 35
        Width = 39
        Height = 13
        Caption = 'LOWER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtch1: TVrRotarySwitch
        Left = 17
        Top = 50
        Width = 60
        Height = 62
        Radius = 30
        SwitchPositions.Strings = (
          ''
          '')
        SwitchAngleStart = 135
        SwitchAngleEnd = 225
        SwitchColor = clBlack
        ButtonColor = clBlack
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object grp2: TGroupBox
      Left = 288
      Top = 48
      Width = 97
      Height = 121
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 2
      object lbl7: TLabel
        Left = 32
        Top = 20
        Width = 31
        Height = 13
        Caption = 'AUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 67
        Top = 35
        Width = 21
        Height = 13
        Caption = '1TC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl9: TLabel
        Left = 7
        Top = 34
        Width = 21
        Height = 13
        Caption = '2TC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtch2: TVrRotarySwitch
        Left = 17
        Top = 50
        Width = 60
        Height = 62
        Radius = 30
        SwitchPositions.Strings = (
          ''
          '')
        SwitchAngleStart = 135
        SwitchAngleEnd = 225
        SwitchColor = clBlack
        ButtonColor = clBlack
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object grp3: TGroupBox
      Left = 416
      Top = 48
      Width = 97
      Height = 121
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 3
      object lbl10: TLabel
        Left = 24
        Top = 16
        Width = 51
        Height = 13
        Caption = 'CONTROL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl11: TLabel
        Left = 50
        Top = 31
        Width = 45
        Height = 13
        Caption = 'REMOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl12: TLabel
        Left = 3
        Top = 31
        Width = 35
        Height = 13
        Caption = 'LOCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtch3: TVrRotarySwitch
        Left = 17
        Top = 50
        Width = 60
        Height = 62
        Radius = 30
        SwitchPositions.Strings = (
          ''
          '')
        SwitchAngleStart = 135
        SwitchAngleEnd = 225
        SwitchColor = clBlack
        ButtonColor = clBlack
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object tmr1: TTimer
    Left = 544
    Top = 56
  end
end
