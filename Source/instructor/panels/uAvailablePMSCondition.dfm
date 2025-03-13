object frmAvailPMSCondition: TfrmAvailPMSCondition
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Available PMS'
  ClientHeight = 248
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lstAvail: TListBox
    Left = 0
    Top = 0
    Width = 189
    Height = 206
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 206
    Width = 189
    Height = 42
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 97
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
