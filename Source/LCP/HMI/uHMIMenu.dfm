object frmHMIMenu: TfrmHMIMenu
  Left = -1228
  Top = 17
  Caption = 'frmHMIMenu'
  ClientHeight = 721
  ClientWidth = 1004
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = btn1Click
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnAirGas: TSpeedButton
    Tag = 2
    Left = 16
    Top = 8
    Width = 153
    Height = 121
    Caption = 'AIR AND GAS'
    OnClick = btn1Click
  end
  object btnClutchAssist: TSpeedButton
    Tag = 10
    Left = 264
    Top = 8
    Width = 145
    Height = 121
    Caption = 'CLUTCH ASSIST'
    OnClick = btn1Click
  end
  object btnCrankOil: TSpeedButton
    Tag = 4
    Left = 507
    Top = 8
    Width = 145
    Height = 121
    Caption = 'CRANK OIL'
    OnClick = btn1Click
  end
  object btnSeaWater: TSpeedButton
    Tag = 9
    Left = 24
    Top = 176
    Width = 145
    Height = 121
    Caption = 'SEA WATER'
    OnClick = btn1Click
  end
  object btnGearBox: TSpeedButton
    Tag = 11
    Left = 264
    Top = 176
    Width = 145
    Height = 121
    Caption = 'GEAR BOX'
    OnClick = btn1Click
  end
  object btnGeneralScreen: TSpeedButton
    Tag = 5
    Left = 507
    Top = 176
    Width = 145
    Height = 121
    Caption = 'GENERAL SCREEN'
    OnClick = btn1Click
  end
  object btnGasTemperature: TSpeedButton
    Tag = 3
    Left = 24
    Top = 352
    Width = 145
    Height = 121
    Caption = 'GAS TEMP'
    OnClick = btn1Click
  end
  object btnLubOil: TSpeedButton
    Tag = 6
    Left = 264
    Top = 352
    Width = 145
    Height = 121
    Caption = 'LUB OIL'
    OnClick = btn1Click
  end
  object btnSaftiesStop: TSpeedButton
    Tag = 8
    Left = 507
    Top = 352
    Width = 145
    Height = 121
    Caption = 'SAFETIES STOP'
    OnClick = btn1Click
  end
  object btnDieselGearTemp: TSpeedButton
    Tag = 7
    Left = 24
    Top = 520
    Width = 145
    Height = 121
    Caption = 'GEAR TEMP'
    OnClick = btn1Click
  end
end
