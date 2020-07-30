unit Rel_Fornecedor_Ultima_Venda_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRelFornecedorUltimaVenda00 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Fornecedores: TComboBox;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    GroupBox2: TGroupBox;
    Opcao_Data: TRadioButton;
    Opcao_Fornecedor: TRadioButton;
    GroupBox3: TGroupBox;
    LBL_Registro: TLabel;
    Label2: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Label3: TLabel;
    Rel_Periodo_Final: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure FornecedoresKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFornecedorUltimaVenda00: TRelFornecedorUltimaVenda00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Fornecedor_Ultima_Venda_01, Login_00;

{$R *.dfm}

procedure TRelFornecedorUltimaVenda00.FormShow(Sender: TObject);
begin
    //*** Carrega os Fornecedores ***
    
    ConexaoBD.SQL_Fornecedores.Close;
    ConexaoBD.SQL_Fornecedores.SQL.Clear;
    ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Numero');
    ConexaoBD.SQL_Fornecedores.Open;

    Fornecedores.Items.Add('--- Todas os Fornecedores ---');

    While Not ConexaoBD.SQL_Fornecedores.Eof Do
      Begin
        Fornecedores.Items.Add( ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text + ' - ' + ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text );
        ConexaoBD.SQL_Fornecedores.Next;
    End;
    Fornecedores.ItemIndex  := 0;

    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text   := DateToStr(Date());
end;

procedure TRelFornecedorUltimaVenda00.BT_SairClick(Sender: TObject);
begin
     RelFornecedorUltimaVenda00.Close;
end;

procedure TRelFornecedorUltimaVenda00.BT_ImprimirClick(Sender: TObject);

var
   Cod_Fornecedor, Comando_SQL: String;
   DT_Arquivo, Data_Movto_Inicio, Data_Movto_Final, Caminho, Caminho_Resultado, DT_Processada: String;

begin
     Ampulheta();

     BT_Imprimir.Enabled := False;
     BT_Sair.Enabled     := False;

     LBL_Registro.Caption := 'Aguarde... Obtendo Dados...';
     LBL_Registro.Refresh;

     //*** Prepara a Junção dos Arquivos ***

     //*** Conexao Principal ***

     Caminho_Resultado := Trim(Login00.PdvTex_Caminho.Text);
     Caminho_Resultado := Copy(Caminho_Resultado,0,(Length(Caminho_Resultado) - 3));
     Caminho_Resultado := Trim(Caminho_Resultado);

     //*** Carrega Cabeca Cupons ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Cabeca_Cupons_Movto');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     //*** Carrega Corpo Cupons ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Corpo_Cupons_Movto');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     //*** Carrega Registro Caixa ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Registro_Caixa_Movto');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     //*** Prepara a Junção do BD ***

     Data_Movto_Inicio := Rel_Periodo_Inicial.Text;
     Data_Movto_Final  := Rel_Periodo_Final.Text;
     DT_Processada     := ''; 

     LBL_Registro.Caption := 'Preparando Junção de Dados...';
     LBL_Registro.Refresh;

    //*** Carrega Cabeca Cupons ***

    ConexaoBD.SQL_Cabeca_Cupons.Close;
    ConexaoBD.SQL_Cabeca_Cupons.SQL.Clear;
    ConexaoBD.SQL_Cabeca_Cupons.SQL.Add('Select * From Cabeca_Cupons Where (Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Cabeca_Cupons.Open;

    LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.Text);
    LBL_Registro.Refresh;

    If Not ConexaoBD.SQL_Cabeca_Cupons.Eof Then
       Begin

       ConexaoBD.SQL_Cabeca_Cupons.First;

       While Not ConexaoBD.SQL_Cabeca_Cupons.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.Text);
             LBL_Registro.Refresh;

             Comando_SQL  := 'Insert into Cabeca_Cupons_Movto(';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Numero, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Maquina, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Status, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Forma_Pgto, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Vlr_Total, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Vlr_Pago, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Vlr_Troco, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Qtd_Itens, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Data_Emissao, ';
             Comando_SQL  := Comando_SQL + 'Cabeca_Cupom_Hora_Emissao) ';
             Comando_SQL  := Comando_SQL + 'Values(';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Maquina.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Status.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Forma_Pgto.Text) +  '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Total.Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Pago.Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Troco.Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Qtd_Itens.Text) + '", ';
             Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Data_Emissao.Text),'amd','-') +#39+ ', ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Hora_Emissao.Text) + '")';

             ConexaoBD.SQL_Comunitario_Secundario.Close;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

             ConexaoBD.SQL_Cabeca_Cupons.Next;
       End;

    End;

    //*** Carrega Corpo Cupons ***

    Comando_SQL := 'Select Cor.* From Corpo_Cupons Cor, Cabeca_Cupons Cab Where (Cor.Corpo_Cupom_Cabeca = Cab.Cabeca_Cupom_Numero) and (Cab.Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cab.Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')';

    ConexaoBD.SQL_Corpo_Cupons.Close;
    ConexaoBD.SQL_Corpo_Cupons.SQL.Clear;
    ConexaoBD.SQL_Corpo_Cupons.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Corpo_Cupons.Open;

    LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Codigo.Text);
    LBL_Registro.Refresh;

    If Not ConexaoBD.SQL_Corpo_Cupons.Eof Then
       Begin

       ConexaoBD.SQL_Corpo_Cupons.First;

       While Not ConexaoBD.SQL_Corpo_Cupons.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Codigo.Text);
             LBL_Registro.Refresh;

             Comando_SQL  := 'Insert into Corpo_Cupons_Movto(';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Cabeca, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Maquina, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Codigo, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc_Curta, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Qtde, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Vlr_Unitario, ';
             Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Vlr_Total) ';
             Comando_SQL  := Comando_SQL + 'Values(';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Cabeca.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Maquina.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Codigo.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Desc.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Desc_Curta.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Qtde.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Vlr_Unitario.Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Vlr_Total.Text)) + '") ';

             ConexaoBD.SQL_Comunitario_Secundario.Close;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

             ConexaoBD.SQL_Corpo_Cupons.Next;
       End;

    End;

    //*** Carrega Registro Caixa ***

    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * From Registro_Caixa Where (Registro_Caixa_Data >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Registro_Caixa_Data <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Registro_Caixa.Open;

    LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text);
    LBL_Registro.Refresh;

    If Not ConexaoBD.SQL_Registro_Caixa.Eof Then
       Begin

       ConexaoBD.SQL_Registro_Caixa.First;

       While Not ConexaoBD.SQL_Registro_Caixa.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text);
             LBL_Registro.Refresh;

             Comando_SQL  := 'Insert into Registro_Caixa_Movto(';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Data, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Hora, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Operacao, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Maquina, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Pedido, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Usuario, ';
             Comando_SQL  := Comando_SQL + 'Registro_Caixa_Valor) ';
             Comando_SQL  := Comando_SQL + 'Values(';
             Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Data.Text),'amd','-') + #39+ ', ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Maquina.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Pedido.Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Usuario.Text) + '", ';

             If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.Text) <> '' Then
                Begin
                Comando_SQL := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.Text)) + '")';
                End
             Else
                Begin
                Comando_SQL := Comando_SQL + '"0.00")';
             End;

             ConexaoBD.SQL_Comunitario_Secundario.Close;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

             ConexaoBD.SQL_Registro_Caixa.Next;
       End;

    End;

     //*** Prepara o Relatório ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Rel_Fornecedor');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     //*** Carrega os Produtos ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Produtos_Vazio');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     ConexaoBD.SQL_Produtos.Close;
     ConexaoBD.SQL_Produtos.SQL.Clear;
     ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By Produto_Codigo');
     ConexaoBD.SQL_Produtos.Open;

     LBL_Registro.Caption := 'Carregando os Produtos...';
     LBL_Registro.Refresh;

     If Not ConexaoBD.SQL_Produtos.Eof Then
        Begin

        ConexaoBD.SQL_Produtos.First;

        While Not ConexaoBD.SQL_Produtos.Eof Do
              Begin

              LBL_Registro.Caption := Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text);
              LBL_Registro.Refresh;

              Comando_SQL  := 'Insert into Produtos_Vazio(';
              Comando_SQL  := Comando_SQL + 'Produto_Codigo, ';
              Comando_SQL  := Comando_SQL + 'Produto_Fornecedor_Cod) ';
              Comando_SQL  := Comando_SQL + 'Values('+Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text) + ', ';
              Comando_SQL  := Comando_SQL + Trim(ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text) + ') ';

              ConexaoBD.SQL_Comunitario_Secundario.Close;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

              ConexaoBD.SQL_Produtos.Next;
        End;

     End;

     //*** Carrega os Fornecedores ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Fornecedores_Vazio');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Numero');
     ConexaoBD.SQL_Fornecedores.Open;

     LBL_Registro.Caption := 'Carregando os Fornecedores...';
     LBL_Registro.Refresh;

     If Not ConexaoBD.SQL_Fornecedores.Eof Then
        Begin

        ConexaoBD.SQL_Fornecedores.First;

        While Not ConexaoBD.SQL_Fornecedores.Eof Do
              Begin

              LBL_Registro.Caption := Trim(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text) + ' - ' + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text);
              LBL_Registro.Refresh;

              Comando_SQL  := 'Insert into Fornecedores_Vazio(';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Numero, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_CNPJ, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_IE, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Razao_Social, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Nome_Fantasia, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Ramo_Atividade, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Endereco, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Complemento, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Bairro, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Cidade, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Estado, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_CEP, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Fone_Comercial, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Fone_Celular, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Fone_Fax, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Contato, ';
              Comando_SQL  := Comando_SQL + 'Fornecedor_Email) ';
              Comando_SQL  := Comando_SQL + 'Values('+Trim(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text) + ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_IE.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_CEP.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text) +#39+ ', ';
              Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_FornecedoresFornecedor_Email.Text) +#39+ ')';

              ConexaoBD.SQL_Comunitario_Secundario.Close;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

              ConexaoBD.SQL_Fornecedores.Next;
        End;

     End;

     //*** Prepara o Relatório ***

     If Trim(Fornecedores.Text) <> '--- Todas os Fornecedores ---' Then
        Begin
        Cod_Fornecedor := Obtem_Nro_Antes_Traco(Fornecedores.Text);

        ConexaoBD.SQL_Fornecedores_Vazio.Close;
        ConexaoBD.SQL_Fornecedores_Vazio.SQL.Clear;
        ConexaoBD.SQL_Fornecedores_Vazio.SQL.Add('Select * From Fornecedores_Vazio Where Fornecedor_Numero = ' + Trim(Cod_Fornecedor) + ' Order By Fornecedor_Numero');
        ConexaoBD.SQL_Fornecedores_Vazio.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_Fornecedores_Vazio.Close;
        ConexaoBD.SQL_Fornecedores_Vazio.SQL.Clear;
        ConexaoBD.SQL_Fornecedores_Vazio.SQL.Add('Select * From Fornecedores_Vazio Order By Fornecedor_Numero');
        ConexaoBD.SQL_Fornecedores_Vazio.Open;
     End;

     If Not ConexaoBD.SQL_Fornecedores_Vazio.Eof Then
        Begin

        If ConexaoBD.SQL_Fornecedores_Vazio.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_Fornecedores_Vazio.First;

           While Not ConexaoBD.SQL_Fornecedores_Vazio.Eof Do
                 Begin

                 LBL_Registro.Caption := Trim(ConexaoBD.SQL_Fornecedores_VazioFornecedor_Numero.Text) + ' - ' + Trim(ConexaoBD.SQL_Fornecedores_VazioFornecedor_Nome_Fantasia.Text);
                 LBL_Registro.Refresh;

                 Cod_Fornecedor := ConexaoBD.SQL_Fornecedores_VazioFornecedor_Numero.Text;

                 Comando_SQL := 'select * from Fornecedores_Vazio, Produtos_Vazio,  Corpo_Cupons_Movto, Cabeca_Cupons_Movto ';
                 Comando_SQL := Comando_SQL + 'Where ';
                 Comando_SQL := Comando_SQL + '(Fornecedor_Numero = Produto_Fornecedor_Cod) And ';
                 Comando_SQL := Comando_SQL + '(Produto_Codigo = Corpo_Cupom_Prod_Codigo) And ';
                 Comando_SQL := Comando_SQL + '(Corpo_Cupom_Cabeca = Cabeca_Cupom_Numero) And ';
                 Comando_SQL := Comando_SQL + '(Fornecedor_Numero = ' + Trim(Cod_Fornecedor) + ') Order By Cabeca_Cupom_Data_Emissao Desc';

                 ConexaoBD.SQL_Fornecedor_Ultima_Venda.Close;
                 ConexaoBD.SQL_Fornecedor_Ultima_Venda.SQL.Clear;
                 ConexaoBD.SQL_Fornecedor_Ultima_Venda.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Fornecedor_Ultima_Venda.Open;

                 If Not ConexaoBD.SQL_Fornecedor_Ultima_Venda.Eof Then
                    Begin
                    If ConexaoBD.SQL_Fornecedor_Ultima_Venda.RecordCount > 0 Then
                       Begin
                       ConexaoBD.SQL_Fornecedor_Ultima_Venda.First;

                       Comando_SQL  := 'Insert into Rel_Fornecedor(';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Numero, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_CNPJ, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Razao_Social, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Nome_Fantasia, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Fone_Comercial, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Fone_Celular, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Fone_FAX, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Contato, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_EMail, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Ultima_Venda, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Produto_Codigo, ';
                       Comando_SQL  := Comando_SQL + 'Rel_Fornecedor_Produto_Descricao) ';
                       Comando_SQL  := Comando_SQL + 'Values('+ Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Numero.Text) + ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_CNPJ.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Razao_Social.Text) + #39 + ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Nome_Fantasia.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Comercial.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Celular.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Fone_Fax.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Contato.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaFornecedor_Email.Text) +#39+ ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaCabeca_Cupom_Data_Emissao.Text) + #39+ ', ';
                       Comando_SQL  := Comando_SQL + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaProduto_Codigo.Text) + ', ';
                       Comando_SQL  := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Fornecedor_Ultima_VendaProduto_Descricao.Text) + #39 + ')';

                       ConexaoBD.SQL_Comunitario_Secundario.Close;
                       ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
                       ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
                       ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;
                    End;
                 End;

                 ConexaoBD.SQL_Fornecedores_Vazio.Next;

           End;
        End;
     End;

     LBL_Registro.Caption := 'Aguarde... Gerando Relatório...';
     LBL_Registro.Refresh;

     If Opcao_Data.Checked = True Then
        Begin
        ConexaoBD.SQL_Rel_Fornecedor.Close;
        ConexaoBD.SQL_Rel_Fornecedor.SQL.Clear;
        ConexaoBD.SQL_Rel_Fornecedor.SQL.Add('Select * From Rel_Fornecedor Order By Rel_Fornecedor_Ultima_Venda Desc, Rel_Fornecedor_Numero');
        ConexaoBD.SQL_Rel_Fornecedor.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_Rel_Fornecedor.Close;
        ConexaoBD.SQL_Rel_Fornecedor.SQL.Clear;
        ConexaoBD.SQL_Rel_Fornecedor.SQL.Add('Select * From Rel_Fornecedor Order By Rel_Fornecedor_Numero');
        ConexaoBD.SQL_Rel_Fornecedor.Open;
     End;

     LBL_Registro.Caption := 'Processo Finalizado...';
     LBL_Registro.Refresh;

     Seta();

     If Not ConexaoBD.SQL_Rel_Fornecedor.Eof Then
        Begin
        If ConexaoBD.SQL_Rel_Fornecedor.RecordCount > 0 Then
           Begin

           Application.CreateForm(TRelFornecedorUltimaVenda01,RelFornecedorUltimaVenda01);
           RelFornecedorUltimaVenda01.QR_Fornecedor.PreviewModal;
           RelFornecedorUltimaVenda01.QR_Fornecedor.Destroy;
           RelFornecedorUltimaVenda01.Destroy;

           End
        Else
           Begin
           MSG_Erro('Nenhum Informação foi Encontrada...');
        End;
        End
     Else
        Begin
        MSG_Erro('Nenhum Informação foi Encontrada...');
     End;

     BT_Imprimir.Enabled := True;
     BT_Sair.Enabled     := True;

end;

procedure TRelFornecedorUltimaVenda00.Rel_Periodo_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelFornecedorUltimaVenda00.Rel_Periodo_FinalKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelFornecedorUltimaVenda00.FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
