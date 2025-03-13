object frmEditExpression: TfrmEditExpression
  Left = 0
  Top = 0
  Caption = 'Edit Expression'
  ClientHeight = 440
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 200
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object mmoEdtExpression: TMemo
    Left = 8
    Top = 8
    Width = 282
    Height = 180
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 300
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 300
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 300
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
  end
  object btnPointID: TButton
    Left = 300
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Point IDs...'
    TabOrder = 4
  end
  object btnEdtPoint: TButton
    Left = 300
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Edit Points...'
    TabOrder = 5
  end
  object btnNewPoint: TButton
    Left = 300
    Top = 163
    Width = 75
    Height = 25
    Caption = 'New Point...'
    TabOrder = 6
  end
  object pnl1: TPanel
    Left = 8
    Top = 219
    Width = 367
    Height = 209
    TabOrder = 7
    object pnlMinus: TPanel
      Left = 6
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '-'
      TabOrder = 0
    end
    object pnlTime: TPanel
      Left = 6
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '*'
      TabOrder = 1
    end
    object pnlDevide: TPanel
      Left = 6
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '/'
      TabOrder = 2
    end
    object pnlPower: TPanel
      Left = 6
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '^'
      TabOrder = 3
    end
    object pnlPlus: TPanel
      Left = 6
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '+'
      TabOrder = 4
    end
    object pnlA1: TPanel
      Left = 6
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'A1'
      TabOrder = 5
    end
    object pnlA2: TPanel
      Left = 6
      Top = 179
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'A2'
      TabOrder = 6
    end
    object pnlABS: TPanel
      Left = 57
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'ABS'
      TabOrder = 7
    end
    object pnlACOS: TPanel
      Left = 57
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'ACOS'
      TabOrder = 8
    end
    object pnlAH1: TPanel
      Left = 57
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AH1'
      TabOrder = 9
    end
    object pnlAH2: TPanel
      Left = 57
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AH2'
      TabOrder = 10
    end
    object pnlAL: TPanel
      Left = 57
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AL'
      TabOrder = 11
    end
    object pnlAL1: TPanel
      Left = 57
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AL1'
      TabOrder = 12
    end
    object pnlAL2: TPanel
      Left = 57
      Top = 179
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AL2'
      TabOrder = 13
    end
    object pnlANA: TPanel
      Left = 108
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'ANA'
      TabOrder = 14
    end
    object pnlAND: TPanel
      Left = 108
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'AND'
      TabOrder = 15
    end
    object pnlASIN: TPanel
      Left = 108
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'ASIN'
      TabOrder = 16
    end
    object pnlATAN: TPanel
      Left = 108
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'ATAN'
      TabOrder = 17
    end
    object pnlBAND: TPanel
      Left = 108
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'BAND'
      TabOrder = 18
    end
    object pnlBNOT: TPanel
      Left = 108
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'BNOT'
      TabOrder = 19
    end
    object pnlBOR: TPanel
      Left = 108
      Top = 178
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'BOR'
      TabOrder = 20
    end
    object pnlBXOR: TPanel
      Left = 159
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'BXOR'
      TabOrder = 21
    end
    object pnlCEIL: TPanel
      Left = 159
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'CEIL'
      TabOrder = 22
    end
    object pnlCOS: TPanel
      Left = 159
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'COS'
      TabOrder = 23
    end
    object pnlEQ: TPanel
      Left = 159
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'EQ'
      TabOrder = 24
    end
    object pnlEXP: TPanel
      Left = 159
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'EXP'
      TabOrder = 25
    end
    object pnlFLR: TPanel
      Left = 159
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'FLR'
      TabOrder = 26
    end
    object pnlGE: TPanel
      Left = 159
      Top = 178
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'GE'
      TabOrder = 27
    end
    object pnlGT: TPanel
      Left = 210
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'GT'
      TabOrder = 28
    end
    object pnlLE: TPanel
      Left = 210
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'LE'
      TabOrder = 29
    end
    object pnlLOG: TPanel
      Left = 210
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'LOG'
      TabOrder = 30
    end
    object pnlLOG10: TPanel
      Left = 210
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'LOG10'
      TabOrder = 31
    end
    object pnlLT: TPanel
      Left = 210
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'LT'
      TabOrder = 32
    end
    object pnlMAX: TPanel
      Left = 210
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'MAX'
      TabOrder = 33
    end
    object pnlMIN: TPanel
      Left = 210
      Top = 178
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'MIN'
      TabOrder = 34
    end
    object pnlMOD: TPanel
      Left = 261
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'MOD'
      TabOrder = 35
    end
    object pnlBACK: TPanel
      Left = 261
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'NACK'
      TabOrder = 36
    end
    object pnlNE: TPanel
      Left = 261
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'NE'
      TabOrder = 37
    end
    object pnlNOT: TPanel
      Left = 261
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'NOT'
      TabOrder = 38
    end
    object pnlOR: TPanel
      Left = 261
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'OR'
      TabOrder = 39
    end
    object pnlRND: TPanel
      Left = 261
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'RND'
      TabOrder = 40
    end
    object pnlSHL: TPanel
      Left = 261
      Top = 178
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'SHL'
      TabOrder = 41
    end
    object pnlSHR: TPanel
      Left = 312
      Top = 5
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'SHR'
      TabOrder = 42
    end
    object pnlSIN: TPanel
      Left = 312
      Top = 34
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'SIN'
      TabOrder = 43
    end
    object pnlSQR: TPanel
      Left = 312
      Top = 63
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'SQR'
      TabOrder = 44
    end
    object pnlTAN: TPanel
      Left = 312
      Top = 92
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'TAN'
      TabOrder = 45
    end
    object pnlTRUNC: TPanel
      Left = 312
      Top = 121
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'TRUNC'
      TabOrder = 46
    end
    object pnlVAL: TPanel
      Left = 312
      Top = 150
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'VAR'
      TabOrder = 47
    end
    object pnlXOR: TPanel
      Left = 312
      Top = 178
      Width = 48
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'XOR'
      TabOrder = 48
    end
  end
end
