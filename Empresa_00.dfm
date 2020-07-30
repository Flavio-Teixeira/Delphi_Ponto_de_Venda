object Empresa00: TEmpresa00
  Left = 247
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Empresa00'
  ClientHeight = 206
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 5
    Top = 152
    Width = 625
    Height = 47
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 542
      Top = 11
      Width = 75
      Height = 25
      Hint = 'Retornar a Tela Anterior|Retornar a Tela Anterior'
      Caption = '&Sair'
      TabOrder = 1
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
    object BT_Alterar: TBitBtn
      Left = 275
      Top = 11
      Width = 75
      Height = 25
      Hint = 'Alterar Registro de Fornecedor|Alterar Registro de Fornecedor'
      Caption = '&Alterar'
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
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 625
    Height = 140
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 8
      Top = 7
      Width = 609
      Height = 122
      Caption = '  Dados Cadastrais  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label13: TLabel
        Left = 8
        Top = 46
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 304
        Top = 46
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 69
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 304
        Top = 69
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 492
        Top = 69
        Width = 44
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 93
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 22
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 304
        Top = 22
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nome Exibi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditEndereco: TEdit
        Left = 80
        Top = 42
        Width = 216
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EditEnderecoKeyPress
      end
      object EditBairro: TEdit
        Left = 384
        Top = 42
        Width = 216
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EditBairroKeyPress
      end
      object EditCidade: TEdit
        Left = 80
        Top = 66
        Width = 216
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnKeyPress = EditCidadeKeyPress
      end
      object EditCep: TMaskEdit
        Left = 540
        Top = 66
        Width = 60
        Height = 19
        Ctl3D = False
        EditMask = '00000\-999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = '     -   '
        OnKeyPress = EditCepKeyPress
      end
      object CBEstado: TComboBox
        Left = 384
        Top = 65
        Width = 48
        Height = 21
        BevelInner = bvNone
        BevelKind = bkSoft
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 24
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        Text = 'SP'
        OnKeyPress = CBEstadoKeyPress
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RN'
          'RS'
          'RJ'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object EditTelefone: TEdit
        Left = 80
        Top = 90
        Width = 108
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
        TabOrder = 7
        OnKeyPress = EditTelefoneKeyPress
      end
      object EditRazaoSocial: TEdit
        Left = 80
        Top = 18
        Width = 216
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditRazaoSocialKeyPress
      end
      object EditNomeExibicao: TEdit
        Left = 384
        Top = 18
        Width = 216
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EditNomeExibicaoKeyPress
      end
      object EditVinculoCliente: TCheckBox
        Left = 348
        Top = 96
        Width = 253
        Height = 17
        Caption = 'Obrigar a Vincula'#231#227'o do Cliente '#224' Venda'
        TabOrder = 8
      end
    end
  end
end
