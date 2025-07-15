object frmDeviceFailedMsg: TfrmDeviceFailedMsg
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmDeviceFailedMsg'
  ClientHeight = 156
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object chkShowAgain: TCheckBox
    Left = 217
    Top = 125
    Width = 297
    Height = 17
    Caption = 'Show this message again if device still fails the next check'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = chkShowAgainClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 10
    Width = 506
    Height = 105
    Caption = ' Sound Device Check Failure '
    TabOrder = 1
    object lblDevErrMsg: TLabel
      Left = 16
      Top = 48
      Width = 246
      Height = 13
      Caption = 'Sound device check failed. COMM maybe unusable!'
    end
  end
  object btnClose: TButton
    Left = 8
    Top = 121
    Width = 105
    Height = 25
    Caption = '&Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
end
