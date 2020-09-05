unit Clientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TClientes00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Clientes: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Opcoes_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Clientes: TLabel;
    Programa_Anterior: TEdit;
    Resultado_Adiciona_Cliente_Pedido: TEdit;
    DBG_Cliente_Observacao_Nota: TDBMemo;
    Select_Primeira_Vez: TEdit;
    Segunda_Busca: TGroupBox;
    Opcao_Segunda_Busca: TCheckBox;
    Label4: TLabel;
    Dados_Procura_2: TEdit;
    Label5: TLabel;
    Opcoes_Procura_2: TComboBox;
    Panel6: TPanel;
    DBG_Cliente_Observacao: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_ClientesCellClick(Column: TColumn);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure btnVisualizarClick(Sender: TObject);
    procedure Opcao_Segunda_BuscaClick(Sender: TObject);
  private
    { Private declarations }
    function Adiciona_Cliente_Pedido():Integer;

    procedure Procura_Cliente();
  public
    { Public declarations }
  end;

var
  Clientes00: TClientes00;
implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_01, Clientes_02,
  MSG_Adiciona_Cliente_Pedido, Frente_Loja_00;

var Selecionado: string;  

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TClientes00.Adiciona_Cliente_Pedido():Integer;
begin
     If Trim(Programa_Anterior.Text) <> '' Then
        Begin
        Application.CreateForm(TMSGAdicionaClientePedido,MSGAdicionaClientePedido);

        MSGAdicionaClientePedido.Cliente_Selecionado.Caption := DBGrid_Clientes.Fields[2].Text;
        MSGAdicionaClientePedido.Programa_Anterior.Text      := Programa_Anterior.Text;

        MSGAdicionaClientePedido.ShowModal;
        MSGAdicionaClientePedido.Destroy;

        Result := StrToInt(Resultado_Adiciona_Cliente_Pedido.Text);
        End
     Else
        Begin
        Result := 1;
     End;
end;

//******************
//*** Procedures ***
//******************

procedure TClientes00.BT_SairClick(Sender: TObject);
begin
     Clientes00.Close;
end;

procedure TClientes00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TClientes00.FormShow(Sender: TObject);
begin
    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(DBGrid_Clientes.Handle,SB_VERT,True);

    If Trim(Select_Primeira_Vez.Text) <> '' Then
       Begin
       Procura_Cliente();
    End;
    Select_Primeira_Vez.Text := 'NÃO';
    
    Dados_Procura.SetFocus;
end;

procedure TClientes00.BT_ProcurarClick(Sender: TObject);
begin
     Procura_Cliente();
end;

procedure TClientes00.BT_IncluirClick(Sender: TObject);
begin
     Application.CreateForm(TClientes01,Clientes01);
     Clientes01.ShowModal;
     Clientes01.Destroy;
end;

procedure TClientes00.DBGrid_ClientesCellClick(Column: TColumn);

var
    Codigo_Cliente, Tipo_Codigo_Cliente, Nome_Cliente: String;
    Ind, Posicao_Atual: Integer;

begin
     If DBGrid_Clientes.Fields[0].Text <> '' Then Begin
        Selecionado := DBGrid_Clientes.Fields[0].Text;

        If Adiciona_Cliente_Pedido() = 1 Then
           Begin

           Ampulheta();

           Application.CreateForm(TClientes02,Clientes02);

           Codigo_Cliente      := DBGrid_Clientes.Fields[0].Text;
           Tipo_Codigo_Cliente := DBGrid_Clientes.Fields[1].Text;

           //*** Prepara o Avanço de Clientes ***

           DBGrid_Clientes.Visible := False;

           ConexaoBD.SQL_Clientes.First;

           Clientes02.SGD_Movto_Clientes.RowCount := ConexaoBD.SQL_Clientes.RecordCount;

           For Ind := 0 To Clientes02.SGD_Movto_Clientes.RowCount Do
               Begin
               Clientes02.SGD_Movto_Clientes.Cells[0,Ind]  := '';
               Clientes02.SGD_Movto_Clientes.Cells[1,Ind]  := '';
               Clientes02.SGD_Movto_Clientes.Cells[2,Ind]  := '';
           End;

           Ind           := 0;
           Posicao_Atual := 0;

           While Not ConexaoBD.SQL_Clientes.Eof Do
                 Begin
                 Clientes02.SGD_Movto_Clientes.Cells[0,Ind]  := IntToStr(Ind);
                 Clientes02.SGD_Movto_Clientes.Cells[1,Ind]  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
                 Clientes02.SGD_Movto_Clientes.Cells[2,Ind]  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo_tipo').Text;

                 If Trim(Codigo_Cliente) = Trim(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text) Then
                    Begin
                    Posicao_Atual := Ind;
                 End;

                 Ind := Ind + 1;

                 ConexaoBD.SQL_Clientes.Next;
           End;

           Clientes02.Movto_Pos_Total.Text := IntToStr(Clientes02.SGD_Movto_Clientes.RowCount - 1);
           Clientes02.Movto_Pos_Atual.Text := IntToStr(Posicao_Atual);

           DBGrid_Clientes.Visible := True;

           //*** Obtem os Dados do Cliente ***

           ConexaoBD.SQL_Clientes.Close;
           ConexaoBD.SQL_Clientes.SQL.Clear;

           If Tipo_Codigo_Cliente = 'CNPJ' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
              End
           Else If Tipo_Codigo_Cliente = 'CPF' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
              End
           Else If Tipo_Codigo_Cliente = 'RG' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
              End
           Else If Tipo_Codigo_Cliente = 'E-Mail' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End;

           ConexaoBD.SQL_Clientes.Open;

           //*** Carrega os Dados Obtidos ***

           If Tipo_Codigo_Cliente = 'CNPJ' Then
              Begin
              Clientes02.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
              End
           Else If Tipo_Codigo_Cliente = 'CPF' Then
              Begin
              Clientes02.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
              End
           Else If Tipo_Codigo_Cliente = 'RG' Then
              Begin
              Clientes02.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
              End
           Else If Tipo_Codigo_Cliente = 'E-Mail' Then
              Begin
              Clientes02.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
           End;

           Clientes02.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo_tipo').Text);
           Clientes02.Cliente_Nome.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_nome').Text;
           Clientes02.Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_razao_social').Text;
           Clientes02.Cliente_Inscricao_Municipal.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_municipal').Text;
           Clientes02.Cliente_Inscricao_Estadual.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_estadual').Text;
           Clientes02.Cliente_Endereco.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco').Text;
           Clientes02.Cliente_Bairro.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro').Text;
           Clientes02.Cliente_Cidade.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade').Text;
           Clientes02.Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado').Text);
           Clientes02.Cliente_Cep.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep').Text;
           Clientes02.Cliente_Fone.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone').Text;
           Clientes02.Cliente_Fax.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax').Text;
           Clientes02.Cliente_Contato.Text              := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_contato').Text;
           Clientes02.Cliente_Fone_Comercial.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_comercial').Text;
           Clientes02.Cliente_Fone_Celular.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_celular').Text;
           Clientes02.Cliente_Fone_Fax.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_fax').Text;
           Clientes02.Cliente_Endereco_Entrega.Text     := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_entrega').Text;
           Clientes02.Cliente_Bairro_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_entrega').Text;
           Clientes02.Cliente_Cidade_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_entrega').Text;
           Clientes02.Cliente_Estado_Entrega.ItemIndex  := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_entrega').Text);
           Clientes02.Cliente_Cep_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_entrega').Text;
           Clientes02.Cliente_Fone_Entrega.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_entrega').Text;
           Clientes02.Cliente_Fax_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_entrega').Text;
           Clientes02.Cliente_Endereco_Cobranca.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_cobranca').Text;
           Clientes02.Cliente_Bairro_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_cobranca').Text;
           Clientes02.Cliente_Cidade_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_cobranca').Text;
           Clientes02.Cliente_Estado_Cobranca.ItemIndex := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_cobranca').Text);
           Clientes02.Cliente_Cep_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_cobranca').Text;
           Clientes02.Cliente_Fone_Cobranca.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_cobranca').Text;
           Clientes02.Cliente_Fax_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_cobranca').Text;
           Clientes02.Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_status_credito').Text);
           Clientes02.Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_tipo_pessoa').Text);
           Clientes02.Cliente_Data_Inclusao.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_inclusao').Text;
           Clientes02.Cliente_Data_Visita.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_visita').Text;
           Clientes02.Cliente_Data_Alteracao.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_alteracao').Text;
           Clientes02.Cliente_Data_Ultima_Compra.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_ultima_compra').Text;
           Clientes02.Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_ultimo_valor').Text;

           Clientes02.Cliente_Observacoes.Lines.Clear;
           Clientes02.Cliente_Observacoes.Lines.Add(Trim(DBG_Cliente_Observacao.Text));

           Clientes02.Cliente_Observacoes_Nota.Lines.Clear;
           Clientes02.Cliente_Observacoes_Nota.Lines.Add(Trim(DBG_Cliente_Observacao_Nota.Text));

           Clientes02.Cliente_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_pais').Text);

           Clientes02.Cliente_Opcao_Cobranca.ItemIndex  := Obtem_Nro_Opcao_Cobranca(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_cobranca').Text);
           Clientes02.Cliente_Opcao_Entrega.ItemIndex   := Obtem_Nro_Opcao_Entrega(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_entrega').Text);
           Clientes02.Cliente_Email.Text                := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_email').Text;
           Clientes02.Cliente_Site.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_site').Text;

           Clientes02.Cliente_Desconto.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_desconto').Text;

           //*** Fecha SQL ***

           ConexaoBD.SQL_Clientes.Close;

           Seta();

           Clientes02.ShowModal;
           Clientes02.Destroy;

           End
        Else If Resultado_Adiciona_Cliente_Pedido.Text = '0' Then
           Begin

           Codigo_Cliente      := DBGrid_Clientes.Fields[0].Text;
           Nome_Cliente        := DBGrid_Clientes.Fields[2].Text;

           conexaoBD.SQL_Clientes.Close;
           conexaoBD.SQL_Clientes.SQL.Clear;
           conexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = '+#39+ Codigo_Cliente +#39);
           conexaoBD.SQL_Clientes.Open;

           If Trim(Programa_Anterior.Text) = 'Frente_Loja' Then
              Begin
              Frente_Loja00.EditCodCliente.Text  := Trim(Codigo_Cliente);
              Frente_Loja00.EditNomeCliente.Text := Trim(Nome_Cliente);
           End;

           Clientes00.Close;
        End;
     End;
end;

procedure TClientes00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes00.Procura_Cliente();

var
   Comando_SQL, Conecta: String;

begin
     Ampulheta();

     ConexaoBD.SQL_Clientes.Close;
     ConexaoBD.SQL_Clientes.SQL.Clear;

     If Opcao_Segunda_Busca.Checked Then
        Begin
        Comando_SQL := 'Select * from mgt_clientes Where ';

        //*** Busca Pela Primeira Opção ***

        If Trim(Dados_Procura.Text) <> '' Then
           Begin

           If Opcoes_Procura.Text = 'Nome Fantasia' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_nome Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Código' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Tipo do Código' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_codigo_tipo = ' +#39+ Trim(Dados_Procura.Text) +#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Razão Social' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_razao_social Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_municipal Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_estadual Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Endereço' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_endereco Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Bairro' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_bairro Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Cidade' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_cidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Estado' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_estado = ' +#39+ Trim(Dados_Procura.Text) +#39+' ';
              End
           Else If Opcoes_Procura.Text = 'CEP' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_cep Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_estado_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+' ';
              End
           Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_cep_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Contato' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_contato Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'DDD' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_ddd = ' +#39+ Trim(Dados_Procura.Text) +#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Ramal' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_fone_ramal = ' +#39+ Trim(Dados_Procura.Text) +#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Fone Comercial' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_fone_comercial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Fone Residencial' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_fone_residencial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Fone Celular' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Fone Fax' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_valor_credito = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'Status do Crédito' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_status_credito = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Banco' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_banco = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_tipo = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'Representante' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_vendedor = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_tipo_pessoa = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Consignação' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_consignacao = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Zona' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_zona = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'Data da Visita' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_data_visita = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Data de Alteração' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_data_ultima_compra = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Último Valor' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_ultimo_valor = ' + Trim(Dados_Procura.Text) + ' ';
              End
           Else If Opcoes_Procura.Text = 'País' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_pais = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_pais_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_opcao_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'E-Mail' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_email = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura.Text = 'ICMS' Then
              Begin
              Comando_SQL := Comando_SQL + 'mgt_cliente_icms = ' + Trim(Dados_Procura.Text) + ' ';
           End;

        End;

        If Trim(Dados_Procura.Text) <> '' Then
           Begin
           Conecta := ' And ';
           End
        Else
           Begin
           Conecta := '';
        End;

        //*** Busca Pela Segunda Opção ***

        If Trim(Dados_Procura_2.Text) <> '' Then
           Begin

           If Opcoes_Procura_2.Text = 'Nome Fantasia' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_nome Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Código' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_codigo Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Tipo do Código' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_codigo_tipo = ' +#39+ Trim(Dados_Procura_2.Text) +#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Razão Social' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_razao_social Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Inscrição Municipal' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_inscricao_municipal Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Inscrição Estadual' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_inscricao_estadual Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Endereço' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_endereco Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Bairro' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_bairro Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Cidade' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_cidade Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Estado' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_estado = ' +#39+ Trim(Dados_Procura_2.Text) +#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'CEP' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_cep Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Endereço (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_endereco_cobranca Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Bairro (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_bairro_cobranca Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Cidade (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_cidade_cobranca Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Estado (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_estado_cobranca = ' +#39+ Trim(Dados_Procura_2.Text) +#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'CEP (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_cep_cobranca Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Contato' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_contato Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'DDD' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_ddd = ' +#39+ Trim(Dados_Procura_2.Text) +#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Ramal' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_fone_ramal = ' +#39+ Trim(Dados_Procura_2.Text) +#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Fone Comercial' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_fone_comercial Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Fone Residencial' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_fone_residencial Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Fone Celular' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Fone Fax' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura_2.Text) +'%'+#39+' ';
              End
           Else If Opcoes_Procura_2.Text = 'Valor do Crédito' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_valor_credito = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Status do Crédito' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_status_credito = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Banco' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_banco = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Tipo do Cliente' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_tipo = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Representante' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_vendedor = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Tipo da Pessoa' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_tipo_pessoa = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Consignação' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_consignacao = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Zona' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_zona = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Data da Visita' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_data_visita = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura_2.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Data de Inclusão' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura_2.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Data de Alteração' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura_2.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Data da Última Compra' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_data_ultima_compra = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura_2.Text),'amd','-') +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Último Valor' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_ultimo_valor = ' + Trim(Dados_Procura_2.Text) + ' ';
              End
           Else If Opcoes_Procura_2.Text = 'País' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_pais = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'País (Cobrança)' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_pais_cobranca = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'Opção de Cobrança' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_opcao_cobranca = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'E-Mail' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_email = ' +#39+ Trim(Dados_Procura_2.Text) +#39+ ' ';
              End
           Else If Opcoes_Procura_2.Text = 'ICMS' Then
              Begin
              Comando_SQL := Comando_SQL + Conecta + 'mgt_cliente_icms = ' + Trim(Dados_Procura_2.Text) + ' ';
           End;

        End;

        //*** Ordena Pela Primeira Opção ***

        If Opcoes_Procura.Text = 'Nome Fantasia' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_nome';
           End
        Else If Opcoes_Procura.Text = 'Código' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_codigo';
           End
        Else If Opcoes_Procura.Text = 'Tipo do Código' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_codigo_tipo';
           End
        Else If Opcoes_Procura.Text = 'Razão Social' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_razao_social';
           End
        Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_inscricao_municipal';
           End
        Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_inscricao_estadual';
           End
        Else If Opcoes_Procura.Text = 'Endereço' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_endereco';
           End
        Else If Opcoes_Procura.Text = 'Bairro' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_bairro';
           End
        Else If Opcoes_Procura.Text = 'Cidade' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_cidade';
           End
        Else If Opcoes_Procura.Text = 'Estado' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_estado';
           End
        Else If Opcoes_Procura.Text = 'CEP' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_cep';
           End
        Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_endereco_cobranca';
           End
        Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_bairro_cobranca';
           End
        Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_cidade_cobranca';
           End
        Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_estado_cobranca';
           End
        Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_cep_cobranca';
           End
        Else If Opcoes_Procura.Text = 'Contato' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_contato';
           End
        Else If Opcoes_Procura.Text = 'DDD' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_ddd';
           End
        Else If Opcoes_Procura.Text = 'Ramal' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_fone_ramal';
           End
        Else If Opcoes_Procura.Text = 'Fone Comercial' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_fone_comercial';
           End
        Else If Opcoes_Procura.Text = 'Fone Residencial' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_fone_residencial';
           End
        Else If Opcoes_Procura.Text = 'Fone Celular' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_fone_celular';
           End
        Else If Opcoes_Procura.Text = 'Fone Fax' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_fone_celular';
           End
        Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_valor_credito';
           End
        Else If Opcoes_Procura.Text = 'Status do Crédito' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_status_credito';
           End
        Else If Opcoes_Procura.Text = 'Banco' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_banco';
           End
        Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_tipo';
           End
        Else If Opcoes_Procura.Text = 'Representante' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_vendedor';
           End
        Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_tipo_pessoa';
           End
        Else If Opcoes_Procura.Text = 'Consignação' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_consignacao';
           End
        Else If Opcoes_Procura.Text = 'Zona' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_zona';
           End
        Else If Opcoes_Procura.Text = 'Data da Visita' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_data_visita';
           End
        Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_data_inclusao';
           End
        Else If Opcoes_Procura.Text = 'Data de Alteração' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_data_alteracao';
           End
        Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_data_ultima_compra';
           End
        Else If Opcoes_Procura.Text = 'Último Valor' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_ultimo_valor';
           End
        Else If Opcoes_Procura.Text = 'País' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_pais';
           End
        Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_pais_cobranca';
           End
        Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_opcao_cobranca';
           End
        Else If Opcoes_Procura.Text = 'E-Mail' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_email';
           End
        Else If Opcoes_Procura.Text = 'ICMS' Then
           Begin
           Comando_SQL := Comando_SQL + ' Order By mgt_cliente_icms';
        End;

        //*** Ordena Pela Segunda Opção ***

        If Opcoes_Procura_2.Text = 'Nome Fantasia' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_nome';
           End
        Else If Opcoes_Procura_2.Text = 'Código' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_codigo';
           End
        Else If Opcoes_Procura_2.Text = 'Tipo do Código' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_codigo_tipo';
           End
        Else If Opcoes_Procura_2.Text = 'Razão Social' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_razao_social';
           End
        Else If Opcoes_Procura_2.Text = 'Inscrição Municipal' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_inscricao_municipal';
           End
        Else If Opcoes_Procura_2.Text = 'Inscrição Estadual' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_inscricao_estadual';
           End
        Else If Opcoes_Procura_2.Text = 'Endereço' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_endereco';
           End
        Else If Opcoes_Procura_2.Text = 'Bairro' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_bairro';
           End
        Else If Opcoes_Procura_2.Text = 'Cidade' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_cidade';
           End
        Else If Opcoes_Procura_2.Text = 'Estado' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_estado';
           End
        Else If Opcoes_Procura_2.Text = 'CEP' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_cep';
           End
        Else If Opcoes_Procura_2.Text = 'Endereço (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_endereco_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'Bairro (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_bairro_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'Cidade (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_cidade_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'Estado (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_estado_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'CEP (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_cep_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'Contato' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_contato';
           End
        Else If Opcoes_Procura_2.Text = 'DDD' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_ddd';
           End
        Else If Opcoes_Procura_2.Text = 'Ramal' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_fone_ramal';
           End
        Else If Opcoes_Procura_2.Text = 'Fone Comercial' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_fone_comercial';
           End
        Else If Opcoes_Procura_2.Text = 'Fone Residencial' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_fone_residencial';
           End
        Else If Opcoes_Procura_2.Text = 'Fone Celular' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_fone_celular';
           End
        Else If Opcoes_Procura_2.Text = 'Fone Fax' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_fone_celular';
           End
        Else If Opcoes_Procura_2.Text = 'Valor do Crédito' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_valor_credito';
           End
        Else If Opcoes_Procura_2.Text = 'Status do Crédito' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_status_credito';
           End
        Else If Opcoes_Procura_2.Text = 'Banco' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_banco';
           End
        Else If Opcoes_Procura_2.Text = 'Tipo do Cliente' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_tipo';
           End
        Else If Opcoes_Procura_2.Text = 'Representante' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_vendedor';
           End
        Else If Opcoes_Procura_2.Text = 'Tipo da Pessoa' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_tipo_pessoa';
           End
        Else If Opcoes_Procura_2.Text = 'Consignação' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_consignacao';
           End
        Else If Opcoes_Procura_2.Text = 'Zona' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_zona';
           End
        Else If Opcoes_Procura_2.Text = 'Data da Visita' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_data_visita';
           End
        Else If Opcoes_Procura_2.Text = 'Data de Inclusão' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_data_inclusao';
           End
        Else If Opcoes_Procura_2.Text = 'Data de Alteração' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_data_alteracao';
           End
        Else If Opcoes_Procura_2.Text = 'Data da Última Compra' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_data_ultima_compra';
           End
        Else If Opcoes_Procura_2.Text = 'Último Valor' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_ultimo_valor';
           End
        Else If Opcoes_Procura_2.Text = 'País' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_pais';
           End
        Else If Opcoes_Procura_2.Text = 'País (Cobrança)' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_pais_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'Opção de Cobrança' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_opcao_cobranca';
           End
        Else If Opcoes_Procura_2.Text = 'E-Mail' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_email';
           End
        Else If Opcoes_Procura_2.Text = 'ICMS' Then
           Begin
           Comando_SQL := Comando_SQL + ', mgt_cliente_icms';
        End;

        ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);

        End
     Else
        Begin

        If Trim(Dados_Procura.Text) <> '' Then
           Begin

           If Opcoes_Procura.Text = 'Nome Fantasia' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_nome Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By mgt_cliente_nome');
              End
           Else If Opcoes_Procura.Text = 'Código' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_codigo');
              End
           Else If Opcoes_Procura.Text = 'Tipo do Código' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo_tipo = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_codigo_tipo');
              End
           Else If Opcoes_Procura.Text = 'Razão Social' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_razao_social Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_razao_social');
              End
           Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_inscricao_municipal Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_inscricao_municipal');
              End
           Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_inscricao_estadual Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_inscricao_estadual');
              End
           Else If Opcoes_Procura.Text = 'Endereço' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_endereco Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_endereco');
              End
           Else If Opcoes_Procura.Text = 'Bairro' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_bairro Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_bairro');
              End
           Else If Opcoes_Procura.Text = 'Cidade' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_cidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_cidade');
              End
           Else If Opcoes_Procura.Text = 'Estado' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_estado = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_estado');
              End
           Else If Opcoes_Procura.Text = 'CEP' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_cep Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_cep');
              End
           Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_endereco_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_endereco_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_bairro_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_bairro_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_cidade_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_cidade_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_estado_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_estado_cobranca');
              End
           Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_cep_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_cep_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Contato' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_contato Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_contato');
              End
           Else If Opcoes_Procura.Text = 'DDD' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_ddd = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_ddd');
              End
           Else If Opcoes_Procura.Text = 'Ramal' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_fone_ramal = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_fone_ramal');
              End
           Else If Opcoes_Procura.Text = 'Fone Comercial' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_fone_comercial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_fone_comercial');
              End
           Else If Opcoes_Procura.Text = 'Fone Residencial' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_fone_residencial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_fone_residencial');
              End
           Else If Opcoes_Procura.Text = 'Fone Celular' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_fone_celular');
              End
           Else If Opcoes_Procura.Text = 'Fone Fax' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By mgt_cliente_fone_celular');
              End
           Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_valor_credito = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_valor_credito');
              End
           Else If Opcoes_Procura.Text = 'Status do Crédito' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_status_credito = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_status_credito');
              End
           Else If Opcoes_Procura.Text = 'Banco' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_banco = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_banco');
              End
           Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_tipo = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_tipo');
              End
           Else If Opcoes_Procura.Text = 'Representante' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_vendedor = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_vendedor');
              End
           Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_tipo_pessoa = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_tipo_pessoa');
              End
           Else If Opcoes_Procura.Text = 'Consignação' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_consignacao = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By mgt_cliente_consignacao');
              End
           Else If Opcoes_Procura.Text = 'Zona' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_zona = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_zona');
              End
           Else If Opcoes_Procura.Text = 'Data da Visita' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_data_visita = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By mgt_cliente_data_visita');
              End
           Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By mgt_cliente_data_inclusao');
              End
           Else If Opcoes_Procura.Text = 'Data de Alteração' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By mgt_cliente_data_alteracao');
              End
           Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_data_ultima_compra = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By mgt_cliente_data_ultima_compra');
              End
           Else If Opcoes_Procura.Text = 'Último Valor' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_ultimo_valor = ' + Trim(Dados_Procura.Text) + ' Order By mgt_cliente_ultimo_valor');
              End
           Else If Opcoes_Procura.Text = 'País' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_pais = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By mgt_cliente_pais');
              End
           Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_pais_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By mgt_cliente_pais_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_opcao_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By mgt_cliente_opcao_cobranca');
              End
           Else If Opcoes_Procura.Text = 'E-Mail' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_email = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By mgt_cliente_email');
              End
           Else If Opcoes_Procura.Text = 'ICMS' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_icms = ' + Trim(Dados_Procura.Text) +' Order By mgt_cliente_icms');
           End;

           End
        Else
           Begin

           If Opcoes_Procura.Text = 'Nome Fantasia' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_nome');
              End
           Else If Opcoes_Procura.Text = 'Código' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_codigo');
              End
           Else If Opcoes_Procura.Text = 'Tipo do Código' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_codigo_tipo');
              End
           Else If Opcoes_Procura.Text = 'Razão Social' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_razao_social');
              End
           Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_inscricao_municipal');
              End
           Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_inscricao_estadual');
              End
           Else If Opcoes_Procura.Text = 'Endereço' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_endereco');
              End
           Else If Opcoes_Procura.Text = 'Bairro' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_bairro');
              End
           Else If Opcoes_Procura.Text = 'Cidade' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_cidade');
              End
           Else If Opcoes_Procura.Text = 'Estado' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_estado');
              End
           Else If Opcoes_Procura.Text = 'CEP' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_cep');
              End
           Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_endereco_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_bairro_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_cidade_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_estado_cobranca');
              End
           Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_cep_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Contato' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_contato');
              End
           Else If Opcoes_Procura.Text = 'DDD' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_ddd');
              End
           Else If Opcoes_Procura.Text = 'Ramal' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_fone_ramal');
              End
           Else If Opcoes_Procura.Text = 'Fone Comercial' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_fone_comercial');
              End
           Else If Opcoes_Procura.Text = 'Fone Residencial' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_fone_residencial');
              End
           Else If Opcoes_Procura.Text = 'Fone Celular' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_fone_celular');
              End
           Else If Opcoes_Procura.Text = 'Fone Fax' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_fone_celular');
              End
           Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_valor_credito');
              End
           Else If Opcoes_Procura.Text = 'Status do Crédito' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_status_credito');
              End
           Else If Opcoes_Procura.Text = 'Banco' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_banco');
              End
           Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_tipo');
              End
           Else If Opcoes_Procura.Text = 'Representante' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_vendedor');
              End
           Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_tipo_pessoa');
              End
           Else If Opcoes_Procura.Text = 'Consignação' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_consignacao');
              End
           Else If Opcoes_Procura.Text = 'Zona' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_zona');
              End
           Else If Opcoes_Procura.Text = 'Data da Visita' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_data_visita');
              End
           Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_data_inclusao');
              End
           Else If Opcoes_Procura.Text = 'Data de Alteração' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_data_alteracao');
              End
           Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_data_ultima_compra');
              End
           Else If Opcoes_Procura.Text = 'Último Valor' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_ultimo_valor');
              End
           Else If Opcoes_Procura.Text = 'País' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_pais');
              End
           Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_pais_cobranca');
              End
           Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_opcao_cobranca');
              End
           Else If Opcoes_Procura.Text = 'E-Mail' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_email');
              End
           Else If Opcoes_Procura.Text = 'ICMS' Then
              Begin
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Order By mgt_cliente_icms');
           End;

        End;

     End;

     ConexaoBD.SQL_Clientes.Open;
     ConexaoBD.SQL_Clientes.Locate('mgt_cliente_codigo',Trim(Selecionado),[]);

     Total_Clientes.Caption := IntToStr(ConexaoBD.SQL_Clientes.RecordCount);

     Seta();
end;

procedure TClientes00.btnVisualizarClick(Sender: TObject);
var
    Comando_SQL, Conecta: string;
begin
end;

procedure TClientes00.Opcao_Segunda_BuscaClick(Sender: TObject);
begin
     If Opcao_Segunda_Busca.Checked Then
        Begin
        Dados_Procura_2.Enabled  := True;
        Opcoes_Procura_2.Enabled := True;

        Dados_Procura_2.Text       := '';
        Opcoes_Procura_2.ItemIndex := 0;

        Dados_Procura_2.SetFocus;
        End
     Else
        Begin
        Dados_Procura_2.Enabled  := False;
        Opcoes_Procura_2.Enabled := False;

        Dados_Procura_2.Text       := '';
        Opcoes_Procura_2.ItemIndex := 0;

        BT_Procurar.SetFocus;
     End;
end;

end.
