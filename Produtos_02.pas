unit Produtos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TProdutos02 = class(TForm)
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditDescricao: TEdit;
    EditDescricao_Curta: TEdit;
    CBGrupo: TComboBox;
    CBFornecedor: TComboBox;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    EditCusto: TEdit;
    EditLucro: TEdit;
    EditPreco: TEdit;
    lblCodigo: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    EditCod_Barra: TEdit;
    EditEstoque: TEdit;
    Label12: TLabel;
    EditNCM: TEdit;
    GroupBox3: TGroupBox;
    BT_Inicio: TBitBtn;
    BT_Anterior: TBitBtn;
    BT_Proximo: TBitBtn;
    BT_Final: TBitBtn;
    EditGrupo_Ant: TEdit;
    EditFor_Cod_Ant: TEdit;
    EditFor_Desc_Ant: TEdit;
    Edit_Cod_Barra: TEdit;
    Cod_Grupo: TEdit;
    Cod_Fornecedores: TEdit;
    Label13: TLabel;
    Edit_Busca: TEdit;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    EditUnidade: TComboBox;
    BT_Incluir_Grupo: TLabel;
    BT_Incluir_Fornecedor: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EditMinimo: TEdit;
    Label16: TLabel;
    CodProdFornecedor: TEdit;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditValorEnergeticoG: TEdit;
    EditValorEnergeticoP: TEdit;
    EditCarboidratosG: TEdit;
    EditCarboidratosP: TEdit;
    EditProteinasG: TEdit;
    EditProteinasP: TEdit;
    EditGordurasTotaisG: TEdit;
    EditGordurasTotaisP: TEdit;
    EditGordurasSaturadasG: TEdit;
    EditGordurasSaturadasP: TEdit;
    EditGordurasTransG: TEdit;
    EditGordurasTransP: TEdit;
    EditFibrasG: TEdit;
    EditFibrasP: TEdit;
    EditSodioG: TEdit;
    EditSodioP: TEdit;
    GroupBox5: TGroupBox;
    BT_Imprimir: TBitBtn;
    EditEtiquetas: TEdit;
    Label17: TLabel;
    Label26: TLabel;
    EditPeso: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescricao_CurtaKeyPress(Sender: TObject; var Key: Char);
    procedure CBGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure CBFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EditCod_BarraKeyPress(Sender: TObject; var Key: Char);
    procedure EditUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure EditCustoKeyPress(Sender: TObject; var Key: Char);
    procedure EditLucroKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EditCustoExit(Sender: TObject);
    procedure EditLucroExit(Sender: TObject);
    procedure EditPrecoExit(Sender: TObject);
    procedure BT_InicioClick(Sender: TObject);
    procedure BT_AnteriorClick(Sender: TObject);
    procedure BT_ProximoClick(Sender: TObject);
    procedure BT_FinalClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Cod_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure Cod_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EditNCMKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit_BuscaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_BuscaChange(Sender: TObject);
    procedure BT_Incluir_GrupoClick(Sender: TObject);
    procedure BT_Incluir_FornecedorClick(Sender: TObject);
    procedure EditMinimoKeyPress(Sender: TObject; var Key: Char);
    procedure CodProdFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorEnergeticoGKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorEnergeticoPKeyPress(Sender: TObject; var Key: Char);
    procedure EditCarboidratosGKeyPress(Sender: TObject; var Key: Char);
    procedure EditCarboidratosPKeyPress(Sender: TObject; var Key: Char);
    procedure EditProteinasGKeyPress(Sender: TObject; var Key: Char);
    procedure EditProteinasPKeyPress(Sender: TObject; var Key: Char);
    procedure EditGordurasTotaisGKeyPress(Sender: TObject; var Key: Char);
    procedure EditGordurasTotaisPKeyPress(Sender: TObject; var Key: Char);
    procedure EditGordurasSaturadasGKeyPress(Sender: TObject;
      var Key: Char);
    procedure EditGordurasSaturadasPKeyPress(Sender: TObject;
      var Key: Char);
    procedure EditGordurasTransGKeyPress(Sender: TObject; var Key: Char);
    procedure EditGordurasTransPKeyPress(Sender: TObject; var Key: Char);
    procedure EditFibrasGKeyPress(Sender: TObject; var Key: Char);
    procedure EditFibrasPKeyPress(Sender: TObject; var Key: Char);
    procedure EditSodioGKeyPress(Sender: TObject; var Key: Char);
    procedure EditSodioPKeyPress(Sender: TObject; var Key: Char);
    procedure EditEtiquetasKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure EditPesoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure Calcula_Lucro_Venda();
    procedure Calcula_Venda_Lucro();
    procedure Busca_Produto();

  public
    { Public declarations }
  end;

var
  Produtos02: TProdutos02;

implementation

uses Rotinas_Gerais, Conexao_BD, Fornecedores_01, Grupos_01, Produtos_01;

{$R *.dfm}

procedure TProdutos02.BT_SairClick(Sender: TObject);
begin
  Produtos02.Close;
end;

procedure TProdutos02.BT_ExcluirClick(Sender: TObject);
begin
    If Confirma('Deseja realmente excluir o Produto '+Trim(lblCodigo.Caption)+' ?')= 6 Then
      Begin
      Ampulheta();
      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete from Produtos Where Produto_Codigo=' + Trim(lblCodigo.Caption));
      ConexaoBD.SQL_Comunitario.ExecSQL;
      Seta();

      MSG_Erro('Exclusão efetuada com sucesso...');

      Movto_Ponteiro('Proximo','Produtos');

      Edit_Busca.SetFocus;
    End;
end;

procedure TProdutos02.FormShow(Sender: TObject);
begin
    Ampulheta();

    ConexaoBD.SQL_Produtos.Close;
    ConexaoBD.SQL_Produtos.SQL.Clear;
    ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where Produto_Codigo=' + Trim(lblCodigo.Caption));
    ConexaoBD.SQL_Produtos.Open;

    EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
    EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

    Carrega_Grupos('Produtos02');
    Carrega_Fornecedores('Produtos02');

    EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
    EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

    Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

    If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
       Begin
       EditUnidade.ItemIndex   := 0;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
       Begin
       EditUnidade.ItemIndex   := 1;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
       Begin
       EditUnidade.ItemIndex   := 2;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
       Begin
       EditUnidade.ItemIndex   := 3;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
       Begin
       EditUnidade.ItemIndex   := 4;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
       Begin
       EditUnidade.ItemIndex   := 5;
    End;

    EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
    EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
    EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
    EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
    EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
    CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;

    //*** Carrega a Tabela Nutricional ***
    EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
    EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
    EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
    EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
    EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
    EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
    EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
    EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

    EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
    EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
    EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
    EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
    EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
    EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
    EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
    EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;

    Seta();
End;

procedure TProdutos02.BT_AlterarClick(Sender: TObject);
var ComandoSQL : String;
begin

  Ampulheta();

    If Trim(EditDescricao.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      EditDescricao.SetFocus;
      End
    Else If Trim(EditDescricao_Curta.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição Curta...');
      EditDescricao_Curta.SetFocus;
      End
    Else If Trim(CBGrupo.Text) = '--- Nenhum ---' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Grupo...');
      CBGrupo.SetFocus;
      End
    Else If Trim(CBFornecedor.Text) = '--- Nenhum ---' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Fornecedor...');
      CBFornecedor.SetFocus;
      End
    Else If Trim(EditCod_Barra.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Código de Barras...');
      EditCod_Barra.SetFocus;
      End
    Else If Trim(EditUnidade.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Unidade...');
      EditUnidade.SetFocus;
      End
    Else If Trim(EditEstoque.Text) = '' Then
      Begin
      MSG_Erro('Antes de proseguir preencha o campo Estoque...');
      EditEstoque.SetFocus;
      End
    Else If Trim(EditMinimo.Text) = '' Then
      Begin
      MSG_Erro('Antes de proseguir preencha o campo Estoque Mínimo...');
      EditMinimo.SetFocus;
      End
    Else If Trim(EditCusto.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Custo...');
      EditCusto.SetFocus;
      End
    Else If Trim(EditLucro.Text) = '' Then
      Begin
      MSG_Erro('Antes de proseguir preencha o campo Margem de Lucro...');
      EditLucro.SetFocus;
      End
    Else If Trim(EditPreco.Text) = '' Then
      Begin
      MSG_Erro('Antes de proseguir preencha o campo Preço de Varejo...');
      EditPreco.SetFocus;
      End
    Else
      Begin

      If Trim(EditCod_Barra.Text)<>Trim(Edit_Cod_Barra.Text) Then
        Begin

          ConexaoBD.SQL_Produtos.Close;
          ConexaoBD.SQL_Produtos.SQL.Clear;
          ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where Produto_Cod_Barra ="' + Trim(EditCod_Barra.Text) + '"');
          ConexaoBD.SQL_Produtos.Open;

          If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
              MSG_Erro('Este Código de Barras já está sendo utilizado ');
              EditCod_Barra.SetFocus;
              Seta();
              Exit;
          End;
      End;

      ComandoSQL := 'Update Produtos Set ';
      ComandoSQL := ComandoSQL + 'Produto_Descricao="'       + Trim(EditDescricao.Text)                 + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Descricao_Curta="' + Trim(EditDescricao_Curta.Text)           + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Grupo='            + Obtem_Nro_Antes_Traco(CBGrupo.Text)      + ',  ';
      ComandoSQL := ComandoSQL + 'Produto_Fornecedor_Cod='   + Obtem_Nro_Antes_Traco(CBFornecedor.Text) + ',  ';
      ComandoSQL := ComandoSQL + 'Produto_Fornecedor_Desc="' + Obtem_Depois_Traco(CBFornecedor.Text)    + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Cod_Barra="'       + Trim(EditCod_Barra.Text)                 + '", ';
      ComandoSQL := ComandoSQL + 'Produto_NCM="'             + Trim(EditNCM.Text)                       + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Unidade="'         + Trim(EditUnidade.Text)                   + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Estoque_Atual='    + Trim(EditEstoque.Text)                   + ',  ';
      ComandoSQL := ComandoSQL + 'Produto_Estoque_Minimo='   + Trim(EditMinimo.Text)                    + ',  ';
      ComandoSQL := ComandoSQL + 'Produto_Custo="'           + Virgula_Ponto(Trim(EditCusto.Text))      + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Margem_Lucro="'    + Virgula_Ponto(Trim(EditLucro.Text))      + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Preco_Varejo="'    + Virgula_Ponto(Trim(EditPreco.Text))      + '", ';
      ComandoSQL := ComandoSQL + 'Produto_Pedido_Codigo_Fornecedor="' + Trim(CodProdFornecedor.Text)    + '", ';

      ComandoSQL := ComandoSQL + 'Produto_TN_Valor_Energetico_C1="' + Trim(EditValorEnergeticoG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Carboidratos_C1="'     + Trim(EditCarboidratosG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Proteinas_C1="'        + Trim(EditProteinasG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Totais_C1="'  + Trim(EditGordurasTotaisG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Sat_C1="'     + Trim(EditGordurasSaturadasG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Trans_C1="'   + Trim(EditGordurasTransG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Fibras_C1="'           + Trim(EditFibrasG.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Sodio_C1="'            + Trim(EditSodioG.Text) + '", ';

      ComandoSQL := ComandoSQL + 'Produto_TN_Valor_Energetico_C2="' + Trim(EditValorEnergeticoP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Carboidratos_C2="'     + Trim(EditCarboidratosP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Proteinas_C2="'        + Trim(EditProteinasP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Totais_C2="'  + Trim(EditGordurasTotaisP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Sat_C2="'     + Trim(EditGordurasSaturadasP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Trans_C2="'   + Trim(EditGordurasTransP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Fibras_C2="'           + Trim(EditFibrasP.Text) + '", ';
      ComandoSQL := ComandoSQL + 'Produto_TN_Sodio_C2="'            + Trim(EditSodioP.Text) + '" ';

      ComandoSQL := ComandoSQL + 'Where Produto_Codigo='     + Trim(lblCodigo.Caption)                  ;

      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Alteração efetuada com sucesso...');
    End;

  Edit_Busca.SetFocus;

  Seta();

end;

procedure TProdutos02.EditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditDescricao_CurtaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.CBGrupoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.CBFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditCod_BarraKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TProdutos02.EditUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditEstoqueKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TProdutos02.EditCustoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TProdutos02.EditLucroKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TProdutos02.EditPrecoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TProdutos02.Calcula_Venda_Lucro();

var compra, lucro, venda : real;
    Str_Custo, Str_Lucro: String;

begin
  Str_Custo := EditCusto.Text;
  Str_Lucro := EditLucro.Text;

  If Trim(Str_Custo) = '' Then
     Begin
     Str_Custo := '0';
  End;

  If Trim(Str_Lucro) = '' Then
     Begin
     Str_Lucro := '0';
  End;

  compra  := StrToFloat(Str_Custo);
  lucro   := StrToFloat(Str_Lucro);

  venda := (compra+((compra * lucro) / 100));

  If ((Trim(FloatToStr(venda)) = '') Or (Trim(FloatToStr(venda)) = '0')) Then
     Begin
     EditPreco.Text := '0,00';
     End
  Else
     Begin
     EditPreco.Text := FormatFloat('0.00', venda);
  End;

  If Trim(EditPreco.Text) = '' Then
     Begin
     EditPreco.Text := '0,00';
  End;

  If Trim(EditCusto.Text) = '' Then
     Begin
     EditCusto.Text := '0,00';
  End;


  If StrToFloat(EditPreco.Text) < StrToFloat(EditCusto.Text) Then
     Begin
     MSG_Erro('Preço de Venda não pode ser inferior ao Preço de Custo.');
     EditPreco.SetFocus;
  End;

end;

procedure TProdutos02.Calcula_Lucro_Venda();

var compra, lucro, venda : real;
    Str_Valor, Str_Custo: String;

begin
  Str_Custo := Trim(EditCusto.Text);

  if (Trim(Str_Custo) = '') Or (StrToFloat(Str_Custo) = 0) Then
     Begin
     Str_Custo := '1';
  End;

  Str_Valor := Trim(EditPreco.Text);

  If Trim(Str_Valor) = '' Then
     Begin
     Str_Valor := '0';
  End;

  compra  := StrToFloat(Str_Custo);
  venda   := StrToFloat(Str_Valor);

  lucro := (((venda-compra)*100)/compra);

  If ((Trim(FloatToStr(lucro)) = '') Or (Trim(FloatToStr(lucro)) = '0')) Then
     Begin
     EditLucro.Text := '0,00';
     End
  Else
     Begin
     EditLucro.Text := FormatFloat('0.000', lucro);
  End;

  If Trim(EditPreco.Text) = '' Then
     Begin
     EditPreco.Text := '0,00';
  End;

  If Trim(EditCusto.Text) = '' Then
     Begin
     EditCusto.Text := '0,00';
  End;

  If StrToFloat(EditPreco.Text) < StrToFloat(EditCusto.Text) Then
     Begin
     MSG_Erro('Preço de Venda não pode ser inferior ao Preço de Custo.');
     EditPreco.SetFocus;
  End;

end;

procedure TProdutos02.EditCustoExit(Sender: TObject);
begin
     Calcula_Venda_Lucro();
end;

procedure TProdutos02.EditLucroExit(Sender: TObject);
begin
     Calcula_Venda_Lucro();
end;

procedure TProdutos02.EditPrecoExit(Sender: TObject);
begin
     Calcula_Lucro_Venda();
end;

procedure TProdutos02.BT_InicioClick(Sender: TObject);
begin
     Movto_Ponteiro('Inicio','Produtos');

     Edit_Busca.SetFocus; 
end;

procedure TProdutos02.BT_AnteriorClick(Sender: TObject);
begin
     Movto_Ponteiro('Anterior','Produtos');

     Edit_Busca.SetFocus; 
end;

procedure TProdutos02.BT_ProximoClick(Sender: TObject);
begin
     Movto_Ponteiro('Proximo','Produtos');

     Edit_Busca.SetFocus; 
end;

procedure TProdutos02.BT_FinalClick(Sender: TObject);
begin
     Movto_Ponteiro('Final','Produtos');

     Edit_Busca.SetFocus; 
end;

procedure TProdutos02.BitBtn1Click(Sender: TObject);
Var ComandoSQL: String;
begin
    ComandoSQL := 'Insert into Produtos(';
    ComandoSQL := ComandoSQL + 'Produto_Descricao       ,';
    ComandoSQL := ComandoSQL + 'Produto_Descricao_Curta ,';
    ComandoSQL := ComandoSQL + 'Produto_Grupo           ,';
    ComandoSQL := ComandoSQL + 'Produto_Fornecedor_Cod  ,';
    ComandoSQL := ComandoSQL + 'Produto_Fornecedor_Desc ,';
    ComandoSQL := ComandoSQL + 'Produto_Cod_Barra       ,';
    ComandoSQL := ComandoSQL + 'Produto_NCM             ,';
    ComandoSQL := ComandoSQL + 'Produto_Unidade         ,';
    ComandoSQL := ComandoSQL + 'Produto_Estoque_Atual   ,';
    ComandoSQL := ComandoSQL + 'Produto_Estoque_Minimo  ,';
    ComandoSQL := ComandoSQL + 'Produto_Custo           ,';
    ComandoSQL := ComandoSQL + 'Produto_Margem_Lucro    ,';
    ComandoSQL := ComandoSQL + 'Produto_Preco_Varejo    ,';
    ComandoSQL := ComandoSQL + 'Produto_Pedido_Codigo_Fornecedor)';

    ComandoSQL := ComandoSQL + 'Values(';
    ComandoSQL := ComandoSQL + #39 + Trim(Numero_HD('C'))                     + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditDescricao_Curta.Text)           + #39 + ',';
    ComandoSQL := ComandoSQL +       Obtem_Nro_Antes_Traco(CBGrupo.Text)      +       ',';
    ComandoSQL := ComandoSQL +       Obtem_Nro_Antes_Traco(CBFornecedor.Text) +       ',';
    ComandoSQL := ComandoSQL + #39 + Obtem_Depois_Traco(CBFornecedor.Text)    + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditCod_Barra.Text)                 + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditNCM.Text)                       + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditUnidade.Text)                   + #39 + ',';
    ComandoSQL := ComandoSQL +       Trim(EditEstoque.Text)                   +       ',';
    ComandoSQL := ComandoSQL +       Trim(EditMinimo.Text)                    +       ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditCusto.Text)                     + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditLucro.Text)                     + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(EditPreco.Text)                     + #39 + ',';
    ComandoSQL := ComandoSQL + #39 + Trim(CodProdFornecedor.Text)             + #39 + ')';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    ConexaoBD.SQL_Produtos.Close;
    ConexaoBD.SQL_Produtos.SQL.Clear;
    ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where Produto_Descricao =' +#39+ Trim(Numero_HD('C')) +#39);
    ConexaoBD.SQL_Produtos.Open;

    lblCodigo.Caption := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

    ConexaoBD.SQL_Produtos.Close;

    ComandoSQL := 'Update Produtos Set ';
    ComandoSQL := ComandoSQL + 'Produto_Descricao="'   + Trim(EditDescricao.Text) + '" ';
    ComandoSQL := ComandoSQL + 'Where Produto_Codigo=' + Trim(lblCodigo.Caption)  ;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Novo Produto Gerado Código '+ lblCodigo.Caption + '.');

end;

procedure TProdutos02.Cod_FornecedoresKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Procura_Fornecedores('Produtos02',Cod_Fornecedores.Text);

      if (CBFornecedor.ItemIndex > 0) or (Trim(Cod_Fornecedores.Text) = '') Then Perform(WM_NEXTDLGCTL, 0, 0)
      Else Cod_Fornecedores.SelectAll;
    End;
end;

procedure TProdutos02.Cod_GrupoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Procura_Grupos('Produtos02',Cod_Grupo.Text);

      if (CBGrupo.ItemIndex > 0) or (Trim(Cod_Grupo.Text) = '') Then Perform(WM_NEXTDLGCTL, 0, 0)
      Else Cod_Grupo.SelectAll;
    End;
end;

procedure TProdutos02.EditNCMKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TProdutos02.BitBtn3Click(Sender: TObject);
begin
     Busca_Produto();
end;

procedure TProdutos02.Edit_BuscaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Busca_Produto();
    End;
    So_Numero(Sender,Key);
end;

procedure TProdutos02.Busca_Produto();

var
   Codigo: String;
   Encontrou_Codigo: Boolean;

begin
 Codigo := Trim(Edit_Busca.Text);

 Encontrou_Codigo := False;

 ConexaoBD.SQL_Produtos.Close;
 ConexaoBD.SQL_Produtos.SQL.Clear;
 ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra = "' + Trim(Codigo) + '"');
 ConexaoBD.SQL_Produtos.Open;

 If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
    Begin
    Encontrou_Codigo := True;
 End;

 //*** Busca pelo Código do Produto ***

 If Not Encontrou_Codigo Then
    Begin
    ConexaoBD.SQL_Produtos.Close;
    ConexaoBD.SQL_Produtos.SQL.Clear;
    ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo = ' + Trim(Codigo));
    ConexaoBD.SQL_Produtos.Open;

    If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
       Begin
       Encontrou_Codigo := True;
    End;
 End;

 If Encontrou_Codigo Then
    Begin
    lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

    EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
    EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
    EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

    EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
    EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

    Carrega_Grupos('Produtos02');
    Carrega_Fornecedores('Produtos02');

    EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
    EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

    Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

    If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
       Begin
       EditUnidade.ItemIndex   := 0;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
       Begin
       EditUnidade.ItemIndex   := 1;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
       Begin
       EditUnidade.ItemIndex   := 2;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
       Begin
       EditUnidade.ItemIndex   := 3;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
       Begin
       EditUnidade.ItemIndex   := 4;
       End
    Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
       Begin
       EditUnidade.ItemIndex   := 5;
    End;

    EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
    EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
    EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
    EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
    EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
    CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;

    //*** Carrega a Tabela Nutricional ***
    EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
    EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
    EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
    EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
    EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
    EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
    EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
    EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

    EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
    EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
    EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
    EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
    EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
    EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
    EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
    EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
    End
  Else
    begin

    If Confirma('Produto NÃo cadastrado... Deseja incluir?')= 6 Then
       Begin

       Application.CreateForm(TProdutos01,Produtos01);

       Ampulheta();
       Produtos01.Cod_Fornecedores.Text    := Copy(Trim(Edit_Busca.Text),4,4);
       Produtos01.EditCod_Barra.Text       := Trim(Edit_Busca.Text);
       Seta();

       Produtos02.Visible := False;
       Produtos01.ShowModal;
       Produtos01.Destroy;
       Produtos02.Visible := True;

       //*** Busca o Produto ***

       Codigo := Trim(Edit_Busca.Text);

       Encontrou_Codigo := False;

       ConexaoBD.SQL_Produtos.Close;
       ConexaoBD.SQL_Produtos.SQL.Clear;
       ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra = "' + Trim(Codigo) + '"');
       ConexaoBD.SQL_Produtos.Open;

       If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
          Begin
          Encontrou_Codigo := True;
       End;
 
       //*** Busca pelo Código do Produto ***
 
       If Not Encontrou_Codigo Then
          Begin
          ConexaoBD.SQL_Produtos.Close;
          ConexaoBD.SQL_Produtos.SQL.Clear;
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo = ' + Trim(Codigo));
          ConexaoBD.SQL_Produtos.Open;

          If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
             Begin
             Encontrou_Codigo := True;
          End;
       End;
 
       If Encontrou_Codigo Then
          Begin
          lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;
 
          EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
          EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
          EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

          EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
          EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

          Carrega_Grupos('Produtos02');
          Carrega_Fornecedores('Produtos02');
 
          EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
          EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;
 
          Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
 
          If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
             Begin
             EditUnidade.ItemIndex   := 0;
             End
          Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
             Begin
             EditUnidade.ItemIndex   := 1;
             End
          Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
             Begin
             EditUnidade.ItemIndex   := 2;
             End
          Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
             Begin
             EditUnidade.ItemIndex   := 3;
             End
          Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
             Begin
             EditUnidade.ItemIndex   := 4;
             End
          Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
             Begin
             EditUnidade.ItemIndex   := 5;
          End;

          EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
          EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
          EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
          EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
          EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
          CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;

          //*** Carrega a Tabela Nutricional ***
          EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
          EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
          EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
          EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
          EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
          EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
          EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
          EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

          EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
          EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
          EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
          EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
          EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
          EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
          EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
          EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
       End;

    End;

  End;

  Edit_Busca.SetFocus;
end;

procedure TProdutos02.Edit_BuscaChange(Sender: TObject);
begin
     If (Length(Edit_Busca.Text)>12) Then
        Begin
        BitBtn3.SetFocus;
     End;
end;

procedure TProdutos02.BT_Incluir_GrupoClick(Sender: TObject);
begin
    Application.CreateForm(TGrupos01,Grupos01);
    Grupos01.ShowModal;
    Grupos01.Destroy;

    Carrega_Grupos('Produtos02');
end;

procedure TProdutos02.BT_Incluir_FornecedorClick(Sender: TObject);
begin
    Application.CreateForm(TFornecedores01,Fornecedores01);
    Fornecedores01.ShowModal;
    Fornecedores01.Destroy;

    Carrega_Fornecedores('Produtos02');
end;

procedure TProdutos02.EditMinimoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TProdutos02.CodProdFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditValorEnergeticoGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditValorEnergeticoPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditCarboidratosGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditCarboidratosPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditProteinasGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditProteinasPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasTotaisGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasTotaisPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasSaturadasGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasSaturadasPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasTransGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditGordurasTransPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditFibrasGKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditFibrasPKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditSodioGKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditSodioPKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos02.EditEtiquetasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TProdutos02.BT_ImprimirClick(Sender: TObject);
var
   Linha1, Linha2, Linha3, Linha4: String;
   Linha5, Linha6, Linha7, Linha8: String;
   Impressora: TextFile;
   Ind, Qtde: Integer;
   Lote, Validade, Fabricacao: String;
begin
    Ind  := 0;
    Qtde := 0;

    If ((Trim(EditEtiquetas.Text) <> '') and (Trim(EditPeso.Text) <> '')) Then
    Begin
       Qtde := StrToInt(EditEtiquetas.Text);
       {Linha1 := '99999-XXXXXXXXXXXXXXXXXXXX PESO: 999 G  LOTE: 0219';
       Linha2 := 'FORN: XXXXXXXXXXXXXXXXXXXX F: 02/2019   V: 08/2019';
       Linha3 := 'INFORMACOES NUTRICIONAIS (PORCAO 100G (TACO,2011))';
       Linha4 := 'VALOR ENERG: 99604 KCAL = 2537 KJ';
       Linha5 := 'CABOIDRATOS: 99999 MG | GORD.TRANS.: 99999 MG';
       Linha6 := 'PROTEINAS..: 99999 MG | FIBRA ALIM.: 99999 MG';
       Linha7 := 'GORD.TOTAIS: 99999 MG | SODIO......: 99999 MG';
       Linha8 := 'G.SATURADA.: 99999 MG |(*)%VD BASE DIETA 2000 kcal';}

       //*** Preparação da Etiqueta ***
       Lote       := FormatDateTime('mm',Date()) + FormatDateTime('yy',Date());
       Fabricacao := FormatDateTime('mm',Date()) + '/' + FormatDateTime('yy',Date());
       Validade   := FormatDateTime('mm',Date()+186) + '/' + FormatDateTime('yy',Date()+186);

       Linha1 := '       ' + Trim(EditCod_Barra.Text) + '-' + Trim(EditDescricao_Curta.Text) + ' | PESO: ' + Trim(EditPeso.Text) + ' | LOTE: ' + Lote;
       Linha2 := '       FORN: ' + Trim(Copy(CBFornecedor.Text, Pos('-',CBFornecedor.Text)+2, 20)) + ' | F: ' + Trim(Fabricacao) + ' V: ' + Trim(Validade);

       If Trim(EditValorEnergeticoG.Text) <> '' Then
       Begin
          Linha3 := '       INFORMACOES NUTRICIONAIS(PORCAO DE 10G)(QTDE-%VD):';
          Linha4 := '       VALOR ENERG: ' + Trim(EditValorEnergeticoG.Text) + '-' + Trim(EditValorEnergeticoP.Text);
          Linha5 := '       CABOIDRATOS: ' + Trim(EditCarboidratosG.Text) + '-' + Trim(EditCarboidratosP.Text) + ' | GORD.TRANS: ' + Trim(EditGordurasTransG.Text) + '-' + Trim(EditGordurasTransP.Text);
          Linha6 := '       PROTEINAS..: ' + Trim(EditProteinasG.Text) + '-' + Trim(EditProteinasP.Text) + ' | FIBRA ALIM: ' + Trim(EditFibrasG.Text) + '-' + Trim(EditFibrasP.Text);
          Linha7 := '       GORD.TOTAIS: ' + Trim(EditGordurasTotaisG.Text) + '-' + Trim(EditGordurasTotaisP.Text) + ' | SODIO: ' + Trim(EditSodioG.Text) + '-' + Trim(EditSodioP.Text);
          Linha8 := '       G.SATURADA.: ' + Trim(EditGordurasSaturadasG.Text) + '-' + Trim(EditGordurasSaturadasP.Text) + ' |(*)%VD BASE DIETA 2000 kcal';
       End
       Else
       Begin
          Linha3 := '';
          Linha4 := '';
          Linha5 := '';
          Linha6 := '';
          Linha7 := '';
          Linha8 := '';
       End;

       For Ind := 1 To Qtde Do
       Begin
           //*** Processo de Impressão ***
           AssignFile(Impressora,'LPT1');
           Rewrite(Impressora);
           Write(Impressora);
           Writeln(Impressora, #27 + Chr(15) + Linha1);
           Writeln(Impressora,Linha2);
           Writeln(Impressora,Linha3);
           Writeln(Impressora,Linha4);
           Writeln(Impressora,Linha5);
           Writeln(Impressora,Linha6);
           Writeln(Impressora,Linha7);
           Writeln(Impressora,Linha8);
           Writeln(Impressora,'');
           CloseFile(Impressora);
       End;
    End
    Else
    Begin
       MSG_Erro('Para imprimir a Etiqueta é necessário ter o Peso e a Quantidade desejada para impressão!');
    End;
end;

procedure TProdutos02.EditPesoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
