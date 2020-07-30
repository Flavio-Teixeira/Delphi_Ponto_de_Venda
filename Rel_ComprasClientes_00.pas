unit Rel_ComprasClientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, Gauges;
  
type
  TRel_ComprasClientes00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Maquinas: TComboBox;
    Label1: TLabel;
    LBL_Registro: TLabel;
    BT_Procurar: TBitBtn;
    Panel2: TPanel;
    DBGrid_Pedidos: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Total_Pedidos: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Valor_Pedidos: TLabel;
    BT_Produtos: TBitBtn;
    BT_Margem: TBitBtn;
    Label5: TLabel;
    Rel_Hora_Inicial: TMaskEdit;
    Label9: TLabel;
    Rel_Hora_Final: TMaskEdit;
    Label10: TLabel;
    pgtoTodos: TRadioButton;
    pgtoDinheiro: TRadioButton;
    pgtoDebito: TRadioButton;
    pgtoCredito: TRadioButton;
    pgtoOutros: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_PedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_PedidosDblClick(Sender: TObject);
    procedure BT_ProdutosClick(Sender: TObject);
    procedure BT_MargemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_ComprasClientes00: TRel_ComprasClientes00;

implementation

uses Rotinas_Gerais, Rel_ComprasClientes_01, Conexao_BD, Login_00,
  Rel_ComprasClientes_02, Rel_ComprasClientes_03;

{$R *.dfm}

procedure TRel_ComprasClientes00.FormShow(Sender: TObject);
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

    Rel_Hora_Inicial.Text    := '00:00';
    Rel_Hora_Final.Text      := '23:59';
end;

procedure TRel_ComprasClientes00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRel_ComprasClientes00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRel_ComprasClientes00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Soma o Total da Vendas ***

        Comando_SQL := 'Select SUM(Cabeca_Cupom_Vlr_Total) AS Valor_Total from Cabeca_Cupons Where ';
        Comando_SQL := Comando_SQL + '(Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+') ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes.Close;
        ConexaoBD.SQL_Compras_Clientes.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes.Open;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Compras_Clientes.FieldByName('Valor_Total').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Valor_Pedidos.Caption := Vlr_Exibicao;

        If Trim(Valor_Pedidos.Caption) = '' Then
           Begin
           Valor_Pedidos.Caption := '0,00';
        End;

        //*** Seleciona a Cabeça de Cupons ***

        Comando_SQL := 'Select * from Cabeca_Cupons Where ';
        Comando_SQL := Comando_SQL + '(Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+') ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes.Close;
        ConexaoBD.SQL_Compras_Clientes.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes.Open;

        //*** Seleciona os Itens para o Relatório ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons,mgt_clientes Where ';
        Comando_SQL := Comando_SQL + '(Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+') AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Codigo = mgt_cliente_codigo AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Status = '+#39+'Aguardando'+#39+' ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes_Rel.Close;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes_Rel.Open;

        //*** Exibe o Grid de Pedidos ***

        Total_Pedidos.Caption := IntToStr(ConexaoBD.SQL_Compras_Clientes.RecordCount);

        Application.CreateForm(TRel_ComprasClientes01,Rel_ComprasClientes01);

        Seta();

        Rel_ComprasClientes01.QR_RegistroCaixa.PreviewModal;
        Rel_ComprasClientes01.Destroy;

        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
End;

procedure TRel_ComprasClientes00.BT_SairClick(Sender: TObject);
begin
    Rel_ComprasClientes00.Close;
end;

procedure TRel_ComprasClientes00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRel_ComprasClientes00.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Soma o Total da Vendas ***

        Comando_SQL := 'Select SUM(Cabeca_Cupom_Vlr_Total) AS Valor_Total from Cabeca_Cupons Where ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) AND ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Hora_Emissao >= '+#39+Trim(Rel_Hora_Inicial.Text)+':00'+#39+') and (Cabeca_Cupom_Hora_Emissao <= '+#39+Trim(Rel_Hora_Final.Text)+':00'+#39+')) ';

        //*** Seleciona a Máquina da Venda ***
        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ ' ';
        End;

        //*** Seleciona a Forma de Pagamento ***
        If pgtoDinheiro.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'D' +#39+ ' ';
           End
        Else If pgtoDebito.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'C' +#39+ ' ';
           End
        Else If pgtoCredito.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'R' +#39+ ' ';
           End
        Else If pgtoOutros.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND (Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'D' +#39+ ' AND Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'C' +#39+ ' AND Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'R' +#39+ ') ';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes.Close;
        ConexaoBD.SQL_Compras_Clientes.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes.Open;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Compras_Clientes.FieldByName('Valor_Total').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Valor_Pedidos.Caption := Vlr_Exibicao;

        If Trim(Valor_Pedidos.Caption) = '' Then
           Begin
           Valor_Pedidos.Caption := '0,00';
        End;

        //*** Seleciona a Cabeça de Cupons ***

        Comando_SQL := 'Select * from Cabeca_Cupons Where ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) AND ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Hora_Emissao >= '+#39+Trim(Rel_Hora_Inicial.Text)+':00'+#39+') and (Cabeca_Cupom_Hora_Emissao <= '+#39+Trim(Rel_Hora_Final.Text)+':00'+#39+')) ';

        //*** Seleciona a Máquina de Venda ***
        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ ' ';
        End;

        //*** Seleciona a Forma de Pagamento ***
        If pgtoDinheiro.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'D' +#39+ ' ';
           End
        Else If pgtoDebito.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'C' +#39+ ' ';
           End
        Else If pgtoCredito.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Forma_Pgto = ' +#39+ 'R' +#39+ ' ';
           End
        Else If pgtoOutros.Checked = True Then
           Begin
           Comando_SQL := Comando_SQL + 'AND (Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'D' +#39+ ' AND Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'C' +#39+ ' AND Cabeca_Cupom_Forma_Pgto <> ' +#39+ 'R' +#39+ ') ';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes.Close;
        ConexaoBD.SQL_Compras_Clientes.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes.Open;

        //*** Seleciona os Itens para o Relatório ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons,mgt_clientes Where ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) AND ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Hora_Emissao >= '+#39+Trim(Rel_Hora_Inicial.Text)+':00'+#39+') and (Cabeca_Cupom_Hora_Emissao <= '+#39+Trim(Rel_Hora_Final.Text)+':00'+#39+')) AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Codigo = mgt_cliente_codigo AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Status = '+#39+'Aguardando'+#39+' ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes_Rel.Close;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes_Rel.Open;

        //*** Exibe o Grid de Pedidos ***

        Total_Pedidos.Caption := IntToStr(ConexaoBD.SQL_Compras_Clientes.RecordCount);

        Seta();
        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
end;

procedure TRel_ComprasClientes00.DBGrid_PedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Pedidos.Fields[7].Text = 'Aguardando') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
        End
     Else If (DBGrid_Pedidos.Fields[7].Text = 'Entregue') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clSkyBlue;
        End
     Else If (DBGrid_Pedidos.Fields[7].Text = 'Pago') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clMoneyGreen;
        End
     Else
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Pedidos.DefaultDrawDataCell(Rect, DBGrid_Pedidos.columns[datacol].field, State);
end;

procedure TRel_ComprasClientes00.DBGrid_PedidosDblClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If (DBGrid_Pedidos.Fields[0].Text <> '') Then
        Begin
        Ampulheta();

        //*** Seleciona os Itens para o Relatório ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons,mgt_clientes Where ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = ' +#39+ Trim(DBGrid_Pedidos.Fields[0].Text) +#39+ ' AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Codigo = mgt_cliente_codigo ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Compras_Clientes_Rel.Close;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Clear;
        ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Compras_Clientes_Rel.Open;

        Application.CreateForm(TRel_ComprasClientes01,Rel_ComprasClientes01);

        Seta();

        Rel_ComprasClientes01.QR_RegistroCaixa.PreviewModal;
        Rel_ComprasClientes01.Destroy;
     End;
end;

procedure TRel_ComprasClientes00.BT_ProdutosClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Seleciona os Itens para o Relatório ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons Where ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) AND ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Hora_Emissao >= '+#39+Trim(Rel_Hora_Inicial.Text)+':00'+#39+') and (Cabeca_Cupom_Hora_Emissao <= '+#39+Trim(Rel_Hora_Final.Text)+':00'+#39+')) AND ';
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

        //*** Abre o Relatório ***

        Application.CreateForm(TRel_ComprasClientes02,Rel_ComprasClientes02);

        Rel_ComprasClientes02.Titulo_Rel_Produtos.Caption := 'Relação de Produtos Vendidos no Período de: ' + Trim(Rel_Periodo_Inicial.Text) + ' até ' + Trim(Rel_Periodo_Final.Text) + ' - Hora: ' + Trim(Rel_Hora_Inicial.Text) + ' até ' + Trim(Rel_Hora_Final.Text);

        Seta();

        Rel_ComprasClientes02.QR_RegistroCaixa.PreviewModal;
        Rel_ComprasClientes02.Destroy;

        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
end;

procedure TRel_ComprasClientes00.BT_MargemClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Seleciona os Itens para o Relatório ***

        Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons,Produtos Where ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Data_Emissao >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Cabeca_Cupom_Data_Emissao <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) AND ';
        Comando_SQL := Comando_SQL + '((Cabeca_Cupom_Hora_Emissao >= '+#39+Trim(Rel_Hora_Inicial.Text)+':00'+#39+') and (Cabeca_Cupom_Hora_Emissao <= '+#39+Trim(Rel_Hora_Final.Text)+':00'+#39+')) AND ';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND ';
        Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Codigo = Produto_Codigo ';

        If Trim(Maquinas.Text) <> '--- Todas as Máquinas ---' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND Cabeca_Cupom_Maquina = ' +#39+ Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) ) +#39+ '';
        End;

        Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

        ConexaoBD.SQL_Margem_Rel.Close;
        ConexaoBD.SQL_Margem_Rel.SQL.Clear;
        ConexaoBD.SQL_Margem_Rel.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Margem_Rel.Open;

        //*** Abre o Relatório ***

        Application.CreateForm(TRel_ComprasClientes03,Rel_ComprasClientes03);

        Rel_ComprasClientes03.Titulo_Rel_Produtos.Caption := 'Margem de Contribuição no Período de: ' + Trim(Rel_Periodo_Inicial.Text) + ' até ' + Trim(Rel_Periodo_Final.Text) + ' - Hora: ' + Trim(Rel_Hora_Inicial.Text) + ' até ' + Trim(Rel_Hora_Final.Text);

        Seta();

        Rel_ComprasClientes03.QR_RegistroCaixa.PreviewModal;
        Rel_ComprasClientes03.Destroy;

        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
end;

end.
