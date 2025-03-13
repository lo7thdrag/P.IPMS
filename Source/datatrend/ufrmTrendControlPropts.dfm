object frmTrenControlPropts: TfrmTrenControlPropts
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CIMPLICITY Trend Control Properties'
  ClientHeight = 449
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancel: TButton
    Left = 170
    Top = 401
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 91
    Top = 401
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnApply: TButton
    Left = 249
    Top = 401
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object btnHelp: TButton
    Left = 328
    Top = 401
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 412
    Height = 395
    ActivePage = tsLines
    Align = alTop
    TabOrder = 4
    object tsLines: TTabSheet
      Caption = 'Lines'
    end
    object tsAxis: TTabSheet
      Caption = 'Axis'
      ImageIndex = 1
    end
    object tsChart: TTabSheet
      Caption = 'Chart'
      ImageIndex = 2
    end
    object tsLegend: TTabSheet
      Caption = 'Legend'
      ImageIndex = 3
    end
    object tsGrid: TTabSheet
      Caption = 'Grid'
      ImageIndex = 4
    end
    object ts6: TTabSheet
      Caption = 'Runtime Actions'
      ImageIndex = 5
    end
  end
  object chk1: TCheckBox
    Left = 8
    Top = 401
    Width = 97
    Height = 17
    Caption = 'Timer'
    TabOrder = 5
    OnClick = chk1Click
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmr1Timer
    Left = 54
    Top = 402
  end
end
