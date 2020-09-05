unit Rel_Lucratividade_D00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRelLucratividadeD00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    Maquinas: TComboBox;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Label4: TLabel;
    CB_Ordenar: TComboBox;
    GroupBox2: TGroupBox;
    Opcao_Sem_Grupo: TRadioButton;
    Opcao_Grupo: TRadioButton;
    GroupBox3: TGroupBox;
    LBL_Registro: TLabel;
    Label5: TLabel;
    Cod_Produto: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    cb_grupos: TComboBox;
    Label8: TLabel;
    lblNotas: TLabel;
    Panel1: TPanel;
    lblProgramadas: TLabel;
    BT_Atualizar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure CB_OrdenarKeyPress(Sender: TObject; var Key: Char);
    procedure Opcao_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure Opcao_Sem_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelLucratividadeD00: TRelLucratividadeD00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Lucratividade_D01,
  Rel_Lucratividade_D02, Rel_Lucratividade_D03, Login_00;

{$R *.dfm}

procedure TRelLucratividadeD00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Abre a Conexão com o BD ***
    ConexaoBD.Conexao_ManagerTEX.Connected := True;

    //*** Carrega Máquinas ***
    Maquinas.Items.Add('--- Todas as Máquinas ---');
    Maquinas.ItemIndex  := 0;

    //*** Carrega Grupos ***
    ConexaoBD.SQL_GruposD.Close;
    ConexaoBD.SQL_GruposD.SQL.Clear;
    ConexaoBD.SQL_GruposD.SQL.Add('Select * From mgt_familias_produtos Order By mgt_familia_produto_descricao');
    ConexaoBD.SQL_GruposD.Open;

    cb_grupos.Items.Add('--- Todos os Grupos ---');

    While Not ConexaoBD.SQL_GruposD.Eof Do
      Begin
        cb_grupos.Items.Add(ConexaoBD.SQL_GruposD.FieldByName('mgt_familia_produto_codigo').Text + ' - ' + ConexaoBD.SQL_GruposD.FieldByName('mgt_familia_produto_descricao').Text);
        ConexaoBD.SQL_GruposD.Next;
    End;
    cb_grupos.ItemIndex  := 0;

    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text   := DateToStr(Date());

    Seta();
end;

procedure TRelLucratividadeD00.BT_SairClick(Sender: TObject);
begin
     //*** Fecha a Conexão com o BD ***
     ConexaoBD.Conexao_ManagerTEX.Connected := False;
     ConexaoBD.Conexao_ManagerTEX.Close;

     RelLucratividadeD00.Close;
end;

procedure TRelLucratividadeD00.BT_ImprimirClick(Sender: TObject);

var
    Comando_SQL: String;
    Caixa_Data_Ini, Caixa_Data_Fim, Caixa_Maquina, Codigo_Grupo, Codigo_Produto, Descricao_Produto, Grupo_Produto, Grupo_Descricao: String;
    Qtde_Produto, Erro, Ind: Integer;
    Ultimo_Custo, Preco_Medio, Total_Faturado, Custo_Total, Lucro_Bruto, Margem, Vlr_Numero: Real;
    Vlr_Exibicao, Str_Preco_Medio, Str_Total_Faturado, Str_Ultimo_Custo, Str_Custo_Tota, Str_Lucro_Bruto, Str_Margem, Str_Custo_Total: String;

    Soma_Qtde: Integer;
    Soma_Preco_Venda, Soma_Total_Faturado, Soma_Ultimo_Custo, Soma_Custo_Total, Soma_Lucro_Bruto, Soma_Margem_Lucro: Real;

    Soma_Qtde_Total: Integer;
    Soma_Preco_Venda_Total, Soma_Total_Faturado_Total, Soma_Ultimo_Custo_Total, Soma_Custo_Total_Total, Soma_Lucro_Bruto_Total, Soma_Margem_Lucro_Total: Real;

    DT_Arquivo, Data_Movto_Inicio, Data_Movto_Final, Caminho, Caminho_Resultado, DT_Processada: String;
    Conta_Nota, Conta_Programada: Integer;

begin
    Ampulheta();

    LBL_Registro.Caption := 'Aguarde... Obtendo Dados...';
    LBL_Registro.Refresh;

    BT_Imprimir.Enabled := False;
    BT_Sair.Enabled     := False;

    //*** Prepara o Cálculo dos Valores ***

    //*** Conexao Principal ***

    Caminho_Resultado := Trim(Login00.PdvTex_Caminho.Text);
    Caminho_Resultado := Copy(Caminho_Resultado,0,(Length(Caminho_Resultado) - 3));
    Caminho_Resultado := Trim(Caminho_Resultado);

    //*** Carrega Cabeca Cupons ***

    ConexaoBD.SQL_Comunitario_SecundarioD.Close;
    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('Truncate Cabeca_Cupons_Movto');
    ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

    //*** Carrega Corpo Cupons ***

    ConexaoBD.SQL_Comunitario_SecundarioD.Close;
    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('Truncate Corpo_Cupons_Movto');
    ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

    //*** Prepara a Junção do BD ***

    Data_Movto_Inicio := Rel_Periodo_Inicial.Text;
    Data_Movto_Final  := Rel_Periodo_Final.Text;
    DT_Processada     := '';

    LBL_Registro.Caption := 'Preparando Junção de Dados...';
    LBL_Registro.Refresh;

    //*** Notas Fiscais ***
    //*** Carrega Cabeca Cupons ***

    ConexaoBD.SQL_Cabeca_CuponsD.Close;
    ConexaoBD.SQL_Cabeca_CuponsD.SQL.Clear;
    ConexaoBD.SQL_Cabeca_CuponsD.SQL.Add('Select * From mgt_notas_fiscais Where (mgt_nota_fiscal_cfop = 0000 OR mgt_nota_fiscal_cfop = 5102 OR mgt_nota_fiscal_cfop = 6102) AND (mgt_nota_fiscal_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (mgt_nota_fiscal_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Cabeca_CuponsD.Open;

    LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text);
    LBL_Registro.Refresh;
    lblNotas.Caption := 'Notas: 0';
    Conta_Nota := 0;

    If Not ConexaoBD.SQL_Cabeca_CuponsD.Eof Then
       Begin

       ConexaoBD.SQL_Cabeca_CuponsD.First;

       While Not ConexaoBD.SQL_Cabeca_CuponsD.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text);
             LBL_Registro.Refresh;

             Conta_Nota := Conta_Nota + 1;

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
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('0') + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('Fechado') + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('D') +  '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_valor_total').Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_valor_total').Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim('0')) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('1') + '", ';
             Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_data_emissao').Text),'amd','-') +#39+ ', ';
             Comando_SQL  := Comando_SQL + '"' + Trim('00:00:00') + '")';

             ConexaoBD.SQL_Comunitario_SecundarioD.Close;
             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

             //*** Localiza os Produtos dos Cupons ***

             //*** Carrega Corpo Cupons ***

             If (Obtem_Nro_Antes_Traco(cb_grupos.Text) <> '') Then
                Begin

                Comando_SQL :='select c_c.* from mgt_notas_fiscais_produtos c_c, mgt_produtos pro where (c_c.mgt_nota_fiscal_produto_numero_nota ='+#39+Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text)+#39+') and (c_c.mgt_nota_fiscal_produto_codigo = pro.mgt_produto_codigo) and (pro.mgt_produto_familia = '+#39+ Obtem_Nro_Antes_Traco(cb_grupos.Text)+#39+')';

                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Corpo_CuponsD.Open;
                End
             Else If (Trim(Cod_Produto.Text) = '') Then
                Begin
                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add('Select * From mgt_notas_fiscais_produtos Where mgt_nota_fiscal_produto_numero_nota = ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text) );
                ConexaoBD.SQL_Corpo_CuponsD.Open;
                End
             Else
                Begin
                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add('Select * From mgt_notas_fiscais_produtos Where mgt_nota_fiscal_produto_codigo = ' + Trim(Cod_Produto.Text) + ' And mgt_nota_fiscal_produto_numero_nota = ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_numero').Text) );
                ConexaoBD.SQL_Corpo_CuponsD.Open;
             End;

             LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_codigo').Text);
             LBL_Registro.Refresh;

             If Not ConexaoBD.SQL_Corpo_CuponsD.Eof Then
                Begin

                ConexaoBD.SQL_Corpo_CuponsD.First;

                While Not ConexaoBD.SQL_Corpo_CuponsD.Eof Do
                    Begin

                    LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_codigo').Text);
                    LBL_Registro.Refresh;

                    Comando_SQL  := 'Insert into Corpo_Cupons_Movto(';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Cabeca, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Maquina, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Codigo, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc_Curta, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Qtde, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Vlr_Unitario, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Vlr_Total, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Data_Emissao, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Hora_Emissao, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Status) ';
                    Comando_SQL  := Comando_SQL + 'Values(';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_numero_nota').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim('0') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_codigo').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Retira_Caracter(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_descricao').Text),'`') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Retira_Caracter(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_descricao').Text),'`') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_quantidade').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_valor_unitario').Text)) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_nota_fiscal_produto_valor_total').Text)) + '", ';
                    Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_nota_fiscal_data_emissao').Text),'amd','-') +#39+ ', ';
                    Comando_SQL  := Comando_SQL + '"' + Trim('00:00:00') + '",';
                    Comando_SQL  := Comando_SQL + '"' + Trim('Fechado') + '") ';

                    ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                    ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                    ConexaoBD.SQL_Corpo_CuponsD.Next;
                End;

             End;

             ConexaoBD.SQL_Cabeca_CuponsD.Next;
       End;

    End;

    lblNotas.Caption := 'Notas: ' + IntToStr(Conta_Nota);

    //*** Vendas Programadas ***
    //*** Carrega Cabeca Cupons ***

    ConexaoBD.SQL_Cabeca_CuponsD.Close;
    ConexaoBD.SQL_Cabeca_CuponsD.SQL.Clear;
    ConexaoBD.SQL_Cabeca_CuponsD.SQL.Add('Select * From mgt_programadas Where (mgt_programada_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (mgt_programada_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Cabeca_CuponsD.Open;

    LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text);
    LBL_Registro.Refresh;
    lblProgramadas.Caption := 'Programadas: 0';
    Conta_Programada := 0;

    If Not ConexaoBD.SQL_Cabeca_CuponsD.Eof Then
       Begin

       ConexaoBD.SQL_Cabeca_CuponsD.First;

       While Not ConexaoBD.SQL_Cabeca_CuponsD.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Cupom - Nro.: ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text);
             LBL_Registro.Refresh;

             Conta_Programada := Conta_Programada + 1;

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
             Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('0') + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('Fechado') + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('D') +  '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_valor_total').Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_valor_total').Text)) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim('0')) + '", ';
             Comando_SQL  := Comando_SQL + '"' + Trim('1') + '", ';
             Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_data_emissao').Text),'amd','-') +#39+ ', ';
             Comando_SQL  := Comando_SQL + '"' + Trim('00:00:00') + '")';

             ConexaoBD.SQL_Comunitario_SecundarioD.Close;
             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

             //*** Localiza os Produtos dos Cupons ***

             //*** Carrega Corpo Cupons ***

             If (Obtem_Nro_Antes_Traco(cb_grupos.Text) <> '') Then
                Begin

                Comando_SQL :='select c_c.* from mgt_programadas_produtos c_c, mgt_produtos pro where (c_c.mgt_programada_produto_numero_nota ='+#39+Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text)+#39+') and (c_c.mgt_programada_produto_codigo = pro.mgt_produto_codigo) and (pro.mgt_produto_familia = '+#39+ Obtem_Nro_Antes_Traco(cb_grupos.Text)+#39+')';

                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Corpo_CuponsD.Open;
                End
             Else If (Trim(Cod_Produto.Text) = '') Then
                Begin
                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add('Select * From mgt_programadas_produtos Where mgt_programada_produto_numero_nota = ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text) );
                ConexaoBD.SQL_Corpo_CuponsD.Open;
                End
             Else
                Begin
                ConexaoBD.SQL_Corpo_CuponsD.Close;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Clear;
                ConexaoBD.SQL_Corpo_CuponsD.SQL.Add('Select * From mgt_programadas_produtos Where mgt_programada_produto_codigo = ' + Trim(Cod_Produto.Text) + ' And mgt_programada_produto_numero_nota = ' + Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_numero').Text) );
                ConexaoBD.SQL_Corpo_CuponsD.Open;
             End;

             LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_codigo').Text);
             LBL_Registro.Refresh;

             If Not ConexaoBD.SQL_Corpo_CuponsD.Eof Then
                Begin

                ConexaoBD.SQL_Corpo_CuponsD.First;

                While Not ConexaoBD.SQL_Corpo_CuponsD.Eof Do
                    Begin

                    LBL_Registro.Caption := 'Junção: Atual - Corpo - Nro.: ' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_codigo').Text);
                    LBL_Registro.Refresh;

                    Comando_SQL  := 'Insert into Corpo_Cupons_Movto(';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Cabeca, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Maquina, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Codigo, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Desc_Curta, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Qtde, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Prod_Vlr_Unitario, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Vlr_Total, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Data_Emissao, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Hora_Emissao, ';
                    Comando_SQL  := Comando_SQL + 'Corpo_Cupom_Status) ';
                    Comando_SQL  := Comando_SQL + 'Values(';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_numero_nota').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim('0') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_codigo').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Retira_Caracter(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_descricao').Text),'`') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Retira_Caracter(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_descricao').Text),'`') + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_quantidade').Text) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_valor_unitario').Text)) + '", ';
                    Comando_SQL  := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Corpo_CuponsD.FieldByName('mgt_programada_produto_valor_total').Text)) + '", ';
                    Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Cabeca_CuponsD.FieldByName('mgt_programada_data_emissao').Text),'amd','-') +#39+ ', ';
                    Comando_SQL  := Comando_SQL + '"' + Trim('00:00:00') + '",';
                    Comando_SQL  := Comando_SQL + '"' + Trim('Fechado') + '") ';

                    ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                    ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                    ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                    ConexaoBD.SQL_Corpo_CuponsD.Next;
                End;

             End;

             ConexaoBD.SQL_Cabeca_CuponsD.Next;
       End;

    End;

    lblProgramadas.Caption := 'Programadas: ' + IntToStr(Conta_Programada);

    //*** Seleciona o Movimento ***

    Caixa_Data_Ini := Inverte_Data_Plus(Rel_Periodo_Inicial.Text,'amd','-');
    Caixa_Data_Fim := Inverte_Data_Plus(Rel_Periodo_Final.Text,'amd','-');
    Caixa_Maquina  := Obtem_Nro_Antes_Traco(Maquinas.Text);

    If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
       Begin
       Comando_SQL  := 'Select * From  Corpo_Cupons_Movto ';
       Comando_SQL  := Comando_SQL + 'Where ';
       Comando_SQL  := Comando_SQL + '((Corpo_Cupom_Status = '+#39+'Fechado'+#39+') And ';
       Comando_SQL  := Comando_SQL + '(Corpo_Cupom_Data_Emissao >=' + #39+ Caixa_Data_Ini + #39+ ' And Corpo_Cupom_Data_Emissao <=' + #39+ Caixa_Data_Fim + #39+ ') And (Corpo_Cupom_Maquina = ' + #39 + Trim(Caixa_Maquina) + #39 + ')) ';
       Comando_SQL  := Comando_SQL + 'Order By Corpo_Cupom_Prod_Codigo, Corpo_Cupom_Prod_Vlr_Unitario Desc';
       End
    Else
       Begin
       Comando_SQL  := 'Select * From  Corpo_Cupons_Movto ';
       Comando_SQL  := Comando_SQL + 'Where ';
       Comando_SQL  := Comando_SQL + '((Corpo_Cupom_Status = '+#39+'Fechado'+#39+') And ';
       Comando_SQL  := Comando_SQL + '(Corpo_Cupom_Data_Emissao >=' + #39+ Caixa_Data_Ini + #39+ ' And Corpo_Cupom_Data_Emissao <=' + #39+ Caixa_Data_Fim + #39+ ')) ';
       Comando_SQL  := Comando_SQL + 'Order By Corpo_Cupom_Prod_Codigo, Corpo_Cupom_Prod_Vlr_Unitario Desc';
    End;

    ConexaoBD.SQL_Cupom_LucratividadeD.Close;
    ConexaoBD.SQL_Cupom_LucratividadeD.SQL.Clear;
    ConexaoBD.SQL_Cupom_LucratividadeD.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Cupom_LucratividadeD.Open;

    Seta();

    If ConexaoBD.SQL_Cupom_LucratividadeD.RecordCount > 0 Then
       Begin

       Ampulheta();

       ConexaoBD.SQL_Comunitario_SecundarioD.Close;
       ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
       ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('Truncate Lucratividade');
       ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

       ConexaoBD.SQL_Cupom_LucratividadeD.First;

       Codigo_Produto    := ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Codigo').Text;
       Descricao_Produto := ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Desc').Text;

       Comando_SQL := 'Select * From mgt_produtos Where mgt_produto_codigo = ' +#39+ Trim(Codigo_Produto) +#39;

       ConexaoBD.SQL_ProdutosD.Close;
       ConexaoBD.SQL_ProdutosD.SQL.Clear;
       ConexaoBD.SQL_ProdutosD.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_ProdutosD.Open;

       Ultimo_Custo      := ConexaoBD.SQL_ProdutosD.FieldByName('mgt_produto_valor_compra').AsFloat;
       Grupo_Produto     := ConexaoBD.SQL_ProdutosD.FieldByName('mgt_produto_familia').Text;

       If Trim(Grupo_Produto) = '' Then
          Begin
          Grupo_Produto := '0';
       End;

       Comando_SQL := 'Select * From mgt_familias_produtos Where mgt_familia_produto_codigo = ' + Trim(Grupo_Produto);

       ConexaoBD.SQL_GruposD.Close;
       ConexaoBD.SQL_GruposD.SQL.Clear;
       ConexaoBD.SQL_GruposD.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_GruposD.Open;

       Grupo_Descricao := ConexaoBD.SQL_GruposD.FieldByName('mgt_familia_produto_descricao').Text;

       Qtde_Produto      := 0;
       Preco_Medio       := 0.00;
       Total_Faturado    := 0.00;
       Custo_Total       := 0.00;
       Lucro_Bruto       := 0.00;
       Margem            := 0.000;

       Ind               := 0;

       While Not ConexaoBD.SQL_Cupom_LucratividadeD.EOF Do
             Begin
             Ind := Ind + 1;

             LBL_Registro.Caption := 'Seq.: ' + Trim(IntToStr(Ind)) + ' - Prod.: ' + Trim(Codigo_Produto) + ' - ' + Trim(Descricao_Produto);
             LBL_Registro.Refresh;

             If Trim(ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Codigo').Text) <> Trim(Codigo_Produto) Then
                Begin

                Custo_Total    := (Qtde_Produto * Ultimo_Custo);
                Preco_Medio    := (Preco_Medio / Qtde_Produto);
                Total_Faturado := (Qtde_Produto * Preco_Medio);
                Lucro_Bruto    := (Total_Faturado - Custo_Total);

                If Custo_Total <= 0 Then
                   Begin
                   Custo_Total := 1;
                End;

                Margem := (((Total_Faturado - Custo_Total) * 100) / Custo_Total);

                Vlr_Exibicao          := FloatToStr(Preco_Medio);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Preco_Medio       := Trim(Vlr_Exibicao);

                Vlr_Exibicao          := FloatToStr(Total_Faturado);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Total_Faturado    := Trim(Vlr_Exibicao);

                Vlr_Exibicao          := FloatToStr(Ultimo_Custo);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Ultimo_Custo      := Trim(Vlr_Exibicao);

                Vlr_Exibicao          := FloatToStr(Custo_Total);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Custo_Total       := Trim(Vlr_Exibicao);

                Vlr_Exibicao          := FloatToStr(Lucro_Bruto);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Lucro_Bruto       := Trim(Vlr_Exibicao);

                Vlr_Exibicao          := FloatToStr(Margem);
                Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Str_Margem            := Trim(Vlr_Exibicao);

                Comando_SQL  := 'Insert into Lucratividade(';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Codigo, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Descricao, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Qtde, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Preco_Venda, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Total_Faturado, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Ultimo_Custo, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Custo_Total, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Lucro_Bruto, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Margem_Lucro, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Grupo, ';
                Comando_SQL  := Comando_SQL + 'Lucratividade_Grupo_Descricao) ';
                Comando_SQL  := Comando_SQL + 'Values('+#39+ Trim(Codigo_Produto) +#39+', ';
                Comando_SQL  := Comando_SQL + #39+ Trim(Descricao_Produto) +#39+', ';
                Comando_SQL  := Comando_SQL + IntToStr(Qtde_Produto) + ', ';
                Comando_SQL  := Comando_SQL + Str_Preco_Medio + ', ';
                Comando_SQL  := Comando_SQL + Str_Total_Faturado + ', ';
                Comando_SQL  := Comando_SQL + Str_Ultimo_Custo + ', ';
                Comando_SQL  := Comando_SQL + Str_Custo_Total + ', ';
                Comando_SQL  := Comando_SQL + Str_Lucro_Bruto + ', ';
                Comando_SQL  := Comando_SQL + Str_Margem + ', ';
                Comando_SQL  := Comando_SQL + Trim(Grupo_Produto) + ', ';
                Comando_SQL  := Comando_SQL + #39+ Trim(Grupo_Descricao) + #39+ ')';

                ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                //*** Obtem os Dados do Novo Produto ***

                Codigo_Produto    := ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Codigo').Text;
                Descricao_Produto := ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Desc').Text;

                Comando_SQL  := 'Select * From mgt_produtos Where mgt_produto_codigo = ' +#39+ Trim(Codigo_Produto) +#39;

                ConexaoBD.SQL_ProdutosD.Close;
                ConexaoBD.SQL_ProdutosD.SQL.Clear;
                ConexaoBD.SQL_ProdutosD.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_ProdutosD.Open;

                Ultimo_Custo      := ConexaoBD.SQL_ProdutosD.FieldByName('mgt_produto_valor_compra').AsFloat;
                Grupo_Produto     := ConexaoBD.SQL_ProdutosD.FieldByName('mgt_produto_familia').Text;

                If Trim(Grupo_Produto) = '' Then
                   Begin
                   Grupo_Produto := '0';
                End;

                Comando_SQL := 'Select * From mgt_familias_produtos Where mgt_familia_produto_codigo = ' + Trim(Grupo_Produto);

                ConexaoBD.SQL_GruposD.Close;
                ConexaoBD.SQL_GruposD.SQL.Clear;
                ConexaoBD.SQL_GruposD.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_GruposD.Open;

                Grupo_Descricao := ConexaoBD.SQL_GruposD.FieldByName('mgt_familia_produto_descricao').Text;

                Qtde_Produto      := 0;
                Preco_Medio       := 0.00;
                Total_Faturado    := 0.00;
                Custo_Total       := 0.00;
                Lucro_Bruto       := 0.00;
                Margem            := 0.000;
             End;

             Qtde_Produto := Qtde_Produto + ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Prod_Qtde').AsInteger;
             Preco_Medio  := Preco_Medio  + ConexaoBD.SQL_Cupom_LucratividadeD.FieldByName('Corpo_Cupom_Vlr_Total').AsFloat;

             ConexaoBD.SQL_Cupom_LucratividadeD.Next;
       End;

       Ind := Ind + 1;

       LBL_Registro.Caption := 'Seq.: ' + Trim(IntToStr(Ind)) + ' - Prod.: ' + Trim(Codigo_Produto) + ' - ' + Trim(Descricao_Produto);
       LBL_Registro.Refresh;

       Custo_Total    := (Qtde_Produto * Ultimo_Custo);
       Preco_Medio    := (Preco_Medio / Qtde_Produto);
       Total_Faturado := (Qtde_Produto * Preco_Medio);
       Lucro_Bruto    := (Total_Faturado - Custo_Total);

       If Custo_Total <= 0 Then
          Begin
          Custo_Total := 1;
       End;

       Margem := (((Total_Faturado - Custo_Total) * 100) / Custo_Total);

       Vlr_Exibicao          := FloatToStr(Preco_Medio);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Preco_Medio       := Trim(Vlr_Exibicao);

       Vlr_Exibicao          := FloatToStr(Total_Faturado);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Total_Faturado    := Trim(Vlr_Exibicao);

       Vlr_Exibicao          := FloatToStr(Ultimo_Custo);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Ultimo_Custo      := Trim(Vlr_Exibicao);

       Vlr_Exibicao          := FloatToStr(Custo_Total);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Custo_Total       := Trim(Vlr_Exibicao);

       Vlr_Exibicao          := FloatToStr(Lucro_Bruto);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Lucro_Bruto       := Trim(Vlr_Exibicao);

       Vlr_Exibicao          := FloatToStr(Margem);
       Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
       Val(Vlr_Exibicao,Vlr_Numero,Erro);
       Str(Vlr_Numero:13:2,Vlr_Exibicao);
       Str_Margem            := Trim(Vlr_Exibicao);

       Comando_SQL  := 'Insert into Lucratividade(';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Codigo, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Descricao, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Qtde, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Preco_Venda, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Total_Faturado, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Ultimo_Custo, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Custo_Total, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Lucro_Bruto, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Margem_Lucro, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Grupo, ';
       Comando_SQL  := Comando_SQL + 'Lucratividade_Grupo_Descricao) ';
       Comando_SQL  := Comando_SQL + 'Values('+#39+ Trim(Codigo_Produto) +#39+', ';
       Comando_SQL  := Comando_SQL + #39+ Trim(Descricao_Produto) +#39+', ';
       Comando_SQL  := Comando_SQL + IntToStr(Qtde_Produto) + ', ';
       Comando_SQL  := Comando_SQL + Str_Preco_Medio + ', ';
       Comando_SQL  := Comando_SQL + Str_Total_Faturado + ', ';
       Comando_SQL  := Comando_SQL + Str_Ultimo_Custo + ', ';
       Comando_SQL  := Comando_SQL + Str_Custo_Total + ', ';
       Comando_SQL  := Comando_SQL + Str_Lucro_Bruto + ', ';
       Comando_SQL  := Comando_SQL + Str_Margem + ', ';
       Comando_SQL  := Comando_SQL + Trim(Grupo_Produto) + ', ';
       Comando_SQL  := Comando_SQL + #39+ Trim(Grupo_Descricao) + #39+ ')';

       ConexaoBD.SQL_Comunitario_SecundarioD.Close;
       ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
       ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

       Seta();

       LBL_Registro.Caption := 'Aguarde... Gerando Relatório...';
       LBL_Registro.Refresh;

       If Opcao_Grupo.Checked Then
          Begin

          If Trim(CB_Ordenar.Text) = 'Lucro Bruto' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Lucro_Bruto Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Código' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Codigo';
             End
          Else If Trim(CB_Ordenar.Text) = 'Produto' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Descricao';
             End
          Else If Trim(CB_Ordenar.Text) = 'Qtde. Vendida' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Qtde Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Preço Médio Venda' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Preco_Venda Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Total Faturado' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Total_Faturado Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Último Custo' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Ultimo_Custo Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Custo Total' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Custo_Total Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Margem Lucro' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Grupo, Lucratividade_Margem_Lucro Desc';
          End;
          End
       Else
          Begin
          If Trim(CB_Ordenar.Text) = 'Lucro Bruto' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Lucro_Bruto Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Código' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Codigo';
             End
          Else If Trim(CB_Ordenar.Text) = 'Produto' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Descricao';
             End
          Else If Trim(CB_Ordenar.Text) = 'Qtde. Vendida' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Qtde Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Preço Médio Venda' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Preco_Venda Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Total Faturado' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Total_Faturado Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Último Custo' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Ultimo_Custo Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Custo Total' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Custo_Total Desc';
             End
          Else If Trim(CB_Ordenar.Text) = 'Margem Lucro' Then
             Begin
             Comando_SQL := 'Select * From Lucratividade Order By Lucratividade_Margem_Lucro Desc';
          End;
       End;

       ConexaoBD.SQL_LucratividadeD.Close;
       ConexaoBD.SQL_LucratividadeD.SQL.Clear;
       ConexaoBD.SQL_LucratividadeD.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_LucratividadeD.Open;

       //*** Gerar Relatório em Tela ***

       Application.CreateForm(TRelLucratividadeD03,RelLucratividadeD03);

       //*** Código do Produto ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[0,0]        := 'Código';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[0]      := 45;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[0,1]        := '';

       //*** Descrição do Produto ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[1,0]        := 'Produto';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[1]      := 200;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[1,1]        := '';

       //*** Quantidade Vendida ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[2,0]        := 'Qtde Vendida';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[2]      := 70;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[2,1]        := '';

       //*** Preços Médio de Venda ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[3,0]        := 'Vlr.Médio Venda';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[3]      := 85;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[3,1]        := '';

       //*** Total Faturado ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[4,0]        := 'Total Faturado';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[4]      := 75;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[4,1]        := '';

       //*** Último Custo ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[5,0]        := 'Último Custo';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[5]      := 65;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[5,1]        := '';

       //*** Custo Total ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[6,0]        := 'Custo Total';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[6]      := 60;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[6,1]        := '';

       //*** Lucro Bruto ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[7,0]        := 'Lucro Bruto';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[7]      := 60;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[7,1]        := '';

       //*** Margem de Lucro ***
       RelLucratividadeD03.Resultado_Lucratividade.Cells[8,0]        := 'Margem Lucro';
       RelLucratividadeD03.Resultado_Lucratividade.ColWidths[8]      := 75;
       RelLucratividadeD03.Resultado_Lucratividade.Cells[8,1]        := '';

       ConexaoBD.SQL_LucratividadeD.First;

       If Opcao_Grupo.Checked Then
          Begin
          RelLucratividadeD03.LBL_Rel_Titulo.Caption := 'Relatório de Lucratividade - Por Grupo';
          RelLucratividadeD03.LBL_Rel_Periodo.Caption := 'Período: ' + Trim(Rel_Periodo_Inicial.Text) + ' Até ' + Trim(Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(CB_Ordenar.Text) + '          Máquina: ' + Trim(Maquinas.Text);
          End
       Else
          Begin
          RelLucratividadeD03.LBL_Rel_Titulo.Caption := 'Relatório de Lucratividade - Sem Grupo';
          RelLucratividadeD03.LBL_Rel_Periodo.Caption := 'Período: ' + Trim(Rel_Periodo_Inicial.Text) + ' Até ' + Trim(Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(CB_Ordenar.Text) + '          Máquina: ' + Trim(Maquinas.Text);
       End;

       RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
       RelLucratividadeD03.Resultado_Lucratividade.RowCount  := 2;

       If Opcao_Grupo.Checked Then
          Begin
          Grupo_Produto   := 'X';
          Grupo_Descricao := 'X';

          Soma_Qtde           := 0;
          Soma_Preco_Venda    := 0.00;
          Soma_Total_Faturado := 0.00;
          Soma_Ultimo_Custo   := 0.00;
          Soma_Custo_Total    := 0.00;
          Soma_Lucro_Bruto    := 0.00;
          Soma_Margem_Lucro   := 0.00;

          Soma_Qtde_Total           := 0;
          Soma_Preco_Venda_Total    := 0.00;
          Soma_Total_Faturado_Total := 0.00;
          Soma_Ultimo_Custo_Total   := 0.00;
          Soma_Custo_Total_Total    := 0.00;
          Soma_Lucro_Bruto_Total    := 0.00;
          Soma_Margem_Lucro_Total   := 0.00;

          While Not ConexaoBD.SQL_LucratividadeD.Eof Do
                Begin
                LBL_Registro.Caption := 'Gerando Relatório... Linha: ' + Trim(IntToStr((RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1)));
                LBL_Registro.Refresh;

                If Trim(ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Grupo').Text) <> Trim(Grupo_Produto) Then
                   Begin
                   //*** Totalização ***

                   If Trim(Grupo_Produto) = 'X' Then
                      Begin
                      Grupo_Produto   := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Grupo').Text;
                      Grupo_Descricao := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Grupo_Descricao').Text;

                      RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Grupo: ' + Trim(Grupo_Produto) + ' - ' + Trim(Grupo_Descricao);

                      RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                      RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 2);
                      End
                   Else
                      Begin
                      RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                      RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

                      Soma_Preco_Venda := (Soma_Total_Faturado / Soma_Qtde);
                      Soma_Margem_Lucro := ((((Soma_Total_Faturado) - (Soma_Custo_Total)) * 100) / (Soma_Custo_Total));

                      //*** Total ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Total Grupo: ' + Trim(Grupo_Produto) + ' - ' + Trim(Grupo_Descricao);

                      //*** Quantidade Vendida ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := IntToStr(Soma_Qtde);

                      //*** Preços Médio de Venda ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Preco_Venda);

                      //*** Total Faturado ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Total_Faturado);

                      //*** Último Custo ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Ultimo_Custo);

                      //*** Custo Total ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Custo_Total);

                      //*** Lucro Bruto ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Lucro_Bruto);

                      //*** Margem de Lucro ***
                      RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Margem_Lucro);

                      Soma_Qtde           := 0;
                      Soma_Preco_Venda    := 0.00;
                      Soma_Total_Faturado := 0.00;
                      Soma_Ultimo_Custo   := 0.00;
                      Soma_Custo_Total    := 0.00;
                      Soma_Lucro_Bruto    := 0.00;
                      Soma_Margem_Lucro   := 0.00;

                      RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                      RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 4);

                      Grupo_Produto   := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Grupo').Text;
                      Grupo_Descricao := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Grupo_Descricao').Text;

                      RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Grupo: ' + Trim(Grupo_Produto) + ' - ' + Trim(Grupo_Descricao);

                      RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                      RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 2);
                   End;
                End;

                //*** Código do Produto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[0,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Codigo').Text;

                //*** Descrição do Produto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Descricao').Text;

                //*** Quantidade Vendida ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Qtde').Text;

                //*** Preços Médio de Venda ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Preco_Venda').Text;

                //*** Total Faturado ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Total_Faturado').Text;

                //*** Último Custo ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Ultimo_Custo').Text;

                //*** Custo Total ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Custo_Total').Text;

                //*** Lucro Bruto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Lucro_Bruto').Text;

                //*** Margem de Lucro ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Margem_Lucro').Text;

                RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

                //*** Efetua a Soma dos Valores ***

                Soma_Qtde           := Soma_Qtde + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Qtde').AsInteger;
                Soma_Preco_Venda    := Soma_Preco_Venda + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Preco_Venda').AsVariant;
                Soma_Total_Faturado := Soma_Total_Faturado + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Total_Faturado').AsVariant;
                Soma_Ultimo_Custo   := Soma_Ultimo_Custo + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Ultimo_Custo').AsVariant;
                Soma_Custo_Total    := Soma_Custo_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Custo_Total').AsVariant;
                Soma_Lucro_Bruto    := Soma_Lucro_Bruto + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Lucro_Bruto').AsVariant;
                Soma_Margem_Lucro   := Soma_Margem_Lucro + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Margem_Lucro').AsVariant;

                Soma_Qtde_Total           := Soma_Qtde_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Qtde').AsInteger;
                Soma_Preco_Venda_Total    := Soma_Preco_Venda_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Preco_Venda').AsVariant;
                Soma_Total_Faturado_Total := Soma_Total_Faturado_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Total_Faturado').AsVariant;
                Soma_Ultimo_Custo_Total   := Soma_Ultimo_Custo_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Ultimo_Custo').AsVariant;
                Soma_Custo_Total_Total    := Soma_Custo_Total_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Custo_Total').AsVariant;
                Soma_Lucro_Bruto_Total    := Soma_Lucro_Bruto_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Lucro_Bruto').AsVariant;
                Soma_Margem_Lucro_Total   := Soma_Margem_Lucro_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Margem_Lucro').AsVariant;

                ConexaoBD.SQL_LucratividadeD.Next;
          End;

          //*** Total do Grupo ***

          RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
          RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

          Soma_Preco_Venda := (Soma_Total_Faturado / Soma_Qtde);
          Soma_Margem_Lucro := ((((Soma_Total_Faturado) - (Soma_Custo_Total)) * 100) / (Soma_Custo_Total));

          //*** Total ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Total Grupo: ' + Trim(Grupo_Produto) + ' - ' + Trim(Grupo_Descricao);

          //*** Quantidade Vendida ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := IntToStr(Soma_Qtde);

          //*** Preços Médio de Venda ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Preco_Venda);

          //*** Total Faturado ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Total_Faturado);

          //*** Último Custo ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Ultimo_Custo);

          //*** Custo Total ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Custo_Total);

          //*** Lucro Bruto ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Lucro_Bruto);

          //*** Margem de Lucro ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Margem_Lucro);

          RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
          RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

          //*** Totalização Geral ***

          RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
          RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 3);

          Soma_Preco_Venda_Total := (Soma_Total_Faturado_Total / Soma_Qtde_Total);
          Soma_Margem_Lucro_Total := ((((Soma_Total_Faturado_Total) - (Soma_Custo_Total_Total)) * 100) / (Soma_Custo_Total_Total));

          //*** Total Geral ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Total Geral.:';

          //*** Quantidade Vendida ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := IntToStr(Soma_Qtde_Total);

          //*** Preços Médio de Venda ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Preco_Venda_Total);

          //*** Total Faturado ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Total_Faturado_Total);

          //*** Último Custo ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Ultimo_Custo_Total);

          //*** Custo Total ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Custo_Total_Total);

          //*** Lucro Bruto ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Lucro_Bruto_Total);

          //*** Margem de Lucro ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Margem_Lucro_Total);

          LBL_Registro.Caption := 'Processo Finalizado...';
          LBL_Registro.Refresh;
          End
       Else
          Begin
          Soma_Qtde           := 0;
          Soma_Preco_Venda    := 0.00;
          Soma_Total_Faturado := 0.00;
          Soma_Ultimo_Custo   := 0.00;
          Soma_Custo_Total    := 0.00;
          Soma_Lucro_Bruto    := 0.00;
          Soma_Margem_Lucro   := 0.00;

          While Not ConexaoBD.SQL_LucratividadeD.Eof Do
                Begin
                LBL_Registro.Caption := 'Gerando Relatório... Linha: ' + Trim(IntToStr((RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1)));
                LBL_Registro.Refresh;

                //*** Código do Produto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[0,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Codigo').Text;

                //*** Descrição do Produto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Descricao').Text;

                //*** Quantidade Vendida ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Qtde').Text;

                //*** Preços Médio de Venda ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Preco_Venda').Text;

                //*** Total Faturado ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Total_Faturado').Text;

                //*** Último Custo ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Ultimo_Custo').Text;

                //*** Custo Total ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Custo_Total').Text;

                //*** Lucro Bruto ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Lucro_Bruto').Text;

                //*** Margem de Lucro ***
                RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Margem_Lucro').Text;

                RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
                RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

                //*** Efetua a Soma dos Valores ***

                Soma_Qtde           := Soma_Qtde + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Qtde').AsInteger;
                Soma_Preco_Venda    := Soma_Preco_Venda + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Preco_Venda').AsVariant;
                Soma_Total_Faturado := Soma_Total_Faturado + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Total_Faturado').AsVariant;
                Soma_Ultimo_Custo   := Soma_Ultimo_Custo + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Ultimo_Custo').AsVariant;
                Soma_Custo_Total    := Soma_Custo_Total + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Custo_Total').AsVariant;
                Soma_Lucro_Bruto    := Soma_Lucro_Bruto + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Lucro_Bruto').AsVariant;
                Soma_Margem_Lucro   := Soma_Margem_Lucro + ConexaoBD.SQL_LucratividadeD.FieldByName('Lucratividade_Margem_Lucro').AsVariant;

                ConexaoBD.SQL_LucratividadeD.Next;
          End;

          //*** Totalização ***

          RelLucratividadeD03.Resultado_Lucratividade.FixedRows := 1;
          RelLucratividadeD03.Resultado_Lucratividade.RowCount  := (RelLucratividadeD03.Resultado_Lucratividade.RowCount + 1);

          Soma_Preco_Venda := (Soma_Total_Faturado / Soma_Qtde);
          Soma_Margem_Lucro := ((((Soma_Total_Faturado) - (Soma_Custo_Total)) * 100) / (Soma_Custo_Total));

          //*** Total ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[1,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := 'Total.:';

          //*** Quantidade Vendida ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[2,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := IntToStr(Soma_Qtde);

          //*** Preços Médio de Venda ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[3,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Preco_Venda);

          //*** Total Faturado ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[4,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Total_Faturado);

          //*** Último Custo ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[5,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Ultimo_Custo);

          //*** Custo Total ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[6,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Custo_Total);

          //*** Lucro Bruto ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[7,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Lucro_Bruto);

          //*** Margem de Lucro ***
          RelLucratividadeD03.Resultado_Lucratividade.Cells[8,(RelLucratividadeD03.Resultado_Lucratividade.RowCount - 1)] := FormatFloat('###,###,##0.00',Soma_Margem_Lucro);

          LBL_Registro.Caption := 'Processo Finalizado...';
          LBL_Registro.Refresh;
       End;

       RelLucratividadeD03.ShowModal;
       RelLucratividadeD03.Destroy;
       End
    Else
       Begin
       Seta();

       MSG_Erro('Nenhuma Venda foi efetuada neste período.');
    End;

    Seta();

    BT_Imprimir.Enabled := True;
    BT_Sair.Enabled     := True;

    Rel_Periodo_Inicial.SetFocus;
end;

procedure TRelLucratividadeD00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Rel_Periodo_Final.Text := Rel_Periodo_Inicial.Text;

      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.CB_OrdenarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.Opcao_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.Opcao_Sem_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelLucratividadeD00.BT_AtualizarClick(Sender: TObject);

var
  Codigo_Barras, Valor_Custo: String;

begin
  //*** Atualiza o Preço de Custo dos Produtos ***

  Ampulheta();

  ConexaoBD.SQL_Produtos.Close;
  ConexaoBD.SQL_Produtos.SQL.Clear;
  ConexaoBD.SQL_Produtos.SQL.Add('SELECT * FROM Produtos');
  ConexaoBD.SQL_Produtos.Open;

  While Not ConexaoBD.SQL_Produtos.EOF Do
        Begin
        Codigo_Barras := Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_Cod_Barra').Text);
        Valor_Custo   := Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_Custo').Text);

        ConexaoBD.SQL_Comunitario_SecundarioD.Close;
        ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
        ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('UPDATE mgt_produtos SET mgt_produto_valor_compra = ' +#39+ Virgula_Ponto(Valor_Custo) +#39+ ' WHERE mgt_produto_codigo_barras = ' +#39+ Codigo_Barras +#39 );
        ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

        LBL_Registro.Caption := 'Código: ' + Codigo_Barras;
        LBL_Registro.Refresh;

        ConexaoBD.SQL_Produtos.Next;
  End;

  LBL_Registro.Caption := 'Atualização Terminada!';
  LBL_Registro.Refresh;

  Seta();

  MSG_Erro('Atualização Terminada! Pode gerar o relatório.');

end;

end.
