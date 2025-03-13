object frmConfDateTime: TfrmConfDateTime
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Configured time & date span'
  ClientHeight = 222
  ClientWidth = 271
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
  object grpStartDate: TGroupBox
    Left = 8
    Top = 8
    Width = 121
    Height = 73
    Caption = 'Start date'
    TabOrder = 0
    object lbl1: TLabel
      Left = 15
      Top = 22
      Width = 62
      Height = 13
      Caption = 'DD/MM/YYYY'
    end
    object edtDateS: TEdit
      Left = 15
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object edtMonthS: TEdit
      Left = 42
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object edtYearS: TEdit
      Left = 69
      Top = 41
      Width = 35
      Height = 21
      MaxLength = 4
      TabOrder = 2
      Text = '0000'
    end
  end
  object grpEndDate: TGroupBox
    Left = 8
    Top = 95
    Width = 121
    Height = 73
    Caption = 'End date'
    TabOrder = 1
    object lbl2: TLabel
      Left = 15
      Top = 22
      Width = 62
      Height = 13
      Caption = 'DD/MM/YYYY'
    end
    object edtDateE: TEdit
      Left = 15
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object edtMonthE: TEdit
      Left = 42
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object edtYearE: TEdit
      Left = 69
      Top = 41
      Width = 35
      Height = 21
      MaxLength = 4
      TabOrder = 2
      Text = '0000'
    end
  end
  object grp1: TGroupBox
    Left = 142
    Top = 8
    Width = 121
    Height = 73
    Caption = 'Start date'
    TabOrder = 2
    object lbl3: TLabel
      Left = 15
      Top = 22
      Width = 50
      Height = 13
      Caption = 'HH:MM:SS'
    end
    object edtHourS: TEdit
      Left = 15
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object edtMinS: TEdit
      Left = 42
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object edtSecS: TEdit
      Left = 69
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = '00'
    end
  end
  object grp2: TGroupBox
    Left = 142
    Top = 95
    Width = 121
    Height = 73
    Caption = 'End time'
    TabOrder = 3
    object lbl4: TLabel
      Left = 15
      Top = 22
      Width = 50
      Height = 13
      Caption = 'HH:MM:SS'
    end
    object edtHourE: TEdit
      Left = 15
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object edtMinE: TEdit
      Left = 42
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object edtSecE: TEdit
      Left = 69
      Top = 41
      Width = 21
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = '00'
    end
  end
  object btnOK: TButton
    Left = 35
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Tag = 1
    Left = 157
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
end
