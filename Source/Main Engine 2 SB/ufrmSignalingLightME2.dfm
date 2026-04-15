object frmSignalingLightME2: TfrmSignalingLightME2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 1024
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 1024
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 568
      Top = 136
      Width = 155
      Height = 22
      Caption = 'HOOR COUNTER'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grpRemote: TGroupBox
      Left = 41
      Top = 506
      Width = 296
      Height = 351
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 110
        Top = 18
        Width = 95
        Height = 23
        Caption = 'CONTROL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtchRemoteSB: TVrRotarySwitch
        Left = 32
        Top = 96
        Width = 233
        Height = 225
        Radius = 80
        SwitchPositions.Strings = (
          'Local'
          'Remote')
        SwitchAngleStart = 140
        SwitchAngleEnd = 220
        SwitchColor = clBlack
        ButtonColor = clBlack
        LabelsOffset = 15
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnClick = vrtryswtchRemoteSBClick
      end
    end
    object grpSpeed: TGroupBox
      Left = 345
      Top = 506
      Width = 296
      Height = 351
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      object lbl7: TLabel
        Left = 119
        Top = 18
        Width = 62
        Height = 23
        Caption = 'SPEED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtchSpeedSB: TVrRotarySwitch
        Left = 18
        Top = 92
        Width = 263
        Height = 229
        Radius = 80
        SwitchPositions.Strings = (
          'Lower'
          ''
          'Rise')
        SwitchPosition = 1
        SwitchAngleStart = 140
        SwitchAngleEnd = 220
        SwitchColor = clBlack
        ButtonColor = clBlack
        LabelsOffset = 15
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnClick = vrtryswtchSpeedSBClick
      end
    end
    object grpPreStartingInhibition: TGroupBox
      Left = 953
      Top = 506
      Width = 296
      Height = 351
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 2
      object lbl11: TLabel
        Left = 87
        Top = 18
        Width = 147
        Height = 23
        Caption = 'PRE-STARTING'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtchPreStartSB: TVrRotarySwitch
        Left = 26
        Top = 108
        Width = 263
        Height = 197
        Radius = 80
        SwitchPositions.Strings = (
          'Inhibition'
          'On')
        SwitchAngleStart = 140
        SwitchAngleEnd = 220
        SwitchColor = clBlack
        ButtonColor = clBlack
        LabelsOffset = 15
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnClick = vrtryswtchPreStartSBClick
      end
    end
    object grpSTCControl: TGroupBox
      Left = 649
      Top = 506
      Width = 296
      Height = 351
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 3
      object lbl10: TLabel
        Left = 91
        Top = 18
        Width = 138
        Height = 23
        Caption = 'STC CONTROL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vrtryswtchSTC_SB: TVrRotarySwitch
        Left = 42
        Top = 103
        Width = 239
        Height = 210
        Radius = 80
        SwitchPositions.Strings = (
          '2 TC'
          'AUTO'
          '1 TC')
        SwitchPosition = 1
        SwitchAngleStart = 140
        SwitchAngleEnd = 220
        SwitchColor = clRed
        ButtonColor = clBlack
        LabelsOffset = 15
        WinchOffset = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnClick = vrtryswtchSTC_SBClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 461
      Top = 172
      Width = 348
      Height = 293
      Color = clSilver
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 4
      object Label1: TLabel
        Left = 41
        Top = 6
        Width = 273
        Height = 23
        Caption = 'COMPUTER HORAIRE 48mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 72
        Top = 88
        Width = 201
        Height = 41
        BevelWidth = 2
        BorderStyle = bsSingle
        Color = -1
        ParentBackground = False
        TabOrder = 0
        object lblHoorCounter: TLabel
          Left = 19
          Top = -4
          Width = 160
          Height = 45
          Caption = '00000000'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
    end
    object mpStartME: TMediaPlayer
      Left = 151
      Top = 196
      Width = 253
      Height = 30
      DoubleBuffered = True
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 5
      OnNotify = mpStartMENotify
    end
  end
end
