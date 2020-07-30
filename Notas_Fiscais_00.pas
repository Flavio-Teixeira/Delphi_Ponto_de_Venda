unit Notas_Fiscais_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, Gauges,
  xmldom, XMLIntf, msxmldom, XMLDoc, DelphiZXingQRCode;
  
type
  TNotasFiscais00 = class(TForm)
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
    PaintBoxQRCode: TPaintBox;
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
  NotasFiscais00: TNotasFiscais00;

implementation

uses Rotinas_Gerais, Conexao_BD, Login_00, Rel_Cupom_Fiscal_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TNotasFiscais00.completa_zeros(texto: String; tamanho: Integer): String;

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

function TNotasFiscais00.retira_acentos(texto:String; tamanho:Integer): String;

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

         texto := Troca_Caracter('Ç', 'C', texto);

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

procedure TNotasFiscais00.FormShow(Sender: TObject);
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

procedure TNotasFiscais00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais00.BT_SairClick(Sender: TObject);
begin
    NotasFiscais00.Close;
end;

procedure TNotasFiscais00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TNotasFiscais00.BT_ProcurarClick(Sender: TObject);

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

procedure TNotasFiscais00.DBGrid_PedidosDrawColumnCell(
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

procedure TNotasFiscais00.DBGrid_PedidosDblClick(Sender: TObject);

var
   QRCode: TDelphiZXingQRCode;
   QRCodeBitmap: TBitmap;
   Row, Column: Integer;

   Comando_SQL, CPF_Cliente, Numero_Nota: String;
   Imprime_Nota: Boolean;

   NFe_TXT: TextFile;
   Grava_Linha, Tipo_Pgto, Arquivo_XML: String;

   Sequencia_Item, I: Integer;
   Tributos_Unitario, Tributos_Total, Valor_Total: Real;

   vXMLDoc: TXMLDocument;
   NodePai,NodeSec,NodeTmp: IXMLNode;

   CFe_CNPJ, CFe_xNome, CFe_xFant, CFe_IE: String;
   CFe_xLgr, CFe_nro, CFe_xBairro, CFe_xMun, CFe_CEP: String;
   CFe_nserieSAT, CFe_nCFe, CFe_dEmi, CFe_hEmi, CFe_assinaturaQRCODE: String;
   CFe_consCNPJ, CFe_consCPF: String;
   CFe_cMP, CFe_vMP: String;
   CFe_infCpl: String;
   CFe_Chave_Acesso: String;
   CFe_cProd, CFe_xProd, CFe_NCM, CFe_CFOP, CFe_uCom, CFe_qCom, CFe_vUnCom: Array[0..999] of String;
                                                       
begin
     If (DBGrid_Pedidos.Fields[0].Text <> '') AND (DBGrid_Pedidos.Fields[5].Text = 'Aguardando') Then
        Begin
        Ampulheta();

        //*** Seleciona os Itens para a Emissão da Nota Fiscal ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons Where ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = ' +#39+ Trim(DBGrid_Pedidos.Fields[0].Text) +#39+ ' AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes_Rel.Close;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes_Rel.Open;

        Seta();

        CPF_Cliente  := InputBox('CPF ou CNPJ', 'Por favor, informe o CPF ou CNPJ do Cliente, caso não possua, deixe-o em branco:', CPF_Cliente);
        Imprime_Nota := True;

        If Trim(CPF_Cliente) = '' Then
           Begin
           If Confirma('O CPF ou CNPJ não foi informado, imprime a Nota Fiscal sem CPF ou CNPJ?') = 6 Then
              Begin
              Imprime_Nota := True;
              End
           Else
              Begin
              Imprime_Nota := False;              
           End;
        End;

        //*** Prepara a Geração da Nota Fiscal ***
        If Imprime_Nota = True  Then
           Begin
           Ampulheta();

           //*** Obtem o Número da Última Nota Fiscal ***
           ConexaoBD.SQL_Numero_Nota.Close;
           ConexaoBD.SQL_Numero_Nota.SQL.Clear;
           ConexaoBD.SQL_Numero_Nota.SQL.Add('SELECT * FROM Numero_Nota_Fiscal');
           ConexaoBD.SQL_Numero_Nota.Open;

           Numero_Nota := IntToStr(StrToInt(ConexaoBD.SQL_Numero_Nota.FieldByName('Numero_Nota_Fiscal_Emitida').Text) + 1);

           //*** Registra o Número da Nota Fiscal Atual ***
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('UPDATE Numero_Nota_Fiscal SET Numero_Nota_Fiscal_Emitida = ' + Trim(Numero_Nota) );
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Registra o Cliente na Cabeça do Cupom ***
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('UPDATE Cabeca_Cupons SET Cabeca_Cupom_Cliente_Codigo = ' +#39+ Trim(CPF_Cliente) +#39+ ', Cabeca_Cupom_Cliente_Status = ' +#39+ 'CFe:' + Trim(Numero_Nota) +#39+ ' WHERE Cabeca_Cupom_Numero = ' +#39+ Trim(DBGrid_Pedidos.Fields[0].Text) +#39);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Prepara o Arquivo de Importação ***
           If FileExists('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\CFe_' + Trim(Numero_Nota) + '.xml') Then
              Begin
              DeleteFile('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\CFe_' + Trim(Numero_Nota) + '.xml');
           End;

           //*** Gera o XML ***
           AssignFile(NFe_TXT,'\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\CFe_' + Trim(Numero_Nota) + '.xml');
           Rewrite(NFe_TXT);

           //*** Gera o Cabeçalho ***
           Grava_Linha := '<?xml version="1.0" encoding="UTF-8"?>';
           Grava_Linha := Grava_Linha + '<CFe>';
           Grava_Linha := Grava_Linha + '<infCFe versaoDadosEnt="0.07">';
           Grava_Linha := Grava_Linha + '<ide>';
           Grava_Linha := Grava_Linha + '<CNPJ>51017952000159</CNPJ>';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := '<signAC>GQQjdWEsKbh283JTWpDK+VQMuTcgbvB71lkyWzcRgL8J/vsGWVu6Qh5vHiuk1ndHqhZ';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := '4mBbzvgNbpnFzEmRnkqpMUJ4e0Qfbia3htvP6NHd/7MbX1aiXnqrn5ozfpMWivK7mesrvhg/g1UvkOXr1U6HVBsiAum';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := 'SnpxYrPYW8COhs3nWKkI/PAivkxYm9SNsrPPMZISHsmsErtua0u5LjZK5i1iTyiOqFx9QaG5ucJMNeAhbUjdONgjxf2';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := 'IMwxzOf8JmC6jMRvpQ21IE2Kng0/DM5NDS3r36fJi3XoZL1NTCGMUX79WZ9N9V2m/EkxH5LvO+bO/lhE3+q1jtb02Mc';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := 'uw==</signAC>';
           Write(NFe_TXT,Grava_Linha);

           Grava_Linha := '<numeroCaixa>001</numeroCaixa>';
           Grava_Linha := Grava_Linha + '</ide>';
           Grava_Linha := Grava_Linha + '<emit>';
           Grava_Linha := Grava_Linha + '<CNPJ>51017952000159</CNPJ>';
           Grava_Linha := Grava_Linha + '<IE>636078404110</IE>';
           Grava_Linha := Grava_Linha + '<cRegTribISSQN>1</cRegTribISSQN>';
           Grava_Linha := Grava_Linha + '<indRatISSQN>N</indRatISSQN>';
           Grava_Linha := Grava_Linha + '</emit>';
           Write(NFe_TXT,Grava_Linha);

           //*** Grava o CPF/CNPJ ***
           If Trim(CPF_Cliente) <> '' Then
              Begin
              If Length(Trim(CPF_Cliente)) > 11 Then
                 Begin
                 CPF_Cliente := completa_zeros(CPF_Cliente,14);
                 End
              Else
                 Begin
                 CPF_Cliente := completa_zeros(CPF_Cliente,11);
              End;

              //*** Registra o Cliente se Não Existir ***
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add('INSERT INTO mgt_clientes(mgt_cliente_codigo) SELECT * FROM (SELECT ' +#39+ Trim(CPF_Cliente) +#39+ ') AS tmp WHERE NOT EXISTS (SELECT mgt_cliente_codigo FROM mgt_clientes WHERE mgt_cliente_codigo = ' +#39+ Trim(CPF_Cliente) +#39+ ') LIMIT 1');
              ConexaoBD.SQL_Comunitario.ExecSQL;

              //*** Gera o CPF/CNPJ ***
              If Length(Trim(CPF_Cliente)) > 11 Then
                 Begin
                 Grava_Linha := '<dest><CNPJ>' + Trim(CPF_Cliente) + '</CNPJ></dest>';
                 End
              Else
                 Begin
                 Grava_Linha := '<dest><CPF>' + Trim(CPF_Cliente) + '</CPF></dest>';
              End;

              End
           Else
              Begin
              Grava_Linha := '<dest />';
           End;
           Write(NFe_TXT,Grava_Linha);

           //*** Grava a Linha dos Itens ***
           Sequencia_Item    := 0;
           Tributos_Unitario := 0;
           Tributos_Total    := 0;
           Valor_Total       := 0;

           //*** Meios de Pagamento ***
           //*** No CFe: 01-Dinheiro | 02-Cheque | 03-Cartão de Crédito | 04-Cartão de Débito ***
           //*** No PDV: D-Dinheiro  | H-Cheque  | R-Cartão Crédito     | C-Cartão Débito     ***

           If Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Cabeca_Cupom_Forma_Pgto').Text) = 'D' Then
              Begin
              Tipo_Pgto := '01';
              End
           Else If Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Cabeca_Cupom_Forma_Pgto').Text) = 'H' Then
              Begin
              Tipo_Pgto := '02';
              End
           Else If Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Cabeca_Cupom_Forma_Pgto').Text) = 'R' Then
              Begin
              Tipo_Pgto := '03';
              End
           Else If Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Cabeca_Cupom_Forma_Pgto').Text) = 'C' Then
              Begin
              Tipo_Pgto := '04';
           End;

           Valor_Total := StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Cabeca_Cupom_Vlr_Total').Text)));

           While Not ConexaoBD.SQL_Compras_Clientes_Rel.Eof Do
                 Begin
                 Sequencia_Item := Sequencia_Item + 1;

                 Tributos_Unitario := ((StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Corpo_Cupom_Prod_Qtde').Text))) * (StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Corpo_Cupom_Prod_Vlr_Unitario').Text)))) * 5.47) / 100);
                 Tributos_Total    := Tributos_Total + Tributos_Unitario;

                 //*** Seleciona o Produto ***
                 Comando_SQL := 'SELECT * FROM Produtos WHERE Produto_Codigo = ' + Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Corpo_Cupom_Prod_Codigo').Text);

                 ConexaoBD.SQL_Produtos.Close;
                 ConexaoBD.SQL_Produtos.SQL.Clear;
                 ConexaoBD.SQL_Produtos.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Produtos.Open;

                 //*** Gera o Detalhe do Item ***
                 Grava_Linha := '<det nItem="' + Trim(IntToStr(Sequencia_Item)) + '">';

                 Grava_Linha := Grava_Linha + '<prod>';
                 Grava_Linha := Grava_Linha + '<cProd>' + Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_Cod_Barra').Text) + '</cProd>';
                 Grava_Linha := Grava_Linha + '<xProd>' + retira_acentos(Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_Descricao').Text),0) + '</xProd>';
                 Grava_Linha := Grava_Linha + '<NCM>' + Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_NCM').Text) + '</NCM>';
                 Grava_Linha := Grava_Linha + '<CFOP>5102</CFOP>';
                 Grava_Linha := Grava_Linha + '<uCom>' + Trim(ConexaoBD.SQL_Produtos.FieldByName('Produto_Unidade').Text) + '</uCom>';
                 Grava_Linha := Grava_Linha + '<qCom>' + Virgula_Ponto(FormatFloat('0.0000',(StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Corpo_Cupom_Prod_Qtde').Text)))))) + '</qCom>';
                 Grava_Linha := Grava_Linha + '<vUnCom>' + Virgula_Ponto(FormatFloat('0.000',(StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Compras_Clientes_Rel.FieldByName('Corpo_Cupom_Prod_Vlr_Unitario').Text)))))) + '</vUnCom>';
                 Grava_Linha := Grava_Linha + '<indRegra>A</indRegra>';
                 Grava_Linha := Grava_Linha + '</prod>';

                 Grava_Linha := Grava_Linha + '<imposto>';
                 Grava_Linha := Grava_Linha + '<vItem12741>' + Virgula_Ponto(FormatFloat('0.00',Tributos_Unitario)) + '</vItem12741>';
                 Grava_Linha := Grava_Linha + '<ICMS>';
                 Grava_Linha := Grava_Linha + '<ICMSSN102>';
                 Grava_Linha := Grava_Linha + '<Orig>0</Orig>';
                 Grava_Linha := Grava_Linha + '<CSOSN>102</CSOSN>';
                 Grava_Linha := Grava_Linha + '</ICMSSN102>';
                 Grava_Linha := Grava_Linha + '</ICMS>';
                 Grava_Linha := Grava_Linha + '<PIS>';
                 Grava_Linha := Grava_Linha + '<PISNT>';
                 Grava_Linha := Grava_Linha + '<CST>07</CST>';
                 Grava_Linha := Grava_Linha + '</PISNT>';
                 Grava_Linha := Grava_Linha + '</PIS>';
                 Grava_Linha := Grava_Linha + '<COFINS>';
                 Grava_Linha := Grava_Linha + '<COFINSSN>';
                 Grava_Linha := Grava_Linha + '<CST>49</CST>';
                 Grava_Linha := Grava_Linha + '</COFINSSN>';
                 Grava_Linha := Grava_Linha + '</COFINS>';
                 Grava_Linha := Grava_Linha + '</imposto>';

                 Grava_Linha := Grava_Linha + '</det>';

                 Write(NFe_TXT,Grava_Linha);

                 ConexaoBD.SQL_Compras_Clientes_Rel.Next;
           End;

           Grava_Linha := '<total />';
           Grava_Linha := Grava_Linha + '<pgto>';
           Grava_Linha := Grava_Linha + '<MP>';
           Grava_Linha := Grava_Linha + '<cMP>' + Trim(Tipo_Pgto) + '</cMP>';
           Grava_Linha := Grava_Linha + '<vMP>' + Virgula_Ponto(FormatFloat('0.00',Valor_Total)) + '</vMP>';
           Grava_Linha := Grava_Linha + '</MP>';
           Grava_Linha := Grava_Linha + '</pgto>';
           Grava_Linha := Grava_Linha + '<infAdic>';
           Grava_Linha := Grava_Linha + '<infCpl>Documento emitido por ME ou EPP optante pelo SIMPLES NACIONAL // Valor aproximado dos tributos deste cupom R$ ' + Ponto_Virgula(FormatFloat('0.00',Tributos_Total)) + ' (conforme Lei Fed. 12.741/2012)</infCpl>';
           Grava_Linha := Grava_Linha + '</infAdic>';
           Grava_Linha := Grava_Linha + '</infCFe>';
           Grava_Linha := Grava_Linha + '</CFe>';
           Write(NFe_TXT,Grava_Linha);

           CloseFile(NFe_TXT);

           //*** Atualiza o Grid ***
           BT_ProcurarClick(Sender);

           Seta();

           MSG_Erro('Geração do XML concluída, por favor, importe o arquivo localizado em: \\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\CFe_' + Trim(Numero_Nota) + '.xml para o ELGIN-SAT e utilize a opção: ENVIAR DADOS VENDA. Após a transmissão, clique novamente sob o XML que está em verde no GRID.');
        End;
        End
     Else If (DBGrid_Pedidos.Fields[0].Text <> '') AND ( Copy(Trim(DBGrid_Pedidos.Fields[5].Text),1,4) = 'CFe:') Then
        Begin

        Arquivo_XML := 'CFe_' + Copy(Trim(DBGrid_Pedidos.Fields[5].Text),5,(Length(Trim(DBGrid_Pedidos.Fields[5].Text)) - 4)) + '.xml';

        //*** Prepara a Leitura do XML ***
        If FileExists('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\resp_' + Trim(Arquivo_XML)) Then
           Begin

           Ampulheta();

           //*** Copia o XML para a Rede ***
           If Not FileExists('\\VIDAPERFEITA-PC\NFe\' + Trim(Arquivo_XML)) Then
              Begin
              CopyFile(PChar('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\resp_' + Trim(Arquivo_XML)),PChar('\\VIDAPERFEITA-PC\NFe\' + Trim(Arquivo_XML)),True);
           End;

           //*** Apaga o Arquivo de Importação ***
           If FileExists('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\' + Trim(Arquivo_XML)) Then
              Begin
              DeleteFile('\\VIDAPERFEITA-PC\downloads\Importa_Nota_Fiscal_Paulista\' + Trim(Arquivo_XML));
           End;

           //*** Cria a variável baseada no TXMLDocument ***
           vXMLDoc := TXMLDocument.Create(self);

           //*** Le conteúdo do arquivo XML informado ***
           vXMLDoc.LoadFromFile('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\resp_' + Trim(Arquivo_XML));

           //*************************************************
           //*** Detalhes do Cupom Fiscal Eletrônico (CFe) ***
           //*************************************************

           //****************
           //*** EMITENTE ***
           //****************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('emit');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_CNPJ  := NodeSec.ChildNodes['CNPJ'].Text;
           CFe_xNome := NodeSec.ChildNodes['xNome'].Text;
           CFe_xFant := NodeSec.ChildNodes['xFant'].Text;
           CFe_IE    := NodeSec.ChildNodes['IE'].Text;

           //****************
           //*** ENDEREÇO ***
           //****************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('emit');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Referencia a TAG desejada ***
           NodeTmp  := NodeSec.ChildNodes['enderEmit'];

           //*** Se posiciona no início da referência ***
           NodeTmp.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_xLgr    := NodeTmp.ChildNodes['xLgr'].Text;
           CFe_nro     := NodeTmp.ChildNodes['nro'].Text;
           CFe_xBairro := NodeTmp.ChildNodes['xBairro'].Text;
           CFe_xMun    := NodeTmp.ChildNodes['xMun'].Text;
           CFe_CEP     := NodeTmp.ChildNodes['CEP'].Text;

           //*****************
           //*** DADOS SAT ***
           //*****************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('ide');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_nserieSAT := NodeSec.ChildNodes['nserieSAT'].Text;
           CFe_nCFe      := NodeSec.ChildNodes['nCFe'].Text;
           CFe_dEmi      := NodeSec.ChildNodes['dEmi'].Text;
           CFe_hEmi      := NodeSec.ChildNodes['hEmi'].Text;

           CFe_assinaturaQRCODE := NodeSec.ChildNodes['assinaturaQRCODE'].Text;

           //***************************
           //*** CONSUMIDOR CNPJ/CPF ***
           //***************************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('dest');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_consCNPJ := NodeSec.ChildNodes['CNPJ'].Text;
           CFe_consCPF  := NodeSec.ChildNodes['CPF'].Text;

           //****************
           //*** PRODUTOS ***
           //****************

           //*** Inicializa o Vetor ***
           I := 0;

           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('det');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;
           repeat
                 //*** Referencia a TAG desejada ***
                 NodeTmp  := NodeSec.ChildNodes['prod'];

                 //*** Se posiciona no início da referência ***
                 NodeTmp.ChildNodes.First;
                 repeat
                       //*** Obtem os dados desejados dentro da TAG referenciada ***
                       If Trim(NodeTmp.ChildNodes['cProd'].Text) <> '' Then
                          Begin
                          CFe_cProd[I]  := NodeTmp.ChildNodes['cProd'].Text;
                          CFe_xProd[I]  := NodeTmp.ChildNodes['xProd'].Text;
                          CFe_NCM[I]    := NodeTmp.ChildNodes['NCM'].Text;
                          CFe_CFOP[I]   := NodeTmp.ChildNodes['CFOP'].Text;
                          CFe_uCom[I]   := NodeTmp.ChildNodes['uCom'].Text;
                          CFe_qCom[I]   := NodeTmp.ChildNodes['qCom'].Text;
                          CFe_vUnCom[I] := NodeTmp.ChildNodes['vUnCom'].Text;

                          //*** Gera o Próximo Vetor ***
                          I := I + 1;
                       End;

                       //*** Posiciona na Próxima Ocorrência ***
                       NodeTmp := NodeTmp.NextSibling;
                 until NodeTmp = nil;

                 //*** Posiciona na Próxima Ocorrência ***
                 NodeSec := NodeSec.NextSibling;

           until NodeSec = nil;

           //**************
           //*** TOTAIS ***
           //**************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('pgto');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Referencia a TAG desejada ***
           NodeTmp  := NodeSec.ChildNodes['MP'];

           //*** Se posiciona no início da referência ***
           NodeTmp.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_cMP  := NodeTmp.ChildNodes['cMP'].Text;
           CFe_vMP  := NodeTmp.ChildNodes['vMP'].Text;

           //**********************************
           //*** INFORMAÇÕES COMPLEMENTARES ***
           //**********************************
           //*** Localiza a Primeira Ocorrência da TAG ***
           NodePai := vXMLDoc.DocumentElement.childNodes.First.ChildNodes.FindNode('infAdic');
           NodeSec := NodePai;

           //*** Posiciona o primeiro elemento encontrado ***
           NodeSec.ChildNodes.First;

           //*** Obtem os dados desejados dentro da TAG referenciada ***
           CFe_infCpl := NodeSec.ChildNodes['infCpl'].Text;

           //***********************
           //*** Chave de Acesso ***
           //***********************
           CFe_Chave_Acesso := Copy(Trim(VXMLDoc.XML.Text),ansipos('infCFe Id="CFe',Trim(VXMLDoc.XML.Text))+14,44);

           //*** Prepara do Relatório do Cupom Fiscal ***

           Application.CreateForm(TRelCupomFiscal00,RelCupomFiscal00);

           //*** Prepara o Cabeçalho do Cupom ***

           //*** Carrega os Valores do Cabeçalho ***
           RelCupomFiscal00.QR_CFe_Nome_Fantasia.Caption := CFe_xFant;
           RelCupomFiscal00.QR_CFe_Razao_Social.Caption  := CFe_xNome;
           RelCupomFiscal00.QR_CFe_Logradouro.Caption    := Trim(CFe_xLgr) + ', ' + Trim(CFe_nro);
           RelCupomFiscal00.QR_CFe_Cidade.Caption        := Trim(CFe_xBairro) + ' - ' + Trim(CFe_xMun) + ' - ' + 'SP' + ' - CEP: ' + Trim(CFe_CEP);
           RelCupomFiscal00.QR_CFe_CNPJ.Caption          := CFe_CNPJ;
           RelCupomFiscal00.QR_CFe_IE.Caption            := CFe_IE;
           RelCupomFiscal00.QR_CFe_Nro_Cupom.Caption     := CFe_nCFe;

           If Trim(CFe_consCNPJ) <> '' Then
              Begin
              RelCupomFiscal00.QR_CFe_Consumidor_CNPJ_CPF.Caption := 'CNPJ - ' + Trim(CFe_consCNPJ);
              End
           Else If Trim(CFe_consCPF) <> '' Then
              Begin
              RelCupomFiscal00.QR_CFe_Consumidor_CNPJ_CPF.Caption := 'CPF - ' + Trim(CFe_consCPF);
              End
           Else
              Begin
              RelCupomFiscal00.QR_CFe_Consumidor_CNPJ_CPF.Caption := 'Não Identificado';
           End;

           //*** Lista os Itens do Cupom ***
           //*** Limpa os Campos dos Itens ***
           RelCupomFiscal00.Item1.Caption   := '';
           RelCupomFiscal00.Codigo1.Caption := '';
           RelCupomFiscal00.Qtde1.Caption   := '';
           RelCupomFiscal00.Und1.Caption    := '';
           RelCupomFiscal00.VUnit1.Caption  := '';
           RelCupomFiscal00.VTrib1.Caption  := '';
           RelCupomFiscal00.VItem1.Caption  := '';
           RelCupomFiscal00.Descricao1.Caption := '';

           RelCupomFiscal00.Item2.Caption   := '';
           RelCupomFiscal00.Codigo2.Caption := '';
           RelCupomFiscal00.Qtde2.Caption   := '';
           RelCupomFiscal00.Und2.Caption    := '';
           RelCupomFiscal00.VUnit2.Caption  := '';
           RelCupomFiscal00.VTrib2.Caption  := '';
           RelCupomFiscal00.VItem2.Caption  := '';
           RelCupomFiscal00.Descricao2.Caption := '';

           RelCupomFiscal00.Item3.Caption   := '';
           RelCupomFiscal00.Codigo3.Caption := '';
           RelCupomFiscal00.Qtde3.Caption   := '';
           RelCupomFiscal00.Und3.Caption    := '';
           RelCupomFiscal00.VUnit3.Caption  := '';
           RelCupomFiscal00.VTrib3.Caption  := '';
           RelCupomFiscal00.VItem3.Caption  := '';
           RelCupomFiscal00.Descricao3.Caption := '';

           RelCupomFiscal00.Item4.Caption   := '';
           RelCupomFiscal00.Codigo4.Caption := '';
           RelCupomFiscal00.Qtde4.Caption   := '';
           RelCupomFiscal00.Und4.Caption    := '';
           RelCupomFiscal00.VUnit4.Caption  := '';
           RelCupomFiscal00.VTrib4.Caption  := '';
           RelCupomFiscal00.VItem4.Caption  := '';
           RelCupomFiscal00.Descricao4.Caption := '';

           RelCupomFiscal00.Item5.Caption   := '';
           RelCupomFiscal00.Codigo5.Caption := '';
           RelCupomFiscal00.Qtde5.Caption   := '';
           RelCupomFiscal00.Und5.Caption    := '';
           RelCupomFiscal00.VUnit5.Caption  := '';
           RelCupomFiscal00.VTrib5.Caption  := '';
           RelCupomFiscal00.VItem5.Caption  := '';
           RelCupomFiscal00.Descricao5.Caption := '';

           RelCupomFiscal00.Item6.Caption   := '';
           RelCupomFiscal00.Codigo6.Caption := '';
           RelCupomFiscal00.Qtde6.Caption   := '';
           RelCupomFiscal00.Und6.Caption    := '';
           RelCupomFiscal00.VUnit6.Caption  := '';
           RelCupomFiscal00.VTrib6.Caption  := '';
           RelCupomFiscal00.VItem6.Caption  := '';
           RelCupomFiscal00.Descricao6.Caption := '';

           RelCupomFiscal00.Item7.Caption   := '';
           RelCupomFiscal00.Codigo7.Caption := '';
           RelCupomFiscal00.Qtde7.Caption   := '';
           RelCupomFiscal00.Und7.Caption    := '';
           RelCupomFiscal00.VUnit7.Caption  := '';
           RelCupomFiscal00.VTrib7.Caption  := '';
           RelCupomFiscal00.VItem7.Caption  := '';
           RelCupomFiscal00.Descricao7.Caption := '';

           RelCupomFiscal00.Item8.Caption   := '';
           RelCupomFiscal00.Codigo8.Caption := '';
           RelCupomFiscal00.Qtde8.Caption   := '';
           RelCupomFiscal00.Und8.Caption    := '';
           RelCupomFiscal00.VUnit8.Caption  := '';
           RelCupomFiscal00.VTrib8.Caption  := '';
           RelCupomFiscal00.VItem8.Caption  := '';
           RelCupomFiscal00.Descricao8.Caption := '';

           RelCupomFiscal00.Item9.Caption   := '';
           RelCupomFiscal00.Codigo9.Caption := '';
           RelCupomFiscal00.Qtde9.Caption   := '';
           RelCupomFiscal00.Und9.Caption    := '';
           RelCupomFiscal00.VUnit9.Caption  := '';
           RelCupomFiscal00.VTrib9.Caption  := '';
           RelCupomFiscal00.VItem9.Caption  := '';
           RelCupomFiscal00.Descricao9.Caption := '';

           RelCupomFiscal00.Item10.Caption   := '';
           RelCupomFiscal00.Codigo10.Caption := '';
           RelCupomFiscal00.Qtde10.Caption   := '';
           RelCupomFiscal00.Und10.Caption    := '';
           RelCupomFiscal00.VUnit10.Caption  := '';
           RelCupomFiscal00.VTrib10.Caption  := '';
           RelCupomFiscal00.VItem10.Caption  := '';
           RelCupomFiscal00.Descricao10.Caption := '';

           RelCupomFiscal00.Item11.Caption   := '';
           RelCupomFiscal00.Codigo11.Caption := '';
           RelCupomFiscal00.Qtde11.Caption   := '';
           RelCupomFiscal00.Und11.Caption    := '';
           RelCupomFiscal00.VUnit11.Caption  := '';
           RelCupomFiscal00.VTrib11.Caption  := '';
           RelCupomFiscal00.VItem11.Caption  := '';
           RelCupomFiscal00.Descricao11.Caption := '';

           RelCupomFiscal00.Item12.Caption   := '';
           RelCupomFiscal00.Codigo12.Caption := '';
           RelCupomFiscal00.Qtde12.Caption   := '';
           RelCupomFiscal00.Und12.Caption    := '';
           RelCupomFiscal00.VUnit12.Caption  := '';
           RelCupomFiscal00.VTrib12.Caption  := '';
           RelCupomFiscal00.VItem12.Caption  := '';
           RelCupomFiscal00.Descricao12.Caption := '';

           RelCupomFiscal00.Item13.Caption   := '';
           RelCupomFiscal00.Codigo13.Caption := '';
           RelCupomFiscal00.Qtde13.Caption   := '';
           RelCupomFiscal00.Und13.Caption    := '';
           RelCupomFiscal00.VUnit13.Caption  := '';
           RelCupomFiscal00.VTrib13.Caption  := '';
           RelCupomFiscal00.VItem13.Caption  := '';
           RelCupomFiscal00.Descricao13.Caption := '';

           RelCupomFiscal00.Item14.Caption   := '';
           RelCupomFiscal00.Codigo14.Caption := '';
           RelCupomFiscal00.Qtde14.Caption   := '';
           RelCupomFiscal00.Und14.Caption    := '';
           RelCupomFiscal00.VUnit14.Caption  := '';
           RelCupomFiscal00.VTrib14.Caption  := '';
           RelCupomFiscal00.VItem14.Caption  := '';
           RelCupomFiscal00.Descricao14.Caption := '';

           RelCupomFiscal00.Item15.Caption   := '';
           RelCupomFiscal00.Codigo15.Caption := '';
           RelCupomFiscal00.Qtde15.Caption   := '';
           RelCupomFiscal00.Und15.Caption    := '';
           RelCupomFiscal00.VUnit15.Caption  := '';
           RelCupomFiscal00.VTrib15.Caption  := '';
           RelCupomFiscal00.VItem15.Caption  := '';
           RelCupomFiscal00.Descricao15.Caption := '';

           RelCupomFiscal00.Item16.Caption   := '';
           RelCupomFiscal00.Codigo16.Caption := '';
           RelCupomFiscal00.Qtde16.Caption   := '';
           RelCupomFiscal00.Und16.Caption    := '';
           RelCupomFiscal00.VUnit16.Caption  := '';
           RelCupomFiscal00.VTrib16.Caption  := '';
           RelCupomFiscal00.VItem16.Caption  := '';
           RelCupomFiscal00.Descricao16.Caption := '';

           RelCupomFiscal00.Item17.Caption   := '';
           RelCupomFiscal00.Codigo17.Caption := '';
           RelCupomFiscal00.Qtde17.Caption   := '';
           RelCupomFiscal00.Und17.Caption    := '';
           RelCupomFiscal00.VUnit17.Caption  := '';
           RelCupomFiscal00.VTrib17.Caption  := '';
           RelCupomFiscal00.VItem17.Caption  := '';
           RelCupomFiscal00.Descricao17.Caption := '';

           RelCupomFiscal00.Item18.Caption   := '';
           RelCupomFiscal00.Codigo18.Caption := '';
           RelCupomFiscal00.Qtde18.Caption   := '';
           RelCupomFiscal00.Und18.Caption    := '';
           RelCupomFiscal00.VUnit18.Caption  := '';
           RelCupomFiscal00.VTrib18.Caption  := '';
           RelCupomFiscal00.VItem18.Caption  := '';
           RelCupomFiscal00.Descricao18.Caption := '';

           RelCupomFiscal00.Item19.Caption   := '';
           RelCupomFiscal00.Codigo19.Caption := '';
           RelCupomFiscal00.Qtde19.Caption   := '';
           RelCupomFiscal00.Und19.Caption    := '';
           RelCupomFiscal00.VUnit19.Caption  := '';
           RelCupomFiscal00.VTrib19.Caption  := '';
           RelCupomFiscal00.VItem19.Caption  := '';
           RelCupomFiscal00.Descricao19.Caption := '';

           RelCupomFiscal00.Item20.Caption   := '';
           RelCupomFiscal00.Codigo20.Caption := '';
           RelCupomFiscal00.Qtde20.Caption   := '';
           RelCupomFiscal00.Und20.Caption    := '';
           RelCupomFiscal00.VUnit20.Caption  := '';
           RelCupomFiscal00.VTrib20.Caption  := '';
           RelCupomFiscal00.VItem20.Caption  := '';
           RelCupomFiscal00.Descricao20.Caption := '';

           RelCupomFiscal00.Item21.Caption   := '';
           RelCupomFiscal00.Codigo21.Caption := '';
           RelCupomFiscal00.Qtde21.Caption   := '';
           RelCupomFiscal00.Und21.Caption    := '';
           RelCupomFiscal00.VUnit21.Caption  := '';
           RelCupomFiscal00.VTrib21.Caption  := '';
           RelCupomFiscal00.VItem21.Caption  := '';
           RelCupomFiscal00.Descricao21.Caption := '';

           RelCupomFiscal00.Item22.Caption   := '';
           RelCupomFiscal00.Codigo22.Caption := '';
           RelCupomFiscal00.Qtde22.Caption   := '';
           RelCupomFiscal00.Und22.Caption    := '';
           RelCupomFiscal00.VUnit22.Caption  := '';
           RelCupomFiscal00.VTrib22.Caption  := '';
           RelCupomFiscal00.VItem22.Caption  := '';
           RelCupomFiscal00.Descricao22.Caption := '';

           RelCupomFiscal00.Item23.Caption   := '';
           RelCupomFiscal00.Codigo23.Caption := '';
           RelCupomFiscal00.Qtde23.Caption   := '';
           RelCupomFiscal00.Und23.Caption    := '';
           RelCupomFiscal00.VUnit23.Caption  := '';
           RelCupomFiscal00.VTrib23.Caption  := '';
           RelCupomFiscal00.VItem23.Caption  := '';
           RelCupomFiscal00.Descricao23.Caption := '';

           RelCupomFiscal00.Item24.Caption   := '';
           RelCupomFiscal00.Codigo24.Caption := '';
           RelCupomFiscal00.Qtde24.Caption   := '';
           RelCupomFiscal00.Und24.Caption    := '';
           RelCupomFiscal00.VUnit24.Caption  := '';
           RelCupomFiscal00.VTrib24.Caption  := '';
           RelCupomFiscal00.VItem24.Caption  := '';
           RelCupomFiscal00.Descricao24.Caption := '';

           RelCupomFiscal00.Item25.Caption   := '';
           RelCupomFiscal00.Codigo25.Caption := '';
           RelCupomFiscal00.Qtde25.Caption   := '';
           RelCupomFiscal00.Und25.Caption    := '';
           RelCupomFiscal00.VUnit25.Caption  := '';
           RelCupomFiscal00.VTrib25.Caption  := '';
           RelCupomFiscal00.VItem25.Caption  := '';
           RelCupomFiscal00.Descricao25.Caption := '';

           RelCupomFiscal00.Item26.Caption   := '';
           RelCupomFiscal00.Codigo26.Caption := '';
           RelCupomFiscal00.Qtde26.Caption   := '';
           RelCupomFiscal00.Und26.Caption    := '';
           RelCupomFiscal00.VUnit26.Caption  := '';
           RelCupomFiscal00.VTrib26.Caption  := '';
           RelCupomFiscal00.VItem26.Caption  := '';
           RelCupomFiscal00.Descricao26.Caption := '';

           RelCupomFiscal00.Item27.Caption   := '';
           RelCupomFiscal00.Codigo27.Caption := '';
           RelCupomFiscal00.Qtde27.Caption   := '';
           RelCupomFiscal00.Und27.Caption    := '';
           RelCupomFiscal00.VUnit27.Caption  := '';
           RelCupomFiscal00.VTrib27.Caption  := '';
           RelCupomFiscal00.VItem27.Caption  := '';
           RelCupomFiscal00.Descricao27.Caption := '';

           RelCupomFiscal00.Item28.Caption   := '';
           RelCupomFiscal00.Codigo28.Caption := '';
           RelCupomFiscal00.Qtde28.Caption   := '';
           RelCupomFiscal00.Und28.Caption    := '';
           RelCupomFiscal00.VUnit28.Caption  := '';
           RelCupomFiscal00.VTrib28.Caption  := '';
           RelCupomFiscal00.VItem28.Caption  := '';
           RelCupomFiscal00.Descricao28.Caption := '';

           RelCupomFiscal00.Item29.Caption   := '';
           RelCupomFiscal00.Codigo29.Caption := '';
           RelCupomFiscal00.Qtde29.Caption   := '';
           RelCupomFiscal00.Und29.Caption    := '';
           RelCupomFiscal00.VUnit29.Caption  := '';
           RelCupomFiscal00.VTrib29.Caption  := '';
           RelCupomFiscal00.VItem29.Caption  := '';
           RelCupomFiscal00.Descricao29.Caption := '';

           RelCupomFiscal00.Item30.Caption   := '';
           RelCupomFiscal00.Codigo30.Caption := '';
           RelCupomFiscal00.Qtde30.Caption   := '';
           RelCupomFiscal00.Und30.Caption    := '';
           RelCupomFiscal00.VUnit30.Caption  := '';
           RelCupomFiscal00.VTrib30.Caption  := '';
           RelCupomFiscal00.VItem30.Caption  := '';
           RelCupomFiscal00.Descricao30.Caption := '';

           RelCupomFiscal00.Item31.Caption   := '';
           RelCupomFiscal00.Codigo31.Caption := '';
           RelCupomFiscal00.Qtde31.Caption   := '';
           RelCupomFiscal00.Und31.Caption    := '';
           RelCupomFiscal00.VUnit31.Caption  := '';
           RelCupomFiscal00.VTrib31.Caption  := '';
           RelCupomFiscal00.VItem31.Caption  := '';
           RelCupomFiscal00.Descricao31.Caption := '';

           RelCupomFiscal00.Item32.Caption   := '';
           RelCupomFiscal00.Codigo32.Caption := '';
           RelCupomFiscal00.Qtde32.Caption   := '';
           RelCupomFiscal00.Und32.Caption    := '';
           RelCupomFiscal00.VUnit32.Caption  := '';
           RelCupomFiscal00.VTrib32.Caption  := '';
           RelCupomFiscal00.VItem32.Caption  := '';
           RelCupomFiscal00.Descricao32.Caption := '';

           RelCupomFiscal00.Item33.Caption   := '';
           RelCupomFiscal00.Codigo33.Caption := '';
           RelCupomFiscal00.Qtde33.Caption   := '';
           RelCupomFiscal00.Und33.Caption    := '';
           RelCupomFiscal00.VUnit33.Caption  := '';
           RelCupomFiscal00.VTrib33.Caption  := '';
           RelCupomFiscal00.VItem33.Caption  := '';
           RelCupomFiscal00.Descricao33.Caption := '';

           RelCupomFiscal00.Item34.Caption   := '';
           RelCupomFiscal00.Codigo34.Caption := '';
           RelCupomFiscal00.Qtde34.Caption   := '';
           RelCupomFiscal00.Und34.Caption    := '';
           RelCupomFiscal00.VUnit34.Caption  := '';
           RelCupomFiscal00.VTrib34.Caption  := '';
           RelCupomFiscal00.VItem34.Caption  := '';
           RelCupomFiscal00.Descricao34.Caption := '';

           RelCupomFiscal00.Item35.Caption   := '';
           RelCupomFiscal00.Codigo35.Caption := '';
           RelCupomFiscal00.Qtde35.Caption   := '';
           RelCupomFiscal00.Und35.Caption    := '';
           RelCupomFiscal00.VUnit35.Caption  := '';
           RelCupomFiscal00.VTrib35.Caption  := '';
           RelCupomFiscal00.VItem35.Caption  := '';
           RelCupomFiscal00.Descricao35.Caption := '';

           RelCupomFiscal00.Item36.Caption   := '';
           RelCupomFiscal00.Codigo36.Caption := '';
           RelCupomFiscal00.Qtde36.Caption   := '';
           RelCupomFiscal00.Und36.Caption    := '';
           RelCupomFiscal00.VUnit36.Caption  := '';
           RelCupomFiscal00.VTrib36.Caption  := '';
           RelCupomFiscal00.VItem36.Caption  := '';
           RelCupomFiscal00.Descricao36.Caption := '';

           RelCupomFiscal00.Item37.Caption   := '';
           RelCupomFiscal00.Codigo37.Caption := '';
           RelCupomFiscal00.Qtde37.Caption   := '';
           RelCupomFiscal00.Und37.Caption    := '';
           RelCupomFiscal00.VUnit37.Caption  := '';
           RelCupomFiscal00.VTrib37.Caption  := '';
           RelCupomFiscal00.VItem37.Caption  := '';
           RelCupomFiscal00.Descricao37.Caption := '';

           RelCupomFiscal00.Item38.Caption   := '';
           RelCupomFiscal00.Codigo38.Caption := '';
           RelCupomFiscal00.Qtde38.Caption   := '';
           RelCupomFiscal00.Und38.Caption    := '';
           RelCupomFiscal00.VUnit38.Caption  := '';
           RelCupomFiscal00.VTrib38.Caption  := '';
           RelCupomFiscal00.VItem38.Caption  := '';
           RelCupomFiscal00.Descricao38.Caption := '';

           RelCupomFiscal00.Item39.Caption   := '';
           RelCupomFiscal00.Codigo39.Caption := '';
           RelCupomFiscal00.Qtde39.Caption   := '';
           RelCupomFiscal00.Und39.Caption    := '';
           RelCupomFiscal00.VUnit39.Caption  := '';
           RelCupomFiscal00.VTrib39.Caption  := '';
           RelCupomFiscal00.VItem39.Caption  := '';
           RelCupomFiscal00.Descricao39.Caption := '';

           RelCupomFiscal00.Item40.Caption   := '';
           RelCupomFiscal00.Codigo40.Caption := '';
           RelCupomFiscal00.Qtde40.Caption   := '';
           RelCupomFiscal00.Und40.Caption    := '';
           RelCupomFiscal00.VUnit40.Caption  := '';
           RelCupomFiscal00.VTrib40.Caption  := '';
           RelCupomFiscal00.VItem40.Caption  := '';
           RelCupomFiscal00.Descricao40.Caption := '';

           For I := 0 To 39 Do
               Begin
               If (I = 0) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item1.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo1.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde1.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und1.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit1.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib1.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem1.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao1.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 1) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item2.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo2.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde2.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und2.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit2.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib2.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem2.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao2.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 2) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item3.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo3.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde3.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und3.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit3.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib3.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem3.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao3.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 3) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item4.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo4.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde4.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und4.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit4.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib4.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem4.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao4.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 4) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item5.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo5.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde5.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und5.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit5.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib5.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem5.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao5.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 5) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item6.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo6.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde6.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und6.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit6.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib6.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem6.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao6.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 6) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item7.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo7.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde7.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und7.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit7.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib7.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem7.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao7.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 7) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item8.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo8.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde8.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und8.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit8.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib8.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem8.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao8.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 8) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item9.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo9.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde9.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und9.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit9.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib9.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem9.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao9.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 9) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item10.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo10.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde10.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und10.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit10.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib10.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem10.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao10.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 10) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item11.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo11.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde11.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und11.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit11.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib11.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem11.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao11.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 11) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item12.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo12.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde12.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und12.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit12.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib12.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem12.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao12.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 12) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item13.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo13.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde13.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und13.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit13.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib13.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem13.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao13.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 13) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item14.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo14.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde14.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und14.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit14.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib14.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem14.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao14.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 14) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item15.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo15.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde15.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und15.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit15.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib15.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem15.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao15.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 15) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item16.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo16.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde16.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und16.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit16.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib16.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem16.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao16.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 16) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item17.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo17.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde17.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und17.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit17.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib17.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem17.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao17.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 17) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item18.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo18.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde18.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und18.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit18.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib18.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem18.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao18.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 18) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item19.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo19.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde19.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und19.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit19.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib19.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem19.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao19.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 19) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item20.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo20.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde20.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und20.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit20.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib20.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem20.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao20.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 20) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item21.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo21.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde21.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und21.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit21.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib21.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem21.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao21.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 21) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item22.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo22.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde22.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und22.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit22.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib22.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem22.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao22.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 22) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item23.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo23.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde23.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und23.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit23.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib23.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem23.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao23.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 23) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item24.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo24.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde24.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und24.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit24.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib24.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem24.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao24.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 24) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item25.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo25.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde25.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und25.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit25.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib25.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem25.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao25.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 25) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item26.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo26.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde26.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und26.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit26.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib26.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem26.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao26.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 26) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item27.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo27.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde27.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und27.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit27.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib27.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem27.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao27.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 27) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item28.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo28.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde28.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und28.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit28.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib28.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem28.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao28.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 28) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item29.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo29.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde29.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und29.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit29.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib29.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem29.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao29.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 29) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item30.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo30.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde30.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und30.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit30.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib30.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem30.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao30.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 30) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item31.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo31.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde31.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und31.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit31.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib31.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem31.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao31.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 31) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item32.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo32.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde32.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und32.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit32.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib32.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem32.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao32.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 32) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item33.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo33.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde33.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und33.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit33.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib33.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem33.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao33.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 33) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item34.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo34.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde34.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und34.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit34.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib34.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem34.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao34.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 34) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item35.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo35.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde35.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und35.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit35.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib35.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem35.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao35.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 35) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item36.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo36.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde36.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und36.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit36.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib36.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem36.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao36.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 36) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item37.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo37.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde37.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und37.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit37.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib37.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem37.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao37.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 37) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item38.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo38.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde38.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und38.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit38.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib38.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem38.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao38.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 38) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item39.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo39.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde39.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und39.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit39.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib39.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem39.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao39.Caption := Trim(CFe_xProd[I]);
                  End
               Else If (I = 39) And (Trim(CFe_cProd[I]) <> '') Then
                  Begin
                  RelCupomFiscal00.Item40.Caption   := IntToStr(I + 1);
                  RelCupomFiscal00.Codigo40.Caption := Trim(CFe_cProd[I]);
                  RelCupomFiscal00.Qtde40.Caption   := Trim(CFe_qCom[I]);
                  RelCupomFiscal00.Und40.Caption    := Trim(CFe_uCom[I]);
                  RelCupomFiscal00.VUnit40.Caption  := Trim(CFe_vUnCom[I]);
                  RelCupomFiscal00.VTrib40.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I])))) * 5.47) / 100)));
                  RelCupomFiscal00.VItem40.Caption  := Virgula_Ponto(FormatFloat('0.00',((StrToFloat(Ponto_Virgula(Trim(CFe_qCom[I]))) * (StrToFloat(Ponto_Virgula(Trim(CFe_vUnCom[I]))))))));
                  RelCupomFiscal00.Descricao40.Caption := Trim(CFe_xProd[I]);
               End;
           End;

           //*** Prepara o Rodapé do Cupom ***

           RelCupomFiscal00.QR_CFe_vMP.Caption := Trim(CFe_vMP);

           //*** No CFe: 01-Dinheiro | 02-Cheque | 03-Cartão de Crédito | 04-Cartão de Débito ***
           If Trim(CFe_cMP) = '01' Then
              Begin
              RelCupomFiscal00.QR_CFe_cMP.Caption := '01-Dinheiro';
              End
           Else If Trim(CFe_cMP) = '02' Then
              Begin
              RelCupomFiscal00.QR_CFe_cMP.Caption := '02-Cheque';
              End
           Else If Trim(CFe_cMP) = '03' Then
              Begin
              RelCupomFiscal00.QR_CFe_cMP.Caption := '03-Cartão de Crédito';
              End
           Else If Trim(CFe_cMP) = '04' Then
              Begin
              RelCupomFiscal00.QR_CFe_cMP.Caption := '04-Cartão de Débito';
           End;

           RelCupomFiscal00.QR_CFe_infCpl.Caption := Trim(CFe_infCpl);

           RelCupomFiscal00.QR_CFe_nserieSAT.Caption := Trim(CFe_nserieSAT);
           RelCupomFiscal00.QR_CFe_dEmi.Caption      := Copy(Trim(CFe_dEmi),7,2) + '/' + Copy(Trim(CFe_dEmi),5,2) + '/' + Copy(Trim(CFe_dEmi),1,4);
           RelCupomFiscal00.QR_CFe_hEmi.Caption      := Copy(Trim(CFe_hEmi),1,2) + ':' + Copy(Trim(CFe_hEmi),3,2) + ':' + Copy(Trim(CFe_hEmi),5,2);

           RelCupomFiscal00.QR_CFe_Chave_Acesso.Caption  := Trim(CFe_Chave_Acesso);
           RelCupomFiscal00.QR_CFe_Codigo_Barras.Caption := Trim(CFe_Chave_Acesso);

           //*********************************
           //*** Prepara o QRCode - Início ***
           //*********************************
           QRCode := TDelphiZXingQRCode.Create;
           QRCodeBitmap := TBitmap.Create;
           Try
              If Trim(CFe_consCNPJ) <> '' Then
                 Begin
                 QRCode.Data := Trim(CFe_Chave_Acesso) + '|' + Trim(CFe_dEmi) + Trim(CFe_hEmi) + '|' + Trim(CFe_vMP) + '|' + Trim(CFe_consCNPJ) + '|' + Trim(CFe_assinaturaQRCODE);
                 End
              Else If Trim(CFe_consCPF) <> '' Then
                 Begin
                 QRCode.Data := Trim(CFe_Chave_Acesso) + '|' + Trim(CFe_dEmi) + Trim(CFe_hEmi) + '|' + Trim(CFe_vMP) + '|' + Trim(CFe_consCPF) + '|' + Trim(CFe_assinaturaQRCODE);
                 End
              Else
                 Begin
                 QRCode.Data := Trim(CFe_Chave_Acesso) + '|' + Trim(CFe_dEmi) + Trim(CFe_hEmi) + '|' + Trim(CFe_vMP) + '|' + '|' + Trim(CFe_assinaturaQRCODE);
              End;

              QRCode.Encoding     := TQRCodeEncoding(0);
              QRCode.QuietZone    := StrToIntDef('0', 4);
              QRCodeBitmap.Width  := QRCode.Columns;
              QRCodeBitmap.Height := QRCode.Rows;

              For Row := 0 to QRCode.Rows - 1 Do
                  Begin
                  For Column := 0 to QRCode.Columns - 1 Do
                      Begin
                      If (QRCode.IsBlack[Row, Column]) then
                         Begin
                         QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
                         End
                      Else
                         Begin
                         QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
                      End;
                  End;
              End;
           Finally
              QRCode.Free;
           End;
           PaintBoxQRCode.Repaint;

           QRCodeBitmap.SaveToFile('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\img_CFe_' + Copy(Trim(DBGrid_Pedidos.Fields[5].Text),5,(Length(Trim(DBGrid_Pedidos.Fields[5].Text)) - 4)) + '.bmp');
           QRCodeBitmap.Free;

           //********************************
           //*** Prepara o QRCode - Final ***
           //********************************

           RelCupomFiscal00.QR_CFe_QRCode.Picture.LoadFromFile('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\img_CFe_' + Copy(Trim(DBGrid_Pedidos.Fields[5].Text),5,(Length(Trim(DBGrid_Pedidos.Fields[5].Text)) - 4)) + '.bmp');

           Seta();

           RelCupomFiscal00.QR_CupomFiscal.PreviewModal;
           RelCupomFiscal00.QR_CupomFiscal.Destroy;
           RelCupomFiscal00.Destroy;

           //*** Apaga a Imagem de QRCode ***
           If FileExists('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\img_CFe_' + Copy(Trim(DBGrid_Pedidos.Fields[5].Text),5,(Length(Trim(DBGrid_Pedidos.Fields[5].Text)) - 4)) + '.bmp') Then
              Begin
              DeleteFile('C:\Program Files (x86)\ELGIN\SW Ativação Linker\resultCFe\img_CFe_' + Copy(Trim(DBGrid_Pedidos.Fields[5].Text),5,(Length(Trim(DBGrid_Pedidos.Fields[5].Text)) - 4)) + '.bmp');
           End;

           End
        Else
           Begin
           MSG_Erro('XML do Cupom Fiscal Eletrônico não foi encontrado!');
        End;
     End;
end;

end.
