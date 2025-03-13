object frmLeverControl: TfrmLeverControl
  Left = 798
  Top = 179
  Caption = 'Lever Control Test'
  ClientHeight = 319
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 552
    Top = 276
    Width = 3
    Height = 13
  end
  object lbl2: TLabel
    Left = 552
    Top = 295
    Width = 3
    Height = 13
  end
  object lbl5: TLabel
    Left = 66
    Top = 276
    Width = 3
    Height = 13
  end
  object lbl6: TLabel
    Left = 66
    Top = 295
    Width = 3
    Height = 13
  end
  object lbl7: TLabel
    Left = 8
    Top = 24
    Width = 289
    Height = 43
    Alignment = taCenter
    AutoSize = False
    Caption = 'THROTTLE PS'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 320
    Top = 24
    Width = 289
    Height = 43
    Alignment = taCenter
    AutoSize = False
    Caption = 'THROTTLE SB'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 56
    Top = 111
    Width = 185
    Height = 135
    Alignment = taCenter
    AutoSize = False
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 368
    Top = 111
    Width = 185
    Height = 135
    Alignment = taCenter
    AutoSize = False
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 276
    Width = 52
    Height = 13
    Caption = 'Actual PS: '
  end
  object lbl4: TLabel
    Left = 8
    Top = 295
    Width = 52
    Height = 13
    Caption = 'Actual SB: '
  end
  object lbl11: TLabel
    Left = 494
    Top = 276
    Width = 46
    Height = 13
    Caption = 'Send PS: '
  end
  object lbl12: TLabel
    Left = 494
    Top = 295
    Width = 46
    Height = 13
    Caption = 'Send SB: '
  end
  object nldjystck1: TNLDJoystick
    Advanced = True
    OnMove = nldjystck1Move
    Left = 288
    Top = 272
  end
  object tmrLever: TTimer
    OnTimer = tmrLeverTimer
    Left = 320
    Top = 272
  end
end
