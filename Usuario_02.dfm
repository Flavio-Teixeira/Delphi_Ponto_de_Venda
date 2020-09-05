object Usuario02: TUsuario02
  Left = 207
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o / Exclus'#227'o de Usu'#225'rios'
  ClientHeight = 217
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 171
    Width = 433
    Height = 41
    TabOrder = 1
    object BT_Alterar: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Alterar Registro de Grupo|Alterar Registro de Grupo'
      Caption = 'Alterar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BT_AlterarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BT_Excluir: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Excluir Registro de Grupo|Excluir Registro de Grupo'
      Caption = 'Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BT_ExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 349
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Retornar a Tela Anterior|Retornar a Tela Anterior'
      Caption = 'Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BT_SairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object Cor_da_Letra: TEdit
      Left = 80
      Top = 12
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Cor_do_Grid: TEdit
      Left = 70
      Top = 12
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 5
    Top = 5
    Width = 433
    Height = 161
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 417
      Height = 145
      Caption = '  Dados Cadastrais  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 30
        Top = 31
        Width = 40
        Height = 13
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 30
        Top = 58
        Width = 40
        Height = 13
        AutoSize = False
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 80
        Top = 34
        Width = 310
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditSenha: TEdit
        Left = 80
        Top = 55
        Width = 201
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        OnKeyPress = EditSenhaKeyPress
      end
      object Usuario_Gaveta: TCheckBox
        Left = 32
        Top = 88
        Width = 97
        Height = 17
        Caption = 'Abrir a Gaveta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Usuario_Impressora: TCheckBox
        Left = 32
        Top = 112
        Width = 97
        Height = 17
        Caption = 'Imprimir Cupom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object BT_Cor_Grid: TBitBtn
        Left = 257
        Top = 80
        Width = 151
        Height = 25
        Caption = 'Cor de Fundo dos &Grids'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BT_Cor_GridClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
          000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
          033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
          B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
          C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
          033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
          3000773373FFFF73377733333700073333333333377777333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BT_Cor_Letra: TBitBtn
        Left = 257
        Top = 111
        Width = 151
        Height = 25
        Caption = 'Cor das &Letras dos Grids'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = BT_Cor_LetraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
          000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
          033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
          B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
          C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
          033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
          3000773373FFFF73377733333700073333333333377777333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  object Cor_Grid: TColorDialog
    Left = 10
    Top = 176
  end
  object Cor_Letra: TColorDialog
    Left = 42
    Top = 176
  end
end
