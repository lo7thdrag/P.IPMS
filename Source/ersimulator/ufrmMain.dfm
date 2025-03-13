object frmControlPanel: TfrmControlPanel
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Control Panel'
  ClientHeight = 589
  ClientWidth = 989
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
  object pgcPCSLocalControl: TPageControl
    Left = 0
    Top = 0
    Width = 989
    Height = 589
    ActivePage = tsBallastSystem
    Align = alClient
    TabOrder = 0
    object tsBallastSystem: TTabSheet
      Caption = 'Ballast System'
    end
    object tsPMSSystem: TTabSheet
      Caption = 'PMS System'
      ImageIndex = 1
      object scrlbxPMS: TScrollBox
        Left = 0
        Top = 0
        Width = 981
        Height = 561
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object tsPCSLocalControl: TTabSheet
      Caption = 'PCS Local Control'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object scrlbxPCS: TScrollBox
        Left = 0
        Top = 0
        Width = 985
        Height = 561
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
  end
end
