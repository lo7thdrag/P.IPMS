object frmControlPanel: TfrmControlPanel
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'CONTROL PANEL'
  ClientHeight = 703
  ClientWidth = 985
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
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 985
    Height = 703
    ActivePage = tsERSim
    Align = alClient
    TabOrder = 0
    object tsERSim: TTabSheet
      Caption = 'Engine Room'
    end
    object tsNetArchitecture: TTabSheet
      Caption = 'NetArchitecture'
      ImageIndex = 1
      object grpMCRConsole: TGroupBox
        Left = 22
        Top = 143
        Width = 255
        Height = 121
        Caption = 'MCR CONSOLE'
        TabOrder = 0
        object lbl30: TLabel
          Left = 168
          Top = 58
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl31: TLabel
          Left = 168
          Top = 85
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl4: TLabel
          Left = 16
          Top = 58
          Width = 38
          Height = 13
          Caption = 'TNI 003'
        end
        object lbl5: TLabel
          Left = 16
          Top = 85
          Width = 38
          Height = 13
          Caption = 'TNI 004'
        end
        object lbl11: TLabel
          Left = 16
          Top = 32
          Width = 38
          Height = 13
          Caption = 'TNI 001'
        end
        object lbl14: TLabel
          Left = 81
          Top = 58
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl13: TLabel
          Left = 81
          Top = 32
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl12: TLabel
          Left = 168
          Top = 32
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl15: TLabel
          Left = 81
          Top = 85
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object cbbTNI003L: TComboBox
          Left = 92
          Top = 55
          Width = 53
          Height = 21
          TabOrder = 0
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI003R: TComboBox
          Left = 181
          Top = 55
          Width = 52
          Height = 21
          TabOrder = 1
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI001R: TComboBox
          Left = 181
          Top = 28
          Width = 52
          Height = 21
          TabOrder = 2
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI004L: TComboBox
          Left = 92
          Top = 82
          Width = 53
          Height = 21
          TabOrder = 3
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI004R: TComboBox
          Left = 181
          Top = 82
          Width = 52
          Height = 21
          TabOrder = 4
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI001L: TComboBox
          Left = 92
          Top = 29
          Width = 53
          Height = 21
          TabOrder = 5
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
      end
      object grpCT_PLANNING: TGroupBox
        Left = 22
        Top = 13
        Width = 255
        Height = 124
        Caption = 'CT / PLANNING'
        TabOrder = 1
        object lbl2: TLabel
          Left = 16
          Top = 85
          Width = 38
          Height = 13
          Caption = 'TNI 016'
        end
        object lbl6: TLabel
          Left = 16
          Top = 31
          Width = 38
          Height = 13
          Caption = 'TNI 012'
        end
        object lbl8: TLabel
          Left = 16
          Top = 58
          Width = 38
          Height = 13
          Caption = 'TNI 010'
        end
        object lbl16: TLabel
          Left = 81
          Top = 85
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl17: TLabel
          Left = 81
          Top = 31
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl18: TLabel
          Left = 81
          Top = 58
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl27: TLabel
          Left = 168
          Top = 85
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl32: TLabel
          Left = 168
          Top = 58
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl33: TLabel
          Left = 168
          Top = 31
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object cbbTNI012L: TComboBox
          Left = 92
          Top = 28
          Width = 53
          Height = 21
          TabOrder = 0
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI010L: TComboBox
          Left = 92
          Top = 55
          Width = 53
          Height = 21
          TabOrder = 1
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI016L: TComboBox
          Left = 92
          Top = 82
          Width = 53
          Height = 21
          TabOrder = 2
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI010R: TComboBox
          Left = 181
          Top = 55
          Width = 53
          Height = 21
          TabOrder = 3
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI012R: TComboBox
          Left = 181
          Top = 28
          Width = 53
          Height = 21
          TabOrder = 4
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI016R: TComboBox
          Left = 181
          Top = 82
          Width = 53
          Height = 21
          TabOrder = 5
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
      end
      object grpBridge: TGroupBox
        Left = 283
        Top = 13
        Width = 255
        Height = 176
        Caption = 'BRIDGE'
        TabOrder = 2
        object lbl1: TLabel
          Left = 16
          Top = 58
          Width = 38
          Height = 13
          Caption = 'TNI 002'
        end
        object lbl10: TLabel
          Left = 16
          Top = 85
          Width = 38
          Height = 13
          Caption = 'TNI 013'
        end
        object lbl19: TLabel
          Left = 81
          Top = 31
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl20: TLabel
          Left = 81
          Top = 114
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl21: TLabel
          Left = 81
          Top = 85
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl23: TLabel
          Left = 81
          Top = 58
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl25: TLabel
          Left = 168
          Top = 114
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl26: TLabel
          Left = 168
          Top = 85
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl28: TLabel
          Left = 168
          Top = 58
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl29: TLabel
          Left = 168
          Top = 29
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl7: TLabel
          Left = 16
          Top = 114
          Width = 38
          Height = 13
          Caption = 'TNI 014'
        end
        object lbl9: TLabel
          Left = 16
          Top = 31
          Width = 38
          Height = 13
          Caption = 'TNI 011'
        end
        object cbbTNI011L: TComboBox
          Left = 92
          Top = 28
          Width = 53
          Height = 21
          TabOrder = 0
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI011R: TComboBox
          Left = 181
          Top = 28
          Width = 53
          Height = 21
          TabOrder = 1
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI014L: TComboBox
          Left = 92
          Top = 111
          Width = 53
          Height = 21
          TabOrder = 2
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI013L: TComboBox
          Left = 92
          Top = 82
          Width = 53
          Height = 21
          TabOrder = 3
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI002L: TComboBox
          Left = 92
          Top = 55
          Width = 53
          Height = 21
          TabOrder = 4
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI014R: TComboBox
          Left = 181
          Top = 111
          Width = 53
          Height = 21
          TabOrder = 5
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI013R: TComboBox
          Left = 181
          Top = 82
          Width = 53
          Height = 21
          TabOrder = 6
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI002R: TComboBox
          Left = 181
          Top = 55
          Width = 53
          Height = 21
          TabOrder = 7
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
      end
      object grpCIC: TGroupBox
        Left = 283
        Top = 195
        Width = 255
        Height = 69
        Caption = 'CIC'
        TabOrder = 3
        object lbl22: TLabel
          Left = 81
          Top = 33
          Width = 5
          Height = 13
          Caption = 'L'
        end
        object lbl24: TLabel
          Left = 168
          Top = 33
          Width = 7
          Height = 13
          Caption = 'R'
        end
        object lbl3: TLabel
          Left = 16
          Top = 33
          Width = 38
          Height = 13
          Caption = 'TNI 015'
        end
        object cbbTNI015L: TComboBox
          Left = 92
          Top = 30
          Width = 53
          Height = 21
          TabOrder = 0
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
        object cbbTNI015R: TComboBox
          Left = 181
          Top = 30
          Width = 53
          Height = 21
          TabOrder = 1
          Text = 'OFF'
          Items.Strings = (
            'OFF'
            'ON')
        end
      end
    end
    object tsTester: TTabSheet
      Caption = 'Elements Modificator'
      ImageIndex = 2
    end
  end
end
