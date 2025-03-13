object frmMimicKey: TfrmMimicKey
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Open Screen'
  ClientHeight = 184
  ClientWidth = 144
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object edtKey: TEdit
    Left = 0
    Top = 0
    Width = 144
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 3
    NumbersOnly = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object btn1: TButton
    Tag = 1
    Left = 8
    Top = 98
    Width = 41
    Height = 25
    Caption = '1'
    TabOrder = 1
    OnClick = OnKeyClick
  end
  object btn2: TButton
    Tag = 2
    Left = 52
    Top = 98
    Width = 41
    Height = 25
    Caption = '2'
    TabOrder = 2
    OnClick = OnKeyClick
  end
  object btn3: TButton
    Tag = 3
    Left = 96
    Top = 98
    Width = 41
    Height = 25
    Caption = '3'
    TabOrder = 3
    OnClick = OnKeyClick
  end
  object btn4: TButton
    Tag = 4
    Left = 8
    Top = 70
    Width = 41
    Height = 25
    Caption = '4'
    TabOrder = 4
    OnClick = OnKeyClick
  end
  object btn5: TButton
    Tag = 5
    Left = 52
    Top = 70
    Width = 41
    Height = 25
    Caption = '5'
    TabOrder = 5
    OnClick = OnKeyClick
  end
  object btn6: TButton
    Tag = 6
    Left = 96
    Top = 70
    Width = 41
    Height = 25
    Caption = '6'
    TabOrder = 6
    OnClick = OnKeyClick
  end
  object btn7: TButton
    Tag = 7
    Left = 8
    Top = 44
    Width = 41
    Height = 25
    Caption = '7'
    TabOrder = 7
    OnClick = OnKeyClick
  end
  object btn8: TButton
    Tag = 8
    Left = 52
    Top = 44
    Width = 41
    Height = 25
    Caption = '8'
    TabOrder = 8
    OnClick = OnKeyClick
  end
  object btn9: TButton
    Tag = 9
    Left = 96
    Top = 44
    Width = 41
    Height = 25
    Caption = '9'
    TabOrder = 9
    OnClick = OnKeyClick
  end
  object btn0: TButton
    Left = 8
    Top = 125
    Width = 41
    Height = 25
    Caption = '0'
    TabOrder = 10
    OnClick = OnKeyClick
  end
  object btnBackSp: TButton
    Tag = 10
    Left = 53
    Top = 125
    Width = 84
    Height = 25
    Caption = '<--'
    TabOrder = 11
    OnClick = OnKeyClick
  end
  object btnOK: TButton
    Left = 8
    Top = 153
    Width = 63
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 12
  end
  object btnCancel: TButton
    Left = 74
    Top = 153
    Width = 63
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 13
  end
end
