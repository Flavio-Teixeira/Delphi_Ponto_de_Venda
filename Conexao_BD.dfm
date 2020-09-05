object ConexaoBD: TConexaoBD
  OldCreateOrder = False
  Left = 195
  Top = 124
  Height = 457
  Width = 1074
  object DS_Produtos: TDataSource
    DataSet = SQL_Produtos
    Left = 272
    Top = 110
  end
  object SQL_Produtos: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Produtos')
    Left = 272
    Top = 62
    object SQL_ProdutosProduto_Codigo: TAutoIncField
      FieldName = 'Produto_Codigo'
      ReadOnly = True
    end
    object SQL_ProdutosProduto_Descricao: TStringField
      FieldName = 'Produto_Descricao'
      Size = 100
    end
    object SQL_ProdutosProduto_Descricao_Curta: TStringField
      FieldName = 'Produto_Descricao_Curta'
    end
    object SQL_ProdutosProduto_Unidade: TStringField
      FieldName = 'Produto_Unidade'
      FixedChar = True
      Size = 2
    end
    object SQL_ProdutosProduto_Grupo: TSmallintField
      FieldName = 'Produto_Grupo'
    end
    object SQL_ProdutosProduto_Fornecedor_Cod: TSmallintField
      FieldName = 'Produto_Fornecedor_Cod'
    end
    object SQL_ProdutosProduto_Fornecedor_Desc: TStringField
      FieldName = 'Produto_Fornecedor_Desc'
      Size = 100
    end
    object SQL_ProdutosProduto_Custo: TFloatField
      FieldName = 'Produto_Custo'
      DisplayFormat = '0.00'
    end
    object SQL_ProdutosProduto_Margem_Lucro: TFloatField
      FieldName = 'Produto_Margem_Lucro'
      DisplayFormat = '0.00'
    end
    object SQL_ProdutosProduto_Preco_Varejo: TFloatField
      FieldName = 'Produto_Preco_Varejo'
      DisplayFormat = '0.00'
    end
    object SQL_ProdutosProduto_Cod_Barra: TStringField
      FieldName = 'Produto_Cod_Barra'
      Size = 15
    end
    object SQL_ProdutosProduto_Cod_Alternativo: TStringField
      FieldName = 'Produto_Cod_Alternativo'
      Size = 15
    end
    object SQL_ProdutosProduto_Estoque_Atual: TSmallintField
      FieldName = 'Produto_Estoque_Atual'
    end
    object SQL_ProdutosProduto_Estoque_Minimo: TIntegerField
      FieldName = 'Produto_Estoque_Minimo'
    end
    object SQL_ProdutosProduto_Fabricante_Cod: TIntegerField
      FieldName = 'Produto_Fabricante_Cod'
    end
    object SQL_ProdutosProduto_Fabricante_Desc: TStringField
      FieldName = 'Produto_Fabricante_Desc'
      Size = 100
    end
    object SQL_ProdutosProduto_Pedido_Codigo_Fornecedor: TStringField
      FieldName = 'Produto_Pedido_Codigo_Fornecedor'
      Size = 255
    end
    object SQL_ProdutosProduto_Pedido_Qtde_Perdas: TIntegerField
      FieldName = 'Produto_Pedido_Qtde_Perdas'
    end
    object SQL_ProdutosProduto_Ultima_Venda: TDateField
      FieldName = 'Produto_Ultima_Venda'
    end
    object SQL_ProdutosProduto_NCM: TStringField
      FieldName = 'Produto_NCM'
      Size = 8
    end
    object SQL_ProdutosProduto_TN_Valor_Energetico_C1: TStringField
      FieldName = 'Produto_TN_Valor_Energetico_C1'
    end
    object SQL_ProdutosProduto_TN_Valor_Energetico_C2: TStringField
      FieldName = 'Produto_TN_Valor_Energetico_C2'
    end
    object SQL_ProdutosProduto_TN_Carboidratos_C1: TStringField
      FieldName = 'Produto_TN_Carboidratos_C1'
    end
    object SQL_ProdutosProduto_TN_Carboidratos_C2: TStringField
      FieldName = 'Produto_TN_Carboidratos_C2'
    end
    object SQL_ProdutosProduto_TN_Proteinas_C1: TStringField
      FieldName = 'Produto_TN_Proteinas_C1'
    end
    object SQL_ProdutosProduto_TN_Proteinas_C2: TStringField
      FieldName = 'Produto_TN_Proteinas_C2'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Totais_C1: TStringField
      FieldName = 'Produto_TN_Gorduras_Totais_C1'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Totais_C2: TStringField
      FieldName = 'Produto_TN_Gorduras_Totais_C2'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Sat_C1: TStringField
      FieldName = 'Produto_TN_Gorduras_Sat_C1'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Sat_C2: TStringField
      FieldName = 'Produto_TN_Gorduras_Sat_C2'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Trans_C1: TStringField
      FieldName = 'Produto_TN_Gorduras_Trans_C1'
    end
    object SQL_ProdutosProduto_TN_Gorduras_Trans_C2: TStringField
      FieldName = 'Produto_TN_Gorduras_Trans_C2'
    end
    object SQL_ProdutosProduto_TN_Fibras_C1: TStringField
      FieldName = 'Produto_TN_Fibras_C1'
    end
    object SQL_ProdutosProduto_TN_Fibras_C2: TStringField
      FieldName = 'Produto_TN_Fibras_C2'
    end
    object SQL_ProdutosProduto_TN_Sodio_C1: TStringField
      FieldName = 'Produto_TN_Sodio_C1'
    end
    object SQL_ProdutosProduto_TN_Sodio_C2: TStringField
      FieldName = 'Produto_TN_Sodio_C2'
    end
  end
  object Conexao_Principal: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PdvTe' +
      'x;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 32
    Top = 8
  end
  object DS_Grupos: TDataSource
    DataSet = SQL_Grupos
    Left = 232
    Top = 110
  end
  object SQL_Grupos: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Grupos')
    Left = 232
    Top = 62
    object SQL_GruposGrupo_Numero: TAutoIncField
      FieldName = 'Grupo_Numero'
      ReadOnly = True
    end
    object SQL_GruposGrupo_Descricao: TStringField
      FieldName = 'Grupo_Descricao'
      Size = 100
    end
  end
  object DS_Fornecedores: TDataSource
    DataSet = SQL_Fornecedores
    Left = 192
    Top = 110
  end
  object SQL_Fornecedores: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Fornecedores')
    Left = 192
    Top = 62
    object SQL_FornecedoresFornecedor_Numero: TAutoIncField
      FieldName = 'Fornecedor_Numero'
      ReadOnly = True
    end
    object SQL_FornecedoresFornecedor_CNPJ: TStringField
      FieldName = 'Fornecedor_CNPJ'
      Size = 18
    end
    object SQL_FornecedoresFornecedor_IE: TStringField
      FieldName = 'Fornecedor_IE'
    end
    object SQL_FornecedoresFornecedor_Razao_Social: TStringField
      FieldName = 'Fornecedor_Razao_Social'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Nome_Fantasia: TStringField
      FieldName = 'Fornecedor_Nome_Fantasia'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Ramo_Atividade: TStringField
      FieldName = 'Fornecedor_Ramo_Atividade'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Endereco: TStringField
      FieldName = 'Fornecedor_Endereco'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Complemento: TStringField
      FieldName = 'Fornecedor_Complemento'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Bairro: TStringField
      FieldName = 'Fornecedor_Bairro'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Cidade: TStringField
      FieldName = 'Fornecedor_Cidade'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Estado: TStringField
      FieldName = 'Fornecedor_Estado'
      FixedChar = True
      Size = 2
    end
    object SQL_FornecedoresFornecedor_CEP: TStringField
      FieldName = 'Fornecedor_CEP'
      Size = 9
    end
    object SQL_FornecedoresFornecedor_Fone_Comercial: TStringField
      FieldName = 'Fornecedor_Fone_Comercial'
      Size = 15
    end
    object SQL_FornecedoresFornecedor_Fone_Celular: TStringField
      FieldName = 'Fornecedor_Fone_Celular'
      Size = 15
    end
    object SQL_FornecedoresFornecedor_Fone_Fax: TStringField
      FieldName = 'Fornecedor_Fone_Fax'
      Size = 15
    end
    object SQL_FornecedoresFornecedor_Contato: TStringField
      FieldName = 'Fornecedor_Contato'
      Size = 100
    end
    object SQL_FornecedoresFornecedor_Email: TStringField
      FieldName = 'Fornecedor_Email'
      Size = 100
    end
  end
  object DS_Comunitario: TDataSource
    DataSet = SQL_Comunitario
    Left = 72
    Top = 110
  end
  object SQL_Comunitario: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    Left = 72
    Top = 62
  end
  object DS_Cabeca_Cupons: TDataSource
    DataSet = SQL_Cabeca_Cupons
    Left = 32
    Top = 230
  end
  object SQL_Cabeca_Cupons: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cabeca_Cupons')
    Left = 32
    Top = 182
    object SQL_Cabeca_CuponsCabeca_Cupom_Numero: TAutoIncField
      FieldName = 'Cabeca_Cupom_Numero'
      ReadOnly = True
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Maquina: TStringField
      FieldName = 'Cabeca_Cupom_Maquina'
      Size = 10
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Status: TStringField
      FieldName = 'Cabeca_Cupom_Status'
      Size = 10
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Forma_Pgto: TStringField
      FieldName = 'Cabeca_Cupom_Forma_Pgto'
      FixedChar = True
      Size = 1
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Total: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Pago: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Pago'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Troco: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Troco'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Qtd_Itens: TSmallintField
      FieldName = 'Cabeca_Cupom_Qtd_Itens'
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Cabeca_Cupom_Data_Emissao'
    end
    object SQL_Cabeca_CuponsCabeca_Cupom_Hora_Emissao: TStringField
      FieldName = 'Cabeca_Cupom_Hora_Emissao'
      Size = 8
    end
  end
  object DS_Corpo_Cupons: TDataSource
    DataSet = SQL_Corpo_Cupons
    Left = 72
    Top = 230
  end
  object SQL_Corpo_Cupons: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Corpo_Cupons')
    Left = 72
    Top = 182
    object SQL_Corpo_CuponsCorpo_Cupom_Cabeca: TIntegerField
      FieldName = 'Corpo_Cupom_Cabeca'
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Maquina: TStringField
      FieldName = 'Corpo_Cupom_Maquina'
      Size = 10
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Prod_Codigo: TIntegerField
      FieldName = 'Corpo_Cupom_Prod_Codigo'
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Prod_Desc: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc'
      Size = 100
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Prod_Desc_Curta: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc_Curta'
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Prod_Qtde: TSmallintField
      FieldName = 'Corpo_Cupom_Prod_Qtde'
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Prod_Vlr_Unitario: TFloatField
      FieldName = 'Corpo_Cupom_Prod_Vlr_Unitario'
      DisplayFormat = '0.00'
    end
    object SQL_Corpo_CuponsCorpo_Cupom_Vlr_Total: TFloatField
      FieldName = 'Corpo_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
  end
  object DS_Registro_Caixa: TDataSource
    DataSet = SQL_Registro_Caixa
    Left = 112
    Top = 230
  end
  object SQL_Registro_Caixa: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Registro_Caixa_Movto')
    Left = 112
    Top = 182
    object SQL_Registro_CaixaRegistro_Caixa_Data: TDateField
      FieldName = 'Registro_Caixa_Data'
    end
    object SQL_Registro_CaixaRegistro_Caixa_Hora: TStringField
      FieldName = 'Registro_Caixa_Hora'
      Size = 8
    end
    object SQL_Registro_CaixaRegistro_Caixa_Operacao: TStringField
      FieldName = 'Registro_Caixa_Operacao'
    end
    object SQL_Registro_CaixaRegistro_Caixa_Maquina: TStringField
      FieldName = 'Registro_Caixa_Maquina'
      Size = 10
    end
    object SQL_Registro_CaixaRegistro_Caixa_Pedido: TStringField
      FieldName = 'Registro_Caixa_Pedido'
      Size = 10
    end
    object SQL_Registro_CaixaRegistro_Caixa_Usuario: TStringField
      FieldName = 'Registro_Caixa_Usuario'
      Size = 50
    end
    object SQL_Registro_CaixaRegistro_Caixa_Valor: TFloatField
      FieldName = 'Registro_Caixa_Valor'
      DisplayFormat = '0.00'
    end
  end
  object DS_Usuarios: TDataSource
    DataSet = SQl_Usuarios
    Left = 312
    Top = 110
  end
  object SQl_Usuarios: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Usuarios')
    Left = 312
    Top = 62
    object SQl_UsuariosUsuario_Nome: TStringField
      FieldName = 'Usuario_Nome'
      Size = 50
    end
    object SQl_UsuariosUsuario_Senha: TStringField
      FieldName = 'Usuario_Senha'
      Size = 50
    end
    object SQl_UsuariosUsuario_Fiscal: TStringField
      FieldName = 'Usuario_Fiscal'
      FixedChar = True
      Size = 1
    end
    object SQl_UsuariosUsuario_Cor_Grid: TStringField
      FieldName = 'Usuario_Cor_Grid'
      Size = 50
    end
    object SQl_UsuariosUsuario_Cor_Letra: TStringField
      FieldName = 'Usuario_Cor_Letra'
      Size = 50
    end
    object SQl_UsuariosUsuario_Gaveta: TStringField
      FieldName = 'Usuario_Gaveta'
      FixedChar = True
      Size = 1
    end
    object SQl_UsuariosUsuario_Impressora: TStringField
      FieldName = 'Usuario_Impressora'
      FixedChar = True
      Size = 1
    end
  end
  object DS_Conexao: TDataSource
    DataSet = SQL_Conexao
    Left = 32
    Top = 110
  end
  object SQL_Conexao: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Conexao')
    Left = 32
    Top = 62
    object SQL_ConexaoConexao_Caminho: TStringField
      FieldName = 'Conexao_Caminho'
      Size = 100
    end
    object SQL_ConexaoConexao_Registro: TStringField
      FieldName = 'Conexao_Registro'
      Size = 255
    end
    object SQL_ConexaoConexao_Loja: TStringField
      FieldName = 'Conexao_Loja'
      Size = 50
    end
    object SQL_ConexaoConexao_Loja_Curto: TStringField
      FieldName = 'Conexao_Loja_Curto'
      Size = 15
    end
    object SQL_ConexaoConexao_Endereco: TStringField
      FieldName = 'Conexao_Endereco'
      Size = 80
    end
    object SQL_ConexaoConexao_Complemento: TStringField
      FieldName = 'Conexao_Complemento'
      Size = 80
    end
    object SQL_ConexaoConexao_Bairro: TStringField
      FieldName = 'Conexao_Bairro'
      Size = 80
    end
    object SQL_ConexaoConexao_Cidade: TStringField
      FieldName = 'Conexao_Cidade'
      Size = 80
    end
    object SQL_ConexaoConexao_UF: TStringField
      FieldName = 'Conexao_UF'
      FixedChar = True
      Size = 2
    end
    object SQL_ConexaoConexao_Cep: TStringField
      FieldName = 'Conexao_Cep'
      Size = 9
    end
    object SQL_ConexaoConexao_Fone: TStringField
      FieldName = 'Conexao_Fone'
      Size = 40
    end
    object SQL_ConexaoConexao_Email: TStringField
      FieldName = 'Conexao_Email'
      Size = 80
    end
  end
  object DS_Informacao_Maquinas: TDataSource
    DataSet = SQL_Informacao_Maquinas
    Left = 352
    Top = 110
  end
  object SQL_Informacao_Maquinas: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Informacao_Maquinas')
    Left = 352
    Top = 62
    object SQL_Informacao_MaquinasInformacao_Maquina_HD: TStringField
      FieldName = 'Informacao_Maquina_HD'
      Size = 10
    end
    object SQL_Informacao_MaquinasInformacao_Maquina_Descricao: TStringField
      FieldName = 'Informacao_Maquina_Descricao'
      Size = 50
    end
  end
  object DS_Registro_Caixa_Rel: TDataSource
    DataSet = SQL_Registro_Caixa_Rel
    Left = 152
    Top = 230
  end
  object SQL_Registro_Caixa_Rel: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Registro_Caixa_Movto,Informacao_Maquinas_Vazio'
      ' Where  Registro_Caixa_Maquina=Informacao_Maquina_HD'
      
        ' Order by Registro_Caixa_Maquina, Registro_Caixa_Data, Registro_' +
        'Caixa_Hora')
    Left = 152
    Top = 184
    object SQL_Registro_Caixa_RelRegistro_Caixa_Data: TDateField
      FieldName = 'Registro_Caixa_Data'
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Hora: TStringField
      FieldName = 'Registro_Caixa_Hora'
      Size = 8
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Operacao: TStringField
      FieldName = 'Registro_Caixa_Operacao'
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Maquina: TStringField
      FieldName = 'Registro_Caixa_Maquina'
      Size = 10
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Pedido: TStringField
      FieldName = 'Registro_Caixa_Pedido'
      Size = 10
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Usuario: TStringField
      FieldName = 'Registro_Caixa_Usuario'
      Size = 50
    end
    object SQL_Registro_Caixa_RelRegistro_Caixa_Valor: TFloatField
      FieldName = 'Registro_Caixa_Valor'
      DisplayFormat = '0.00'
    end
    object SQL_Registro_Caixa_RelInformacao_Maquina_HD: TStringField
      FieldName = 'Informacao_Maquina_HD'
      Size = 10
    end
    object SQL_Registro_Caixa_RelInformacao_Maquina_Descricao: TStringField
      FieldName = 'Informacao_Maquina_Descricao'
      Size = 50
    end
  end
  object DS_Permissoes: TDataSource
    DataSet = SQL_Permissoes
    Left = 392
    Top = 110
  end
  object SQL_Permissoes: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Permissao_Acessos')
    Left = 392
    Top = 62
    object SQL_PermissoesPermissao_Acesso_Login: TStringField
      FieldName = 'Permissao_Acesso_Login'
      Size = 50
    end
    object SQL_PermissoesPermissao_Acesso_Area: TStringField
      FieldName = 'Permissao_Acesso_Area'
      Size = 50
    end
    object SQL_PermissoesPermissao_Acesso_Descricao: TStringField
      FieldName = 'Permissao_Acesso_Descricao'
      Size = 100
    end
    object SQL_PermissoesPermissao_Acesso_Permitido: TStringField
      FieldName = 'Permissao_Acesso_Permitido'
      FixedChar = True
      Size = 1
    end
    object SQL_PermissoesPermissao_Acesso_Posicao: TSmallintField
      FieldName = 'Permissao_Acesso_Posicao'
    end
  end
  object DS_Lucratividade: TDataSource
    DataSet = SQL_Lucratividade
    Left = 192
    Top = 230
  end
  object SQL_Lucratividade: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Lucratividade')
    Left = 192
    Top = 182
    object SQL_LucratividadeLucratividade_Codigo: TStringField
      FieldName = 'Lucratividade_Codigo'
      Size = 15
    end
    object SQL_LucratividadeLucratividade_Descricao: TStringField
      FieldName = 'Lucratividade_Descricao'
      Size = 100
    end
    object SQL_LucratividadeLucratividade_Qtde: TIntegerField
      FieldName = 'Lucratividade_Qtde'
    end
    object SQL_LucratividadeLucratividade_Preco_Venda: TFloatField
      FieldName = 'Lucratividade_Preco_Venda'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Total_Faturado: TFloatField
      FieldName = 'Lucratividade_Total_Faturado'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Ultimo_Custo: TFloatField
      FieldName = 'Lucratividade_Ultimo_Custo'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Custo_Total: TFloatField
      FieldName = 'Lucratividade_Custo_Total'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Lucro_Bruto: TFloatField
      FieldName = 'Lucratividade_Lucro_Bruto'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Margem_Lucro: TFloatField
      FieldName = 'Lucratividade_Margem_Lucro'
      DisplayFormat = '0.00'
    end
    object SQL_LucratividadeLucratividade_Grupo: TIntegerField
      FieldName = 'Lucratividade_Grupo'
    end
    object SQL_LucratividadeLucratividade_Grupo_Descricao: TStringField
      FieldName = 'Lucratividade_Grupo_Descricao'
      Size = 100
    end
  end
  object DS_Cupom_Lucratividade: TDataSource
    DataSet = SQL_Cupom_Lucratividade
    Left = 232
    Top = 230
  end
  object SQL_Cupom_Lucratividade: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Corpo_Cupons_Movto')
    Left = 232
    Top = 182
    object SQL_Cupom_LucratividadeCorpo_Cupom_Posicao: TAutoIncField
      FieldName = 'Corpo_Cupom_Posicao'
      ReadOnly = True
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Cabeca: TSmallintField
      FieldName = 'Corpo_Cupom_Cabeca'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Maquina: TStringField
      FieldName = 'Corpo_Cupom_Maquina'
      Size = 10
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Prod_Codigo: TIntegerField
      FieldName = 'Corpo_Cupom_Prod_Codigo'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Prod_Desc: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc'
      Size = 100
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Prod_Desc_Curta: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc_Curta'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Prod_Qtde: TSmallintField
      FieldName = 'Corpo_Cupom_Prod_Qtde'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Prod_Vlr_Unitario: TFloatField
      FieldName = 'Corpo_Cupom_Prod_Vlr_Unitario'
      DisplayFormat = '0.00'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Vlr_Total: TFloatField
      FieldName = 'Corpo_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Corpo_Cupom_Data_Emissao'
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Hora_Emissao: TStringField
      FieldName = 'Corpo_Cupom_Hora_Emissao'
      Size = 8
    end
    object SQL_Cupom_LucratividadeCorpo_Cupom_Status: TStringField
      FieldName = 'Corpo_Cupom_Status'
      Size = 10
    end
  end
  object DS_Fornecedor_Ultima_Venda: TDataSource
    DataSet = SQL_Fornecedor_Ultima_Venda
    Left = 392
    Top = 230
  end
  object SQL_Fornecedor_Ultima_Venda: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from Fornecedores_Vazio, Produtos_Vazio,  Corpo_Cupons_' +
        'Movto, Cabeca_Cupons_Movto'
      ''
      'Where'
      ''
      '(Fornecedor_Numero = Produto_Fornecedor_Cod) And '
      ''
      '(Produto_Codigo = Corpo_Cupom_Prod_Codigo) And  '
      ''
      '(Corpo_Cupom_Cabeca = Cabeca_Cupom_Numero) And '
      ''
      '(Fornecedor_Numero = 1) Order By Cabeca_Cupom_Data_Emissao Desc')
    Left = 392
    Top = 182
    object SQL_Fornecedor_Ultima_VendaFornecedor_Numero: TIntegerField
      FieldName = 'Fornecedor_Numero'
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_CNPJ: TStringField
      FieldName = 'Fornecedor_CNPJ'
      Size = 18
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_IE: TStringField
      FieldName = 'Fornecedor_IE'
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Razao_Social: TStringField
      FieldName = 'Fornecedor_Razao_Social'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Nome_Fantasia: TStringField
      FieldName = 'Fornecedor_Nome_Fantasia'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Ramo_Atividade: TStringField
      FieldName = 'Fornecedor_Ramo_Atividade'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Endereco: TStringField
      FieldName = 'Fornecedor_Endereco'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Complemento: TStringField
      FieldName = 'Fornecedor_Complemento'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Bairro: TStringField
      FieldName = 'Fornecedor_Bairro'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Cidade: TStringField
      FieldName = 'Fornecedor_Cidade'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Estado: TStringField
      FieldName = 'Fornecedor_Estado'
      FixedChar = True
      Size = 2
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_CEP: TStringField
      FieldName = 'Fornecedor_CEP'
      Size = 9
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Comercial: TStringField
      FieldName = 'Fornecedor_Fone_Comercial'
      Size = 15
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Celular: TStringField
      FieldName = 'Fornecedor_Fone_Celular'
      Size = 15
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Fax: TStringField
      FieldName = 'Fornecedor_Fone_Fax'
      Size = 15
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Contato: TStringField
      FieldName = 'Fornecedor_Contato'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaFornecedor_Email: TStringField
      FieldName = 'Fornecedor_Email'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Codigo: TIntegerField
      FieldName = 'Produto_Codigo'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Descricao: TStringField
      FieldName = 'Produto_Descricao'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Descricao_Curta: TStringField
      FieldName = 'Produto_Descricao_Curta'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Unidade: TStringField
      FieldName = 'Produto_Unidade'
      FixedChar = True
      Size = 2
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Grupo: TSmallintField
      FieldName = 'Produto_Grupo'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Fornecedor_Cod: TSmallintField
      FieldName = 'Produto_Fornecedor_Cod'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Fornecedor_Desc: TStringField
      FieldName = 'Produto_Fornecedor_Desc'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Custo: TFloatField
      FieldName = 'Produto_Custo'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Margem_Lucro: TFloatField
      FieldName = 'Produto_Margem_Lucro'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Preco_Varejo: TFloatField
      FieldName = 'Produto_Preco_Varejo'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Cod_Barra: TStringField
      FieldName = 'Produto_Cod_Barra'
      Size = 15
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Cod_Alternativo: TStringField
      FieldName = 'Produto_Cod_Alternativo'
      Size = 15
    end
    object SQL_Fornecedor_Ultima_VendaProduto_Estoque_Atual: TSmallintField
      FieldName = 'Produto_Estoque_Atual'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Posicao: TAutoIncField
      FieldName = 'Corpo_Cupom_Posicao'
      ReadOnly = True
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Cabeca: TSmallintField
      FieldName = 'Corpo_Cupom_Cabeca'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Maquina: TStringField
      FieldName = 'Corpo_Cupom_Maquina'
      Size = 10
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Prod_Codigo: TIntegerField
      FieldName = 'Corpo_Cupom_Prod_Codigo'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Prod_Desc: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc'
      Size = 100
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Prod_Desc_Curta: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc_Curta'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Prod_Qtde: TSmallintField
      FieldName = 'Corpo_Cupom_Prod_Qtde'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Prod_Vlr_Unitario: TFloatField
      FieldName = 'Corpo_Cupom_Prod_Vlr_Unitario'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Vlr_Total: TFloatField
      FieldName = 'Corpo_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Corpo_Cupom_Data_Emissao'
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Hora_Emissao: TStringField
      FieldName = 'Corpo_Cupom_Hora_Emissao'
      Size = 8
    end
    object SQL_Fornecedor_Ultima_VendaCorpo_Cupom_Status: TStringField
      FieldName = 'Corpo_Cupom_Status'
      Size = 10
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Posicao: TAutoIncField
      FieldName = 'Cabeca_Cupom_Posicao'
      ReadOnly = True
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Numero: TIntegerField
      FieldName = 'Cabeca_Cupom_Numero'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Maquina: TStringField
      FieldName = 'Cabeca_Cupom_Maquina'
      Size = 10
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Status: TStringField
      FieldName = 'Cabeca_Cupom_Status'
      Size = 10
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Forma_Pgto: TStringField
      FieldName = 'Cabeca_Cupom_Forma_Pgto'
      FixedChar = True
      Size = 1
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Vlr_Total: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Vlr_Pago: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Pago'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Vlr_Troco: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Troco'
      DisplayFormat = '0.00'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Qtd_Itens: TSmallintField
      FieldName = 'Cabeca_Cupom_Qtd_Itens'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Cabeca_Cupom_Data_Emissao'
    end
    object SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Hora_Emissao: TStringField
      FieldName = 'Cabeca_Cupom_Hora_Emissao'
      Size = 8
    end
  end
  object DS_Rel_Fornecedor: TDataSource
    DataSet = SQL_Rel_Fornecedor
    Left = 272
    Top = 230
  end
  object SQL_Rel_Fornecedor: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Rel_Fornecedor')
    Left = 272
    Top = 182
    object SQL_Rel_FornecedorRel_Fornecedor_Numero: TIntegerField
      FieldName = 'Rel_Fornecedor_Numero'
    end
    object SQL_Rel_FornecedorRel_Fornecedor_CNPJ: TStringField
      FieldName = 'Rel_Fornecedor_CNPJ'
      Size = 18
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Razao_Social: TStringField
      FieldName = 'Rel_Fornecedor_Razao_Social'
      Size = 100
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Nome_Fantasia: TStringField
      FieldName = 'Rel_Fornecedor_Nome_Fantasia'
      Size = 100
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Fone_Comercial: TStringField
      FieldName = 'Rel_Fornecedor_Fone_Comercial'
      Size = 15
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Fone_Celular: TStringField
      FieldName = 'Rel_Fornecedor_Fone_Celular'
      Size = 15
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Fone_FAX: TStringField
      FieldName = 'Rel_Fornecedor_Fone_FAX'
      Size = 15
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Contato: TStringField
      FieldName = 'Rel_Fornecedor_Contato'
      Size = 100
    end
    object SQL_Rel_FornecedorRel_Fornecedor_EMail: TStringField
      FieldName = 'Rel_Fornecedor_EMail'
      Size = 100
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Ultima_Venda: TDateField
      FieldName = 'Rel_Fornecedor_Ultima_Venda'
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Produto_Codigo: TIntegerField
      FieldName = 'Rel_Fornecedor_Produto_Codigo'
    end
    object SQL_Rel_FornecedorRel_Fornecedor_Produto_Descricao: TStringField
      FieldName = 'Rel_Fornecedor_Produto_Descricao'
      Size = 100
    end
  end
  object SQL_Comunitario_Secundario: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 62
  end
  object DS_Comunitario_Secundario: TDataSource
    DataSet = SQL_Comunitario_Secundario
    Left = 112
    Top = 110
  end
  object SQL_Fornecedores_Vazio: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Fornecedores_Vazio')
    Left = 312
    Top = 182
    object SQL_Fornecedores_VazioFornecedor_Numero: TIntegerField
      FieldName = 'Fornecedor_Numero'
    end
    object SQL_Fornecedores_VazioFornecedor_CNPJ: TStringField
      FieldName = 'Fornecedor_CNPJ'
      Size = 18
    end
    object SQL_Fornecedores_VazioFornecedor_IE: TStringField
      FieldName = 'Fornecedor_IE'
    end
    object SQL_Fornecedores_VazioFornecedor_Razao_Social: TStringField
      FieldName = 'Fornecedor_Razao_Social'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Nome_Fantasia: TStringField
      FieldName = 'Fornecedor_Nome_Fantasia'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Ramo_Atividade: TStringField
      FieldName = 'Fornecedor_Ramo_Atividade'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Endereco: TStringField
      FieldName = 'Fornecedor_Endereco'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Complemento: TStringField
      FieldName = 'Fornecedor_Complemento'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Bairro: TStringField
      FieldName = 'Fornecedor_Bairro'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Cidade: TStringField
      FieldName = 'Fornecedor_Cidade'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Estado: TStringField
      FieldName = 'Fornecedor_Estado'
      FixedChar = True
      Size = 2
    end
    object SQL_Fornecedores_VazioFornecedor_CEP: TStringField
      FieldName = 'Fornecedor_CEP'
      Size = 9
    end
    object SQL_Fornecedores_VazioFornecedor_Fone_Comercial: TStringField
      FieldName = 'Fornecedor_Fone_Comercial'
      Size = 15
    end
    object SQL_Fornecedores_VazioFornecedor_Fone_Celular: TStringField
      FieldName = 'Fornecedor_Fone_Celular'
      Size = 15
    end
    object SQL_Fornecedores_VazioFornecedor_Fone_Fax: TStringField
      FieldName = 'Fornecedor_Fone_Fax'
      Size = 15
    end
    object SQL_Fornecedores_VazioFornecedor_Contato: TStringField
      FieldName = 'Fornecedor_Contato'
      Size = 100
    end
    object SQL_Fornecedores_VazioFornecedor_Email: TStringField
      FieldName = 'Fornecedor_Email'
      Size = 100
    end
  end
  object DS_Fornecedores_Vazio: TDataSource
    DataSet = SQL_Fornecedores_Vazio
    Left = 312
    Top = 230
  end
  object SQL_Informacao_Maquinas_Vazio: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Informacao_Maquinas_Vazio')
    Left = 352
    Top = 182
    object SQL_Informacao_Maquinas_VazioInformacao_Maquina_HD: TStringField
      FieldName = 'Informacao_Maquina_HD'
      Size = 10
    end
    object SQL_Informacao_Maquinas_VazioInformacao_Maquina_Descricao: TStringField
      FieldName = 'Informacao_Maquina_Descricao'
      Size = 50
    end
  end
  object DS_Informacao_Maquinas_Vazio: TDataSource
    DataSet = SQL_Informacao_Maquinas_Vazio
    Left = 352
    Top = 230
  end
  object SQL_Registro_Caixa_Movto: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Registro_Caixa_Movto')
    Left = 512
    Top = 182
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Data: TDateField
      FieldName = 'Registro_Caixa_Data'
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Hora: TStringField
      FieldName = 'Registro_Caixa_Hora'
      Size = 8
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Operacao: TStringField
      FieldName = 'Registro_Caixa_Operacao'
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Maquina: TStringField
      FieldName = 'Registro_Caixa_Maquina'
      Size = 10
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Pedido: TStringField
      FieldName = 'Registro_Caixa_Pedido'
      Size = 10
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Usuario: TStringField
      FieldName = 'Registro_Caixa_Usuario'
      Size = 50
    end
    object SQL_Registro_Caixa_MovtoRegistro_Caixa_Valor: TFloatField
      FieldName = 'Registro_Caixa_Valor'
      DisplayFormat = '0.00'
    end
  end
  object SQL_Corpo_Cupons_Movto: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Corpo_Cupons_Movto')
    Left = 472
    Top = 182
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Posicao: TAutoIncField
      FieldName = 'Corpo_Cupom_Posicao'
      ReadOnly = True
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Cabeca: TIntegerField
      FieldName = 'Corpo_Cupom_Cabeca'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Maquina: TStringField
      FieldName = 'Corpo_Cupom_Maquina'
      Size = 10
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Prod_Codigo: TIntegerField
      FieldName = 'Corpo_Cupom_Prod_Codigo'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Prod_Desc: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc'
      Size = 100
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Prod_Desc_Curta: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc_Curta'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Prod_Qtde: TSmallintField
      FieldName = 'Corpo_Cupom_Prod_Qtde'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Prod_Vlr_Unitario: TFloatField
      FieldName = 'Corpo_Cupom_Prod_Vlr_Unitario'
      DisplayFormat = '0.00'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Vlr_Total: TFloatField
      FieldName = 'Corpo_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Data_Emissao: TDateField
      FieldName = 'Corpo_Cupom_Data_Emissao'
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Hora_Emissao: TStringField
      FieldName = 'Corpo_Cupom_Hora_Emissao'
      Size = 8
    end
    object SQL_Corpo_Cupons_MovtoCorpo_Cupom_Status: TStringField
      FieldName = 'Corpo_Cupom_Status'
      Size = 10
    end
  end
  object SQL_Cabeca_Cupons_Movto: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cabeca_Cupons_Movto')
    Left = 432
    Top = 182
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Posicao: TAutoIncField
      FieldName = 'Cabeca_Cupom_Posicao'
      ReadOnly = True
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Numero: TIntegerField
      FieldName = 'Cabeca_Cupom_Numero'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Maquina: TStringField
      FieldName = 'Cabeca_Cupom_Maquina'
      Size = 10
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Status: TStringField
      FieldName = 'Cabeca_Cupom_Status'
      Size = 10
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Forma_Pgto: TStringField
      FieldName = 'Cabeca_Cupom_Forma_Pgto'
      FixedChar = True
      Size = 1
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Vlr_Total: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Vlr_Pago: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Pago'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Vlr_Troco: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Troco'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Qtd_Itens: TSmallintField
      FieldName = 'Cabeca_Cupom_Qtd_Itens'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Cabeca_Cupom_Data_Emissao'
    end
    object SQL_Cabeca_Cupons_MovtoCabeca_Cupom_Hora_Emissao: TStringField
      FieldName = 'Cabeca_Cupom_Hora_Emissao'
      Size = 8
    end
  end
  object DS_Cabeca_Cupons_Movto: TDataSource
    DataSet = SQL_Cabeca_Cupons_Movto
    Left = 432
    Top = 230
  end
  object DS_Corpo_Cupons_Movto: TDataSource
    DataSet = SQL_Corpo_Cupons_Movto
    Left = 472
    Top = 230
  end
  object DS_Registro_Caixa_Movto: TDataSource
    DataSet = SQL_Registro_Caixa_Movto
    Left = 512
    Top = 230
  end
  object DS_Cabeca_Cupons_ANT: TDataSource
    DataSet = SQL_Cabeca_Cupons_ANT
    Left = 32
    Top = 350
  end
  object SQL_Cabeca_Cupons_ANT: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cabeca_Cupons')
    Left = 32
    Top = 302
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Numero: TAutoIncField
      FieldName = 'Cabeca_Cupom_Numero'
      ReadOnly = True
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Maquina: TStringField
      FieldName = 'Cabeca_Cupom_Maquina'
      Size = 10
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Status: TStringField
      FieldName = 'Cabeca_Cupom_Status'
      Size = 10
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Forma_Pgto: TStringField
      FieldName = 'Cabeca_Cupom_Forma_Pgto'
      FixedChar = True
      Size = 1
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Vlr_Total: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Vlr_Pago: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Pago'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Vlr_Troco: TFloatField
      FieldName = 'Cabeca_Cupom_Vlr_Troco'
      DisplayFormat = '0.00'
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Qtd_Itens: TSmallintField
      FieldName = 'Cabeca_Cupom_Qtd_Itens'
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Data_Emissao: TDateTimeField
      FieldName = 'Cabeca_Cupom_Data_Emissao'
    end
    object SQL_Cabeca_Cupons_ANTCabeca_Cupom_Hora_Emissao: TStringField
      FieldName = 'Cabeca_Cupom_Hora_Emissao'
      Size = 8
    end
  end
  object SQL_Corpo_Cupons_ANT: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Corpo_Cupons')
    Left = 72
    Top = 302
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Cabeca: TIntegerField
      FieldName = 'Corpo_Cupom_Cabeca'
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Maquina: TStringField
      FieldName = 'Corpo_Cupom_Maquina'
      Size = 10
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Prod_Codigo: TIntegerField
      FieldName = 'Corpo_Cupom_Prod_Codigo'
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Prod_Desc: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc'
      Size = 100
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Prod_Desc_Curta: TStringField
      FieldName = 'Corpo_Cupom_Prod_Desc_Curta'
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Prod_Qtde: TSmallintField
      FieldName = 'Corpo_Cupom_Prod_Qtde'
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Prod_Vlr_Unitario: TFloatField
      FieldName = 'Corpo_Cupom_Prod_Vlr_Unitario'
      DisplayFormat = '0.00'
    end
    object SQL_Corpo_Cupons_ANTCorpo_Cupom_Vlr_Total: TFloatField
      FieldName = 'Corpo_Cupom_Vlr_Total'
      DisplayFormat = '0.00'
    end
  end
  object DS_Corpo_Cupons_ANT: TDataSource
    DataSet = SQL_Corpo_Cupons_ANT
    Left = 72
    Top = 350
  end
  object DS_Registro_Caixa_ANT: TDataSource
    DataSet = SQL_Registro_Caixa_ANT
    Left = 112
    Top = 350
  end
  object SQL_Registro_Caixa_ANT: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Registro_Caixa')
    Left = 112
    Top = 302
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Data: TDateField
      FieldName = 'Registro_Caixa_Data'
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Hora: TStringField
      FieldName = 'Registro_Caixa_Hora'
      Size = 8
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Operacao: TStringField
      FieldName = 'Registro_Caixa_Operacao'
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Maquina: TStringField
      FieldName = 'Registro_Caixa_Maquina'
      Size = 10
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Pedido: TStringField
      FieldName = 'Registro_Caixa_Pedido'
      Size = 10
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Usuario: TStringField
      FieldName = 'Registro_Caixa_Usuario'
      Size = 50
    end
    object SQL_Registro_Caixa_ANTRegistro_Caixa_Valor: TFloatField
      FieldName = 'Registro_Caixa_Valor'
      DisplayFormat = '0.00'
    end
  end
  object SQL_Item_Cancelado: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Item_Cancelado')
    Left = 552
    Top = 182
    object SQL_Item_CanceladoItem_Cancelado_Numero: TAutoIncField
      FieldName = 'Item_Cancelado_Numero'
      ReadOnly = True
    end
    object SQL_Item_CanceladoItem_Cancelado_Data: TDateTimeField
      FieldName = 'Item_Cancelado_Data'
    end
    object SQL_Item_CanceladoItem_Cancelado_Hora: TStringField
      FieldName = 'Item_Cancelado_Hora'
      Size = 8
    end
    object SQL_Item_CanceladoItem_Cancelado_Maquina: TStringField
      FieldName = 'Item_Cancelado_Maquina'
      Size = 10
    end
    object SQL_Item_CanceladoItem_Cancelado_Usuario: TStringField
      FieldName = 'Item_Cancelado_Usuario'
      Size = 50
    end
    object SQL_Item_CanceladoItem_Cancelado_Prod_Cod: TIntegerField
      FieldName = 'Item_Cancelado_Prod_Cod'
    end
    object SQL_Item_CanceladoItem_Cancelado_Prod_Desc: TStringField
      FieldName = 'Item_Cancelado_Prod_Desc'
      Size = 100
    end
    object SQL_Item_CanceladoItem_Cancelado_Prod_Qtde: TSmallintField
      FieldName = 'Item_Cancelado_Prod_Qtde'
    end
  end
  object DS_Item_Cancelado: TDataSource
    DataSet = SQL_Item_Cancelado
    Left = 552
    Top = 230
  end
  object DS_Item_Cancelado_Movto: TDataSource
    DataSet = SQL_Item_Cancelado_Movto
    Left = 512
    Top = 350
  end
  object SQL_Item_Cancelado_Movto: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Item_Cancelado_Movto')
    Left = 512
    Top = 302
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Numero: TAutoIncField
      FieldName = 'Item_Cancelado_Numero'
      ReadOnly = True
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Data: TDateTimeField
      FieldName = 'Item_Cancelado_Data'
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Hora: TStringField
      FieldName = 'Item_Cancelado_Hora'
      Size = 8
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Maquina: TStringField
      FieldName = 'Item_Cancelado_Maquina'
      Size = 10
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Usuario: TStringField
      FieldName = 'Item_Cancelado_Usuario'
      Size = 50
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Prod_Cod: TIntegerField
      FieldName = 'Item_Cancelado_Prod_Cod'
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Prod_Desc: TStringField
      FieldName = 'Item_Cancelado_Prod_Desc'
      Size = 100
    end
    object SQL_Item_Cancelado_MovtoItem_Cancelado_Prod_Qtde: TSmallintField
      FieldName = 'Item_Cancelado_Prod_Qtde'
    end
  end
  object SQL_Item_Cancelado_ANT: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Item_Cancelado')
    Left = 152
    Top = 302
    object SQL_Item_Cancelado_ANTItem_Cancelado_Numero: TAutoIncField
      FieldName = 'Item_Cancelado_Numero'
      ReadOnly = True
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Data: TDateTimeField
      FieldName = 'Item_Cancelado_Data'
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Hora: TStringField
      FieldName = 'Item_Cancelado_Hora'
      Size = 8
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Maquina: TStringField
      FieldName = 'Item_Cancelado_Maquina'
      Size = 10
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Usuario: TStringField
      FieldName = 'Item_Cancelado_Usuario'
      Size = 50
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Prod_Cod: TIntegerField
      FieldName = 'Item_Cancelado_Prod_Cod'
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Prod_Desc: TStringField
      FieldName = 'Item_Cancelado_Prod_Desc'
      Size = 100
    end
    object SQL_Item_Cancelado_ANTItem_Cancelado_Prod_Qtde: TSmallintField
      FieldName = 'Item_Cancelado_Prod_Qtde'
    end
  end
  object DS_Item_Cancelado_ANT: TDataSource
    DataSet = SQL_Item_Cancelado_ANT
    Left = 152
    Top = 350
  end
  object SQL_Item_Cancelado_Rel: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Item_Cancelado_Movto,Informacao_Maquinas_Vazio'
      ' Where  Item_Cancelado_Maquina=Informacao_Maquina_HD'
      
        ' Order by Item_Cancelado_Maquina, Item_Cancelado_Data, Item_Canc' +
        'elado_Hora')
    Left = 552
    Top = 303
    object SQL_Item_Cancelado_RelItem_Cancelado_Numero: TAutoIncField
      FieldName = 'Item_Cancelado_Numero'
      ReadOnly = True
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Data: TDateTimeField
      FieldName = 'Item_Cancelado_Data'
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Hora: TStringField
      FieldName = 'Item_Cancelado_Hora'
      Size = 8
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Maquina: TStringField
      FieldName = 'Item_Cancelado_Maquina'
      Size = 10
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Usuario: TStringField
      FieldName = 'Item_Cancelado_Usuario'
      Size = 50
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Prod_Cod: TIntegerField
      FieldName = 'Item_Cancelado_Prod_Cod'
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Prod_Desc: TStringField
      FieldName = 'Item_Cancelado_Prod_Desc'
      Size = 100
    end
    object SQL_Item_Cancelado_RelItem_Cancelado_Prod_Qtde: TSmallintField
      FieldName = 'Item_Cancelado_Prod_Qtde'
    end
    object SQL_Item_Cancelado_RelInformacao_Maquina_HD: TStringField
      FieldName = 'Informacao_Maquina_HD'
      Size = 10
    end
    object SQL_Item_Cancelado_RelInformacao_Maquina_Descricao: TStringField
      FieldName = 'Informacao_Maquina_Descricao'
      Size = 50
    end
  end
  object DS_Item_Cancelado_Rel: TDataSource
    DataSet = SQL_Item_Cancelado_Rel
    Left = 552
    Top = 350
  end
  object DS_Registro_Caixa_Busca: TDataSource
    DataSet = SQL_Registro_Caixa_Busca
    Left = 592
    Top = 350
  end
  object SQL_Registro_Caixa_Busca: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Registro_Caixa_Movto')
    Left = 592
    Top = 302
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Data: TDateField
      FieldName = 'Registro_Caixa_Data'
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Hora: TStringField
      FieldName = 'Registro_Caixa_Hora'
      Size = 8
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Operacao: TStringField
      FieldName = 'Registro_Caixa_Operacao'
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Maquina: TStringField
      FieldName = 'Registro_Caixa_Maquina'
      Size = 10
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Pedido: TStringField
      FieldName = 'Registro_Caixa_Pedido'
      Size = 10
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Usuario: TStringField
      FieldName = 'Registro_Caixa_Usuario'
      Size = 50
    end
    object SQL_Registro_Caixa_BuscaRegistro_Caixa_Valor: TFloatField
      FieldName = 'Registro_Caixa_Valor'
      DisplayFormat = '0.00'
    end
  end
  object DS_Entrada_Nota_Cabeca: TDataSource
    DataSet = SQL_Entrada_Nota_Cabeca
    Left = 432
    Top = 110
  end
  object SQL_Entrada_Nota_Cabeca: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Entrada_Nota_Cabeca')
    Left = 432
    Top = 62
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Numero: TAutoIncField
      FieldName = 'Entrada_Nota_Cabeca_Numero'
      ReadOnly = True
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Lacto: TDateTimeField
      FieldName = 'Entrada_Nota_Cabeca_Lacto'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Fornecedor_Cod: TIntegerField
      FieldName = 'Entrada_Nota_Cabeca_Fornecedor_Cod'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Fornecedor_Desc: TStringField
      FieldName = 'Entrada_Nota_Cabeca_Fornecedor_Desc'
      Size = 50
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Nota: TStringField
      FieldName = 'Entrada_Nota_Cabeca_Nota'
      Size = 10
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Emissao: TDateTimeField
      FieldName = 'Entrada_Nota_Cabeca_Emissao'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Cond_Pgto: TStringField
      FieldName = 'Entrada_Nota_Cabeca_Cond_Pgto'
      Size = 50
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_IPI: TFloatField
      FieldName = 'Entrada_Nota_Cabeca_IPI'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Desconto: TFloatField
      FieldName = 'Entrada_Nota_Cabeca_Desconto'
      DisplayFormat = '0.00'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Total: TFloatField
      FieldName = 'Entrada_Nota_Cabeca_Total'
      DisplayFormat = '0.00'
    end
    object SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Ajusta: TStringField
      FieldName = 'Entrada_Nota_Cabeca_Ajusta'
      FixedChar = True
      Size = 1
    end
  end
  object DS_Entrada_Nota_Produto: TDataSource
    DataSet = SQL_Entrada_Nota_Produto
    Left = 472
    Top = 110
  end
  object SQL_Entrada_Nota_Produto: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Entrada_Nota_Produto')
    Left = 472
    Top = 62
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Numero: TAutoIncField
      FieldName = 'Entrada_Nota_Produto_Numero'
      ReadOnly = True
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Cabeca: TIntegerField
      FieldName = 'Entrada_Nota_Produto_Cabeca'
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Cod: TIntegerField
      FieldName = 'Entrada_Nota_Produto_Cod'
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Desc: TStringField
      FieldName = 'Entrada_Nota_Produto_Desc'
      Size = 100
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Qtde: TIntegerField
      FieldName = 'Entrada_Nota_Produto_Qtde'
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Unit: TFloatField
      FieldName = 'Entrada_Nota_Produto_Unit'
    end
    object SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Total: TFloatField
      FieldName = 'Entrada_Nota_Produto_Total'
      DisplayFormat = '0.00'
    end
  end
  object DS_Empresa: TDataSource
    DataSet = SQL_Empresa
    Left = 512
    Top = 110
  end
  object SQL_Empresa: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from empresa')
    Left = 512
    Top = 62
    object SQL_EmpresaEmpresa_Razao_Social: TStringField
      FieldName = 'Empresa_Razao_Social'
      Size = 100
    end
    object SQL_EmpresaEmpresa_Nome_Exibicao: TStringField
      FieldName = 'Empresa_Nome_Exibicao'
      Size = 100
    end
    object SQL_EmpresaEmpresa_Endereco: TStringField
      FieldName = 'Empresa_Endereco'
      Size = 100
    end
    object SQL_EmpresaEmpresa_Bairro: TStringField
      FieldName = 'Empresa_Bairro'
      Size = 100
    end
    object SQL_EmpresaEmpresa_Cidade: TStringField
      FieldName = 'Empresa_Cidade'
      Size = 100
    end
    object SQL_EmpresaEmpresa_Estado: TStringField
      FieldName = 'Empresa_Estado'
      FixedChar = True
      Size = 2
    end
    object SQL_EmpresaEmpresa_Cep: TStringField
      FieldName = 'Empresa_Cep'
      Size = 9
    end
    object SQL_EmpresaEmpresa_Fone: TStringField
      FieldName = 'Empresa_Fone'
      Size = 50
    end
    object SQL_EmpresaEmpresa_Vincula_Cliente: TStringField
      FieldName = 'Empresa_Vincula_Cliente'
      Size = 3
    end
  end
  object DS_Fechamento_Caixa: TDataSource
    DataSet = SQL_Fechamento_Caixa
    Left = 192
    Top = 350
  end
  object SQL_Fechamento_Caixa: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  fechamentos_caixas')
    Left = 192
    Top = 302
    object SQL_Fechamento_Caixafechamento_caixa_maquina: TStringField
      FieldName = 'fechamento_caixa_maquina'
      Size = 10
    end
    object SQL_Fechamento_Caixafechamento_caixa_nro_ultimo_cupom: TStringField
      FieldName = 'fechamento_caixa_nro_ultimo_cupom'
      Size = 11
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_ultimo_cupom: TFloatField
      FieldName = 'fechamento_caixa_vlr_ultimo_cupom'
      DisplayFormat = '0.00'
    end
    object SQL_Fechamento_Caixafechamento_caixa_qtde_cupons: TIntegerField
      FieldName = 'fechamento_caixa_qtde_cupons'
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_abertura: TFloatField
      FieldName = 'fechamento_caixa_vlr_abertura'
      DisplayFormat = '0.00'
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_vendas: TFloatField
      FieldName = 'fechamento_caixa_vlr_vendas'
      DisplayFormat = '0.00'
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_sangria: TFloatField
      FieldName = 'fechamento_caixa_vlr_sangria'
      DisplayFormat = '0.00'
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_total_caixa: TFloatField
      FieldName = 'fechamento_caixa_vlr_total_caixa'
      DisplayFormat = '0.00'
    end
    object SQL_Fechamento_Caixafechamento_caixa_vlr_venda_diaria: TFloatField
      FieldName = 'fechamento_caixa_vlr_venda_diaria'
      DisplayFormat = '0.00'
    end
  end
  object SQL_Licencas: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    Left = 152
    Top = 62
  end
  object DS_Licencas: TDataSource
    DataSet = SQL_Licencas
    Left = 152
    Top = 110
  end
  object SQL_Clientes: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from mgt_clientes')
    Left = 552
    Top = 62
  end
  object DS_Clientes: TDataSource
    DataSet = SQL_Clientes
    Left = 552
    Top = 110
  end
  object SQL_Compras_Clientes: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  cabeca_cupons')
    Left = 232
    Top = 302
  end
  object DS_Compras_Clientes: TDataSource
    DataSet = SQL_Compras_Clientes
    Left = 232
    Top = 350
  end
  object SQL_Compras_Clientes_Rel: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  cabeca_cupons')
    Left = 272
    Top = 302
  end
  object DS_Compras_Clientes_Rel: TDataSource
    DataSet = SQL_Compras_Clientes_Rel
    Left = 272
    Top = 350
  end
  object SQL_Trocas: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Trocas')
    Left = 312
    Top = 302
  end
  object DS_Trocas: TDataSource
    DataSet = SQL_Trocas
    Left = 312
    Top = 350
  end
  object SQL_Margem_Rel: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cabeca_Cupons,Corpo_Cupons,Produtos Where '
      
        '((Cabeca_Cupom_Data_Emissao >= '#39'0000-00-00'#39') and (Cabeca_Cupom_D' +
        'ata_Emissao <= '#39'0000-00-00'#39')) AND '
      'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND '
      'Corpo_Cupom_Prod_Codigo = Produto_Codigo '
      'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC ')
    Left = 352
    Top = 302
  end
  object DS_Margem_Rel: TDataSource
    DataSet = SQL_Margem_Rel
    Left = 352
    Top = 350
  end
  object SQL_Estoque_Minimo: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM produtos AS p '
      
        'LEFT JOIN (SELECT * FROM corpo_cupons, cabeca_cupons WHERE Corpo' +
        '_Cupom_Cabeca = Cabeca_Cupom_Numero ORDER BY Cabeca_Cupom_Numero' +
        ' DESC) AS i'
      'ON (p.Produto_Codigo = i.Corpo_Cupom_Prod_Codigo) '
      'WHERE p.Produto_Estoque_Atual < p.Produto_Estoque_Minimo '
      'GROUP BY p.Produto_Codigo '
      'ORDER BY p.Produto_Descricao ASC, p.Produto_Codigo ASC')
    Left = 392
    Top = 302
  end
  object DS_Estoque_Minimo: TDataSource
    DataSet = SQL_Estoque_Minimo
    Left = 392
    Top = 350
  end
  object SQL_Numero_Nota: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Numero_Nota_Fiscal')
    Left = 432
    Top = 302
  end
  object DS_Numero_Nota: TDataSource
    DataSet = SQL_Numero_Nota
    Left = 432
    Top = 350
  end
  object SQL_Selecao_Produtos_Nota: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Selecao_Produtos_Nota')
    Left = 472
    Top = 302
  end
  object DS_Selecao_Produtos_Nota: TDataSource
    DataSet = SQL_Selecao_Produtos_Nota
    Left = 472
    Top = 350
  end
  object Conexao_ManagerTEX: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=mgt_m' +
      'anagertex;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 640
    Top = 8
  end
  object SQL_GruposD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from mgt_familias_produtos')
    Left = 639
    Top = 62
  end
  object DS_GruposD: TDataSource
    DataSet = SQL_GruposD
    Left = 640
    Top = 110
  end
  object SQL_Cabeca_CuponsD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from mgt_notas_fiscais')
    Left = 680
    Top = 62
  end
  object DS_Cabeca_CuponsD: TDataSource
    DataSet = SQL_Cabeca_CuponsD
    Left = 680
    Top = 110
  end
  object SQL_Corpo_CuponsD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From mgt_notas_fiscais_produtos')
    Left = 720
    Top = 62
  end
  object DS_Corpo_CuponsD: TDataSource
    DataSet = SQL_Corpo_CuponsD
    Left = 720
    Top = 110
  end
  object SQL_LucratividadeD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Lucratividade')
    Left = 760
    Top = 62
  end
  object DS_LucratividadeD: TDataSource
    DataSet = SQL_LucratividadeD
    Left = 760
    Top = 110
  end
  object SQL_Cupom_LucratividadeD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  Lucratividade')
    Left = 800
    Top = 62
  end
  object DS_Cupom_LucratividadeD: TDataSource
    DataSet = SQL_Cupom_LucratividadeD
    Left = 800
    Top = 110
  end
  object SQL_Comunitario_SecundarioD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    Left = 840
    Top = 62
  end
  object DS_Comunitario_SecundarioD: TDataSource
    DataSet = SQL_Comunitario_SecundarioD
    Left = 840
    Top = 110
  end
  object SQL_ProdutosD: TADOQuery
    Connection = Conexao_ManagerTEX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM mgt_produtos')
    Left = 880
    Top = 62
  end
  object DS_ProdutosD: TDataSource
    DataSet = SQL_ProdutosD
    Left = 880
    Top = 110
  end
  object DS_Perdas: TDataSource
    DataSet = SQL_Perdas
    Left = 632
    Top = 350
  end
  object SQL_Perdas: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM perdas')
    Left = 632
    Top = 302
    object SQL_Perdasperda_data: TDateField
      FieldName = 'perda_data'
    end
    object SQL_Perdasperda_sequencial: TAutoIncField
      FieldName = 'perda_sequencial'
      ReadOnly = True
    end
    object SQL_Perdasperda_produto_codigo_barras: TStringField
      FieldName = 'perda_produto_codigo_barras'
      Size = 15
    end
    object SQL_Perdasperda_produto_descricao: TStringField
      FieldName = 'perda_produto_descricao'
      Size = 100
    end
    object SQL_Perdasperda_produto_custo: TFloatField
      FieldName = 'perda_produto_custo'
    end
  end
end
