unit Produtos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TProdutos01 = class(TForm)
    Panel2: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    EditDescricao: TEdit;
    EditDescricao_Curta: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    EditCusto: TEdit;
    EditLucro: TEdit;
    EditPreco: TEdit;
    EditCod_Barra: TEdit;
    EditEstoque: TEdit;
    CBGrupo: TComboBox;
    CBFornecedor: TComboBox;
    Label1: TLabel;
    EditNCM: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Cod_Grupo: TEdit;
    Cod_Fornecedores: TEdit;
    EditUnidade: TComboBox;
    Label12: TLabel;
    Label15: TLabel;
    EditMinimo: TEdit;
    Label13: TLabel;
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
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
    procedure EditNCMKeyPress(Sender: TObject; var Key: Char);
    procedure EditCustoExit(Sender: TObject);
    procedure EditPrecoExit(Sender: TObject);
    procedure EditLucroExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Cod_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure Cod_FornecedoresKeyPress(Sender: TObject; var Key: Char);
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
  private
    { Private declarations }
    procedure Calcula_Lucro_Venda();
    procedure Calcula_Venda_Lucro();

  public
    { Public declarations }
  end;

var
  Produtos01: TProdutos01;

implementation

uses Rotinas_Gerais, Conexao_BD, Fornecedores_01, Grupos_01;

{$R *.dfm}

procedure TProdutos01.BT_SairClick(Sender: TObject);
begin
  Produtos01.Close;
end;

procedure TProdutos01.BT_IncluirClick(Sender: TObject);
Var
  ComandoSQL: String;
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

        ConexaoBD.SQL_Produtos.Close;
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where Produto_Cod_Barra ="' + Trim(EditCod_Barra.Text) + '"');
        ConexaoBD.SQL_Produtos.Open;

        If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
          Begin
            MSG_Erro('Este Código de Barras já está sendo utilizado ');
            EditCod_Barra.SetFocus;
          End
        Else
          Begin

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
          ComandoSQL := ComandoSQL + 'Produto_Custo           ,';
          ComandoSQL := ComandoSQL + 'Produto_Margem_Lucro    ,';
          ComandoSQL := ComandoSQL + 'Produto_Preco_Varejo    ,';
          ComandoSQL := ComandoSQL + 'Produto_Estoque_Minimo  ,';
          ComandoSQL := ComandoSQL + 'Produto_Pedido_Codigo_Fornecedor,';

          ComandoSQL := ComandoSQL + 'Produto_TN_Valor_Energetico_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Carboidratos_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Proteinas_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Totais_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Sat_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Trans_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Fibras_C1, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Sodio_C1, ';

          ComandoSQL := ComandoSQL + 'Produto_TN_Valor_Energetico_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Carboidratos_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Proteinas_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Totais_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Sat_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Gorduras_Trans_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Fibras_C2, ';
          ComandoSQL := ComandoSQL + 'Produto_TN_Sodio_C2) ';

          ComandoSQL := ComandoSQL + 'Values(';
          ComandoSQL := ComandoSQL + #39 + Trim(EditDescricao.Text)                 + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditDescricao_Curta.Text)           + #39 + ',' ;
          ComandoSQL := ComandoSQL +       Obtem_Nro_Antes_Traco(CBGrupo.Text)      +       ',';
          ComandoSQL := ComandoSQL +       Obtem_Nro_Antes_Traco(CBFornecedor.Text) +       ',';
          ComandoSQL := ComandoSQL + #39 + Obtem_Depois_Traco(CBFornecedor.Text)    + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditCod_Barra.Text)                 + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditNCM.Text)                       + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditUnidade.Text)                   + #39 + ',';
          ComandoSQL := ComandoSQL +       Trim(EditEstoque.Text)                   +       ',';
          ComandoSQL := ComandoSQL + #39 + Virgula_Ponto(Trim(EditCusto.Text))      + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Virgula_Ponto(Trim(EditLucro.Text))      + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Virgula_Ponto(Trim(EditPreco.Text))      + #39 + ',';
          ComandoSQL := ComandoSQL +       Trim(EditMinimo.Text)                    +       ',';
          ComandoSQL := ComandoSQL + #39 + Trim(CodProdFornecedor.Text)             + #39 + ',';

          ComandoSQL := ComandoSQL + #39 + Trim(EditValorEnergeticoG.Text)   + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditCarboidratosG.Text)      + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditProteinasG.Text)         + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasTotaisG.Text)    + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasSaturadasG.Text) + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasTransG.Text)     + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditFibrasG.Text)            + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditSodioG.Text)             + #39 + ',';

          ComandoSQL := ComandoSQL + #39 + Trim(EditValorEnergeticoP.Text)   + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditCarboidratosP.Text)      + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditProteinasP.Text)         + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasTotaisP.Text)    + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasSaturadasP.Text) + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditGordurasTransP.Text)     + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditFibrasP.Text)            + #39 + ',';
          ComandoSQL := ComandoSQL + #39 + Trim(EditSodioP.Text)             + #39 + ')';

          ConexaoBD.SQL_Comunitario.Close;
          ConexaoBD.SQL_Comunitario.SQL.Clear;
          ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
          ConexaoBD.SQL_Comunitario.ExecSQL;

          MSG_Erro('Inclusão efetuada com sucesso...');

          If Confirma('Deseja incluir outro Produto?')=6 Then
            Begin
            EditDescricao.Text        := '';
            EditDescricao_Curta.Text  := '';
            //CBGrupo.ItemIndex         := 0;
            //CBFornecedor.ItemIndex    := 0;
            EditCod_Barra.Text        := '';
            EditNCM.Text              := '';
            EditUnidade.Text          := '';
            EditEstoque.Text          := '';
            EditCusto.Text            := '';
            EditLucro.Text            := '';
            EditPreco.Text            := '';
            EditMinimo.Text           := '';

            EditValorEnergeticoG.Text   := '';
            EditCarboidratosG.Text      := '';
            EditProteinasG.Text         := '';
            EditGordurasTotaisG.Text    := '';
            EditGordurasSaturadasG.Text := '';
            EditGordurasTransG.Text     := '';
            EditFibrasG.Text            := '';
            EditSodioG.Text             := '';

            EditValorEnergeticoP.Text   := '';
            EditCarboidratosP.Text      := '';
            EditProteinasP.Text         := '';
            EditGordurasTotaisP.Text    := '';
            EditGordurasSaturadasP.Text := '';
            EditGordurasTransP.Text     := '';
            EditFibrasP.Text            := '';
            EditSodioP.Text             := '';

            EditDescricao.SetFocus;
            End
          Else
            Begin
            Produtos01.Close;
          End;

        End;
    End;

  Seta();

end;

procedure TProdutos01.EditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditDescricao_CurtaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.CBGrupoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.CBFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditCod_BarraKeyPress(Sender: TObject;
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

procedure TProdutos01.EditUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditEstoqueKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.EditCustoKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.EditLucroKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.EditPrecoKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.FormShow(Sender: TObject);
begin
      Carrega_Grupos('Produtos01');
      Carrega_Fornecedores('Produtos01');
      EditDescricao.SetFocus;
end;

procedure TProdutos01.EditNCMKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.Calcula_Venda_Lucro();

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

procedure TProdutos01.Calcula_Lucro_Venda();

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

procedure TProdutos01.EditCustoExit(Sender: TObject);
begin
     Calcula_Venda_Lucro();
end;

procedure TProdutos01.EditPrecoExit(Sender: TObject);
begin
     Calcula_Lucro_Venda();
end;

procedure TProdutos01.EditLucroExit(Sender: TObject);
begin
     Calcula_Venda_Lucro();
end;

procedure TProdutos01.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TGrupos01,Grupos01);
    Grupos01.ShowModal;
    Grupos01.Destroy;

    Carrega_Grupos('Produtos01');
end;

procedure TProdutos01.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFornecedores01,Fornecedores01);
    Fornecedores01.ShowModal;
    Fornecedores01.Destroy;

    Carrega_Fornecedores('Produtos01');
end;

procedure TProdutos01.Cod_GrupoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Procura_Grupos('Produtos01',Cod_Grupo.Text);

      if (CBGrupo.ItemIndex > 0) or (Trim(Cod_Grupo.Text) = '') Then Perform(WM_NEXTDLGCTL, 0, 0)
      Else Cod_Grupo.SelectAll;
    End;
end;

procedure TProdutos01.Cod_FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Procura_Fornecedores('Produtos01',Cod_Fornecedores.Text);

      if (CBFornecedor.ItemIndex > 0) or (Trim(Cod_Fornecedores.Text) = '') Then Perform(WM_NEXTDLGCTL, 0, 0)
      Else Cod_Fornecedores.SelectAll;
    End;
end;

procedure TProdutos01.EditMinimoKeyPress(Sender: TObject; var Key: Char);
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

procedure TProdutos01.CodProdFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditValorEnergeticoGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditValorEnergeticoPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditCarboidratosGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditCarboidratosPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditProteinasGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditProteinasPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasTotaisGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasTotaisPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasSaturadasGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasSaturadasPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasTransGKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditGordurasTransPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditFibrasGKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditFibrasPKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditSodioGKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos01.EditSodioPKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
