unit Notas_Fiscais_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, Gauges;
  
type
  TNotasFiscais02 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    Maquinas: TComboBox;
    Label1: TLabel;
    LBL_Registro: TLabel;
    BT_Procurar: TBitBtn;
    Panel2: TPanel;
    DBGrid_Pedidos: TDBGrid;
    Label4: TLabel;
    Localiza_Arquivo: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_PedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_PedidosDblClick(Sender: TObject);
  private
    { Private declarations }
    function completa_zeros(texto: String; tamanho: Integer): String;
    function retira_acentos(texto:String; tamanho:Integer): String;

  public
    { Public declarations }
  end;

var
  NotasFiscais02: TNotasFiscais02;

implementation

uses Rotinas_Gerais, Conexao_BD, Login_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TNotasFiscais02.completa_zeros(texto: String; tamanho: Integer): String;

var
   complementa_zeros_str, resulta_codigo: String;
   ind: Integer;

begin
         complementa_zeros_str := ' ';
         
         For ind := 1 To (tamanho - Length(trim(texto))) Do
             Begin
             complementa_zeros_str := complementa_zeros_str + '0';
         End;

         resulta_codigo := trim(complementa_zeros_str) + trim(texto);
         resulta_codigo := trim(resulta_codigo);
         resulta_codigo := Copy(resulta_codigo, (Length(resulta_codigo) - tamanho), tamanho);

         completa_zeros := resulta_codigo;
end;

function TNotasFiscais02.retira_acentos(texto:String; tamanho:Integer): String;

var
   resulta_codigo: String;
   
begin
         texto := UpperCase(texto);

         texto := Troca_Caracter(#39, ' ', texto);
         texto := Troca_Caracter('"', ' ', texto);
         texto := Troca_Caracter('&', 'E', texto);

         texto := Troca_Caracter('ç', 'C', texto);

         texto := Troca_Caracter('á', 'A', texto);
         texto := Troca_Caracter('à', 'A', texto);
         texto := Troca_Caracter('ã', 'A', texto);
         texto := Troca_Caracter('â', 'A', texto);
         texto := Troca_Caracter('ä', 'A', texto);

         texto := Troca_Caracter('é', 'E', texto);
         texto := Troca_Caracter('è', 'E', texto);
         texto := Troca_Caracter('ê', 'E', texto);
         texto := Troca_Caracter('ë', 'E', texto);

         texto := Troca_Caracter('í', 'I', texto);
         texto := Troca_Caracter('ì', 'I', texto);
         texto := Troca_Caracter('î', 'I', texto);
         texto := Troca_Caracter('ï', 'I', texto);

         texto := Troca_Caracter('ó', 'O', texto);
         texto := Troca_Caracter('ò', 'O', texto);
         texto := Troca_Caracter('ô', 'O', texto);
         texto := Troca_Caracter('ö', 'O', texto);
         texto := Troca_Caracter('õ', 'O', texto);

         texto := Troca_Caracter('ú', 'U', texto);
         texto := Troca_Caracter('ù', 'U', texto);
         texto := Troca_Caracter('û', 'U', texto);
         texto := Troca_Caracter('ü', 'U', texto);

         texto := Troca_Caracter('Ç', 'C'
         , texto);

         texto := Troca_Caracter('Á', 'A', texto);
         texto := Troca_Caracter('À', 'A', texto);
         texto := Troca_Caracter('Ã', 'A', texto);
         texto := Troca_Caracter('Â', 'A', texto);
         texto := Troca_Caracter('Ä', 'A', texto);

         texto := Troca_Caracter('É', 'E', texto);
         texto := Troca_Caracter('È', 'E', texto);
         texto := Troca_Caracter('Ê', 'E', texto);
         texto := Troca_Caracter('Ë', 'E', texto);

         texto := Troca_Caracter('Í', 'I', texto);
         texto := Troca_Caracter('Ì', 'I', texto);
         texto := Troca_Caracter('Î', 'I', texto);
         texto := Troca_Caracter('Ï', 'I', texto);

         texto := Troca_Caracter('Ó', 'O', texto);
         texto := Troca_Caracter('Ò', 'O', texto);
         texto := Troca_Caracter('Ô', 'O', texto);
         texto := Troca_Caracter('Ö', 'O', texto);
         texto := Troca_Caracter('Õ', 'O', texto);

         texto := Troca_Caracter('Ú', 'U', texto);
         texto := Troca_Caracter('Ù', 'U', texto);
         texto := Troca_Caracter('Û', 'U', texto);
         texto := Troca_Caracter('Ü', 'U', texto);

         resulta_codigo := trim(texto);

         If tamanho > 0 Then
            Begin
            resulta_codigo := Copy(resulta_codigo,1,tamanho);
         End;

         retira_acentos := resulta_codigo;
end;

//******************
//*** Procedures ***
//******************

procedure TNotasFiscais02.FormShow(Sender: TObject);
begin
    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(DBGrid_Pedidos.Handle,SB_VERT,True);

    //*** Carrega Máquinas ***
    ConexaoBD.SQL_Informacao_Maquinas.Close;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('Select * From Informacao_Maquinas Order By Informacao_Maquina_Descricao');
    ConexaoBD.SQL_Informacao_Maquinas.Open;

    Maquinas.Items.Add('--- Todas as Máquinas ---');

    While Not ConexaoBD.SQL_Informacao_Maquinas.Eof Do
      Begin
        Maquinas.Items.Add( ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_HD.Text + ' - ' + ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_Descricao.Text );
        ConexaoBD.SQL_Informacao_Maquinas.Next;
    End;
    Maquinas.ItemIndex  := 0;

    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text   := DateToStr(Date());

    BT_ProcurarClick(Sender);
end;

procedure TNotasFiscais02.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais02.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais02.BT_SairClick(Sender: TObject);
begin
    NotasFiscais02.Close;
end;

procedure TNotasFiscais02.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais02.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Seleciona a Cabeça de Cupons ***

        Comando_SQL := 'Select * from Cabeca_Cupons Where ';
        Comando_SQL := Comando_SQL + '(Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+') ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero DESC';

        ConexaoBD.SQL_Compras_Clientes.Close;
        ConexaoBD.SQL_Compras_Clientes.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes.Open;

        Seta();
        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
end;

procedure TNotasFiscais02.DBGrid_PedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Pedidos.Fields[5].Text = 'Aguardando') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
        End
     Else
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Pedidos.DefaultDrawDataCell(Rect, DBGrid_Pedidos.columns[datacol].field, State);
end;

procedure TNotasFiscais02.DBGrid_PedidosDblClick(Sender: TObject);

var
   Registro, Posicao: Integer;

   Comando_SQL, Numero_Nota, Numero_Pedido: String;

   Arquivo_Leitura: TextFile;
   Ler_Linha, Tipo_Registro, Descarta_Registro, CPF_Registro, Tipo_CPF_Registro,
   Nome_Registro, Rua_Registro, Nro_Registro, Complemento_Registro, Bairro_Registro,
   Cidade_Registro, Estado_Registro, CEP_Registro, Valor_Pedido_Registro,
   Valor_Frete_Registro, Valor_Total_Registro, Observacao_Registro: String;

   Produto_Codigo_Registro, Produto_Descricao_Registro,
   Produto_Quantidade_Registro, Produto_Valor_Unitario_Registro,
   Produto_Valor_Total_Registro: String;

   Arquivo_Origem: String;

begin
     If (DBGrid_Pedidos.Fields[0].Text <> '') AND (DBGrid_Pedidos.Fields[5].Text = 'Aguardando') Then
        Begin
        Ampulheta();

        //*** Abre a Localização do Arquivo ***
        Localiza_Arquivo.Title := 'Arquivo gerado pelo Site';
        Localiza_Arquivo.InitialDir := '\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\';

        Seta();

        If Localiza_Arquivo.Execute Then
           Begin
           Arquivo_Origem := Localiza_Arquivo.FileName;

           If Trim(Arquivo_Origem) <> '' Then
              Begin

              If Confirma('Vincular a Venda ' + Trim(DBGrid_Pedidos.Fields[0].Text) + ' com o arquivo:' + Trim(Arquivo_Origem) + ' para a emissão da Nota Fiscal?') = 6 Then
                 Begin
                 Ampulheta();

                 //*** Obtem o Número da Última Nota Fiscal ***
                 ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                 ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                 ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('SELECT * FROM mgt_numero_nota_anterior');
                 ConexaoBD.SQL_Comunitario_SecundarioD.Open;

                 Numero_Nota := IntToStr(StrToInt(ConexaoBD.SQL_Comunitario_SecundarioD.FieldByName('mgt_numero_nota_anterior_numero').Text) + 1);

                 //*** Registra o Cliente na Cabeça do Cupom ***
                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add('UPDATE Cabeca_Cupons SET Cabeca_Cupom_Cliente_Codigo = ' +#39+#39+ ', Cabeca_Cupom_Cliente_Status = ' +#39+ 'NFP:' + Trim(Numero_Nota) +#39+ ' WHERE Cabeca_Cupom_Numero = ' +#39+ Trim(DBGrid_Pedidos.Fields[0].Text) +#39);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 //*** Abre o Arquivo Texto para Registrar a Nota Fiscal ***
                 AssignFile(Arquivo_Leitura, Trim(Arquivo_Origem));

                 //*** Ler o Arquivo Texto ***
                 Reset(Arquivo_Leitura);

                 Registro := 0;

                 While NOT EOF(Arquivo_Leitura) do Begin
                       Registro := Registro + 1;

                       //*** Lê a Linha do Arquivo ***
                       Readln(Arquivo_Leitura,Ler_Linha);

                       //*** Lê a Posição do Registro ***
                       Posicao := pos('|', Ler_Linha);
                       Tipo_Registro := copy(Ler_Linha, 1, Posicao-1);
                       delete(Ler_Linha, 1, Posicao);

                       If ((Trim(Tipo_Registro) = '20') Or (Trim(Tipo_Registro) = '21')) Then
                          Begin

                          If Trim(Tipo_Registro) = '20' Then
                             Begin
                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             CPF_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Nome_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Rua_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Nro_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Complemento_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Bairro_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Cidade_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Estado_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             CEP_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Valor_Pedido_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Valor_Frete_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Valor_Total_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Observacao_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Cria o Registro de Pedido ***
                             Comando_SQL := 'INSERT INTO mgt_pedidos(';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_nome,';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_data,';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_status) ';
                             Comando_SQL := Comando_SQL + 'VALUES(';
                             Comando_SQL := Comando_SQL + #39 + '--- PEDIDO EM PROCESSO DE INCLUSAO ---' + #39 + ',';
                             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + 'Preparando' + #39 + ')';

                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                             ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                             //*** Recupera o Número do Pedido ***
                             Comando_SQL := 'SELECT * FROM mgt_pedidos WHERE mgt_pedido_status = ' + #39 + 'Preparando' + #39 + ' ORDER BY mgt_pedido_numero DESC';

                             ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                             ConexaoBD.SQL_Comunitario_SecundarioD.Open;

                             Numero_Pedido := IntToStr(StrToInt(ConexaoBD.SQL_Comunitario_SecundarioD.FieldByName('mgt_pedido_numero').Text));

                             //*** Registra as Informações no Arquivo de Pedido ***
                             //*** Altera o Registro de Pedido ***
                             Comando_SQL := 'UPDATE mgt_pedidos SET ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_numero = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_codigo = ' + #39 + Trim(CPF_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_nome = ' + #39 + Trim(UpperCase(Nome_Registro)) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_desconto = ' + #39 + '0.000' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_data = ' + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_data_entrega = ' + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_tipo_faturamento = ' + #39 + 'Nota Fiscal' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_transportadora = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_ordem_compra = ' + #39 + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_observacao = ' + #39 + Trim(Observacao_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_valor_desconto = ' + #39 + '0.00' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_valor_pedido = ' + #39 + Virgula_Ponto(Valor_Pedido_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_valor_frete = ' + #39 + Virgula_Ponto(Valor_Frete_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_valor_ipi = ' + #39 + '0.00' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_valor_total = ' + #39 + Virgula_Ponto(Valor_Total_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_1 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_2 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_3 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_4 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_5 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_6 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_7 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_8 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_9 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_10 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_11 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_cliente_condicao_pgto_12 = ' + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_status = ' + #39 + 'Aguardando' + #39 + ', ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_numero_faturamento = ' + #39 + '0' + #39 + ' ';
                             Comando_SQL := Comando_SQL + 'WHERE mgt_pedido_numero = ' + #39 + Trim(Numero_Pedido) + #39 + ' ';

                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                             ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                             //*** Registra o Cliente ***
                             If Trim(CPF_Registro) <> '' Then
                                Begin
                                If Length(Trim(CPF_Registro)) > 11 Then
                                   Begin
                                   Tipo_CPF_Registro := 'CNPJ';
                                   End
                                Else
                                   Begin
                                   Tipo_CPF_Registro := 'CPF';
                                End;

                                ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('SELECT mgt_cliente_codigo FROM mgt_clientes WHERE mgt_cliente_codigo = ' +#39+ Trim(CPF_Registro) +#39+ ' LIMIT 1');
                                ConexaoBD.SQL_Comunitario_SecundarioD.Open;

                                If ConexaoBD.SQL_Comunitario_SecundarioD.Eof Then
                                   Begin
                                   Comando_SQL := 'INSERT INTO mgt_clientes(';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_codigo, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_codigo_tipo, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_nome, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_razao_social, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_endereco, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_complemento, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_bairro, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cidade, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_estado, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cep, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_pais, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_complemento_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_estado_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cep_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_pais_cobranca, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_complemento_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_estado_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_cep_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_pais_entrega, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_data_inclusao, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_data_visita, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_data_alteracao, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_data_ultima_compra, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_status_credito, ';
                                   Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_estadual) ';
                                   Comando_SQL := Comando_SQL + 'VALUES(';
                                   Comando_SQL := Comando_SQL + #39 + Trim(CPF_Registro) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(Tipo_CPF_Registro) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Nome_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Nome_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Rua_Registro)) + ', ' + Trim(UpperCase(Nro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Complemento_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Bairro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Cidade_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Estado_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(CEP_Registro) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + 'Brasil' + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Rua_Registro)) + ', ' + Trim(UpperCase(Nro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Complemento_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Bairro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Cidade_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Estado_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(CEP_Registro) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + 'Brasil' + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Rua_Registro)) + ', ' + Trim(UpperCase(Nro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Complemento_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Bairro_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Cidade_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Estado_Registro)) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Trim(CEP_Registro) + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + 'Brasil' + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ', ';
                                   Comando_SQL := Comando_SQL + #39 + 'ISENTO' + #39 + ') ';

                                   ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                                   ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                                   ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;
                                End;
                             End;
                          End;

                          If Trim(Tipo_Registro) = '21' Then
                             Begin
                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Produto_Codigo_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Produto_Descricao_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Descarta_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Produto_Quantidade_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Posicao := pos('|', Ler_Linha);
                             Produto_Valor_Unitario_Registro := copy(Ler_Linha, 1, Posicao-1);
                             delete(Ler_Linha, 1, Posicao);

                             //*** Lê a Próxima Posição do Registro ***
                             Produto_Valor_Total_Registro := Virgula_Ponto(FormatFloat('0.00',(StrToFloat(Ponto_Virgula(Produto_Quantidade_Registro)) * StrToFloat(Ponto_Virgula(Produto_Valor_Unitario_Registro)))));

                             //*** Registra as Informações no Arquivo de Produtos ***
                             Comando_SQL := 'INSERT INTO mgt_pedidos_produtos(';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_numero_pedido, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_quantidade, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_codigo, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_descricao, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_valor_unitario, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_valor_total, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_valor_ipi, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_lote, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_referencia, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_posicao, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_descricao_detalhada, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_unidade, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_ipi, ';
                             Comando_SQL := Comando_SQL + 'mgt_pedido_produto_codigo_barras) ';
                             Comando_SQL := Comando_SQL + 'VALUES(';
                             Comando_SQL := Comando_SQL + #39 + Trim(Numero_Pedido) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Produto_Quantidade_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Trim(Produto_Codigo_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Produto_Descricao_Registro)) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Produto_Valor_Unitario_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Produto_Valor_Total_Registro) + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '0.00' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '0' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + 'UND' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                             Comando_SQL := Comando_SQL + #39 + Trim(Produto_Codigo_Registro) + #39 + ') ';

                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                             ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;

                             //*** Registra o Produto se Não Existir ***
                             ConexaoBD.SQL_Comunitario_SecundarioD.Close;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                             ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add('SELECT * FROM mgt_produtos WHERE mgt_produto_codigo_barras = ' +#39+ Trim(Produto_Codigo_Registro) +#39+ ' ');
                             ConexaoBD.SQL_Comunitario_SecundarioD.Open;

                             If ConexaoBD.SQL_Comunitario_SecundarioD.Eof Then
                                Begin
                                ConexaoBD.SQL_Produtos.Close;
                                ConexaoBD.SQL_Produtos.SQL.Clear;
                                ConexaoBD.SQL_Produtos.SQL.Add('SELECT * FROM Produtos WHERE Produto_Cod_Barra = ' +#39+ Trim(Produto_Codigo_Registro) +#39+ '');
                                ConexaoBD.SQL_Produtos.Open;

                                Comando_SQL := 'INSERT INTO mgt_produtos(';
                                Comando_SQL := Comando_SQL + 'mgt_produto_codigo, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_descricao, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_peso, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_unidade, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_tipo, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_estoque_inicial, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_estoque_atual, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_unidade_pesagem, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_classif_tributaria, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_classif_fiscal, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_codigo_barras, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_lote, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_preco, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_data_alteracao, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_ipi, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_icms, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_fornecedor, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_estoque_minimo, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_estoque_ideal, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_valor_compra, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_custo_medio, ';
                                Comando_SQL := Comando_SQL + 'mgt_produto_ncm) ';
                                Comando_SQL := Comando_SQL + 'VALUES(';
                                Comando_SQL := Comando_SQL + #39 + Trim(Produto_Codigo_Registro) + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Trim(UpperCase(Produto_Descricao_Registro)) + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + 'UND' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '1' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + 'KG' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Trim(Produto_Codigo_Registro) + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Produto_Valor_Unitario_Registro) + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.000' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Produto_Valor_Unitario_Registro) + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + '0.00' + #39 + ', ';
                                Comando_SQL := Comando_SQL + #39 + Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_NCM').Text) + #39 + ') ';

                                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Clear;
                                ConexaoBD.SQL_Comunitario_SecundarioD.SQL.Add(Comando_SQL);
                                ConexaoBD.SQL_Comunitario_SecundarioD.ExecSQL;
                             End;
                          End;
                       End;
                 End;

                 //*** Fecha o Arquivo de Leitura ***
                 Closefile(Arquivo_Leitura);

                 //*** Prepara o Arquivo de Importação ***
                 If FileExists('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\' + Trim(Arquivo_Origem)) Then
                    Begin
                    DeleteFile('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\' + Trim(Arquivo_Origem));
                 End;

                 //*** Registra o Cliente ***
                 If Trim(CPF_Registro) <> '' Then
                    Begin
                    If Length(Trim(CPF_Registro)) > 11 Then
                       Begin
                       CPF_Registro := completa_zeros(CPF_Registro,14);
                       End
                    Else
                       Begin
                       CPF_Registro := completa_zeros(CPF_Registro,11);
                    End;

                    //*** Registra o Cliente se Não Existir ***
                    ConexaoBD.SQL_Comunitario.SQL.Clear;
                    ConexaoBD.SQL_Comunitario.SQL.Add('INSERT INTO mgt_clientes(mgt_cliente_codigo) SELECT * FROM (SELECT ' +#39+ Trim(CPF_Registro) +#39+ ') AS tmp WHERE NOT EXISTS (SELECT mgt_cliente_codigo FROM mgt_clientes WHERE mgt_cliente_codigo = ' +#39+ Trim(CPF_Registro) +#39+ ') LIMIT 1');
                    ConexaoBD.SQL_Comunitario.ExecSQL;
                 End;

                 //*** Atualiza o Grid ***
                 BT_ProcurarClick(Sender);

                 Seta();

                 MSG_Erro('Pedido gerado!' + Chr(13) + Chr(10) + Chr(13) + Chr(10) + 'Acesse a área de Pedidos do ManagerTEX e envie o Pedido para Faturamento!' + Chr(13) + Chr(10) + '- Clique na opção: Nota Fiscal para Consumo; ' + Chr(13) + Chr(10) + '- Esolhca o CFOP: (CONSUMIDOR); ');

                 //*** Abre o Chrome para a Emissão da Nota Fiscal ***

                 //*** Demais Máquinas ***
                 //winExec(PChar('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://vidaperfeita-pc/managertex/index.php'), SW_MAXIMIZE);

                 //*** Balcão ***
                 winExec(PChar('C:\Users\Seven\AppData\Local\Google\Chrome\Application\chrome.exe http://vidaperfeita-pc/managertex/index.php'), SW_MAXIMIZE);

                 //*** Fecha a Tela de Notas Fiscais ***
                 NotasFiscais02.Close;
              End;
           End;
        End;
     End;
end;

end.
