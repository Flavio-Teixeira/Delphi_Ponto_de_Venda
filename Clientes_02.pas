unit Clientes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBCtrls;

type
  TClientes02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Nro_Banco: TEdit;
    Nro_Representante: TEdit;
    Nro_Transportadora: TEdit;
    Programa_Anterior: TEdit;
    Nro_Cliente_Tipo_Empresa: TEdit;
    Nro_Pgto_Frete: TEdit;
    Item_Acesso: TEdit;
    Tipo_Acesso: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label36: TLabel;
    Cliente_Mensagem_Mascara: TLabel;
    Label50: TLabel;
    Cliente_Codigo_Tipo: TComboBox;
    Cliente_Nome: TEdit;
    Cliente_Razao_Social: TEdit;
    Cliente_Tipo_Pessoa: TComboBox;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    Cliente_Fone: TEdit;
    Cliente_Fax: TEdit;
    Cliente_Inscricao_Municipal: TEdit;
    Cliente_Inscricao_Estadual: TEdit;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Cliente_Endereco_Entrega: TEdit;
    Cliente_Bairro_Entrega: TEdit;
    Cliente_Cidade_Entrega: TEdit;
    Cliente_Estado_Entrega: TComboBox;
    Cliente_Cep_Entrega: TMaskEdit;
    Cliente_Opcao_Entrega: TComboBox;
    Cliente_Fone_Entrega: TEdit;
    Cliente_Fax_Entrega: TEdit;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label44: TLabel;
    Label29: TLabel;
    Cliente_Contato: TEdit;
    Cliente_Fone_Comercial: TEdit;
    Cliente_Fone_Celular: TEdit;
    Cliente_Fone_Fax: TEdit;
    Cliente_Email: TEdit;
    Cliente_Site: TEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Cliente_Data_Inclusao: TMaskEdit;
    Cliente_Data_Visita: TMaskEdit;
    Cliente_Data_Alteracao: TMaskEdit;
    Cliente_Data_Ultima_Compra: TMaskEdit;
    Cliente_Observacoes: TMemo;
    GroupBox6: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Cliente_Status_Credito: TComboBox;
    Cliente_Ultimo_Valor: TEdit;
    Cliente_Codigo_CNPJ: TMaskEdit;
    Cliente_Codigo_CPF: TMaskEdit;
    Cliente_Codigo_RG: TEdit;
    Cliente_Codigo_EMail: TEdit;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label37: TLabel;
    Label51: TLabel;
    Label54: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Cliente_Endereco_Cobranca: TEdit;
    Cliente_Bairro_Cobranca: TEdit;
    Cliente_Cidade_Cobranca: TEdit;
    Cliente_Estado_Cobranca: TComboBox;
    Cliente_Cep_Cobranca: TMaskEdit;
    Cliente_Opcao_Cobranca: TComboBox;
    Cliente_Fone_Cobranca: TEdit;
    Cliente_Fax_Cobranca: TEdit;
    Cliente_Observacoes_Nota: TMemo;
    BT_Anterior: TButton;
    BT_Proximo: TButton;
    SGD_Movto_Clientes: TStringGrid;
    Movto_Pos_Total: TEdit;
    Movto_Pos_Atual: TEdit;
    DBG_Cliente_Observacao_Nota: TDBMemo;
    DBG_Cliente_Observacao: TDBMemo;
    BT_Nova: TBitBtn;
    Label40: TLabel;
    Cliente_Desconto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Cliente_Opcao_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Opcao_CobrancaChange(Sender: TObject);
    procedure Cliente_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Cep_CobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_DDDKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_RamalKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_TipoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Valor_CreditoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Ultimo_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_PessoaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Inscricao_MunicipalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Razao_SocialKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Inscricao_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Data_InclusaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Data_VisitaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_BairroKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_EstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Data_AlteracaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Data_Ultima_CompraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Endereco_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Complemento_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Status_CreditoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Bairro_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Cidade_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Estado_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Pais_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_ContatoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fone_ResidencialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fone_CelularKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_EmailKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ZonaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ConsignacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Tipo_TransporteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_TransportadoraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Emite_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Opcao_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Opcao_EntregaChange(Sender: TObject);
    procedure Cliente_Endereco_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Bairro_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Cidade_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Estado_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Cep_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fax_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fax_CobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_IcmsKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_Nao_CadastradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_SuframaKeyPress(Sender: TObject; var Key: Char);
    procedure btnVisualizarClick(Sender: TObject);
    procedure BT_ProximoClick(Sender: TObject);
    procedure BT_AnteriorClick(Sender: TObject);
    procedure BT_NovaClick(Sender: TObject);
    procedure Cliente_Base_IcmsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure O_Mesmo_Entrega();
    procedure O_Mesmo_Cobranca();
    procedure Exibe_Exemplo_Codigo();
    procedure Carrega_Informacoes();

  public
    { Public declarations }
  end;

var
  Codigo_Cliente, Tipo_Codigo_Cliente: String;
  Clientes02: TClientes02;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_01;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TClientes02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     {
     If Trim(Cliente_Razao_Social.Text) = '' Then
        Begin
        Erro          := 'A Razão Social do Cliente não foi informada';
        Campo_Retorno := 'Cliente_Razao_Social';
        End
     Else If Trim(Cliente_Endereco.Text) = '' Then
        Begin
        Erro          := 'O Endereço do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Endereco';
        End
     Else If Trim(Cliente_Bairro.Text) = '' Then
        Begin
        Erro          := 'O Bairro do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Bairro';
        End
     Else If Trim(Cliente_Cidade.Text) = '' Then
        Begin
        Erro          := 'A Cidade do Cliente não foi informada';
        Campo_Retorno := 'Cliente_Cidade';
        End
     Else If Trim(Cliente_Cep.Text) = '-' Then
        Begin
        Erro          := 'O CEP do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Cep';
        End
     Else If Trim(Cliente_Endereco_Cobranca.Text) = '' Then
        Begin
        Erro          := 'O Endereço de Cobrança do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Endereco_Cobranca';
        End
     Else If Trim(Cliente_Bairro_Cobranca.Text) = '' Then
        Begin
        Erro          := 'O Bairro de Cobrança do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Bairro_Cobranca';
        End
     Else If Trim(Cliente_Cidade_Cobranca.Text) = '' Then
        Begin
        Erro          := 'A Cidade de Cobrança do Cliente não foi informada';
        Campo_Retorno := 'Cliente_Cidade_Cobranca';
        End
     Else If Trim(Cliente_Cep_Cobranca.Text) = '-' Then
        Begin
        Erro          := 'O CEP de Cobrança do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Cep_Cobranca';
        End
     Else If Trim(Cliente_Data_Inclusao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Inclusão não foi informada';
        Campo_Retorno := 'Cliente_Data_Inclusao';
        End
     Else If Trim(Cliente_Data_Visita.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Visita não foi informada';
        Campo_Retorno := 'Cliente_Data_Visita';
        End
     Else If Trim(Cliente_Data_Alteracao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Alteração não foi informada';
        Campo_Retorno := 'Cliente_Data_Alteracao';
        End
     Else If Trim(Cliente_Data_Ultima_Compra.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Compra não foi informada';
        Campo_Retorno := 'Cliente_Data_Ultima_Compra';
        End
     Else If Trim(Cliente_Desconto.Text) = '' Then
        Begin
        Erro          := 'A Porcentagem de Desconto não foi informada';
        Campo_Retorno := 'Cliente_Desconto';
     End; }

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Cliente_Codigo_CNPJ' Then
           Begin
           Cliente_Codigo_CNPJ.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Codigo_CPF' Then
           Begin
           Cliente_Codigo_CPF.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Codigo_RG' Then
           Begin
           Cliente_Codigo_RG.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Codigo_EMail' Then
           Begin
           Cliente_Codigo_EMail.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Nome' Then
           Begin
           Cliente_Nome.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Endereco' Then
           Begin
           Cliente_Endereco.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Bairro' Then
           Begin
           Cliente_Bairro.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cidade' Then
           Begin
           Cliente_Cidade.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cep' Then
           Begin
           Cliente_Cep.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Endereco_Cobranca' Then
           Begin
           Cliente_Endereco_Cobranca.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Bairro_Cobranca' Then
           Begin
           Cliente_Bairro_Cobranca.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cidade_Cobranca' Then
           Begin
           Cliente_Cidade_Cobranca.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cep_Cobranca' Then
           Begin
           Cliente_Cep_Cobranca.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Data_Inclusao' Then
           Begin
           Cliente_Data_Inclusao.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Data_Visita' Then
           Begin
           Cliente_Data_Visita.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Data_Alteracao' Then
           Begin
           Cliente_Data_Alteracao.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Data_Ultima_Compra' Then
           Begin
           Cliente_Data_Ultima_Compra.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Desconto' Then
           Begin
           Cliente_Desconto.SetFocus;
        End;
     End;

     Result := Resultado;

end;

//******************
//*** Procedures ***
//******************

procedure TClientes02.O_Mesmo_Cobranca();
begin
     If Cliente_Opcao_Cobranca.Text = 'O Mesmo' Then
        Begin
        Cliente_Endereco_Cobranca.Text    := Cliente_Endereco.Text;
        Cliente_Bairro_Cobranca.Text      := Cliente_Bairro.Text;
        Cliente_Cidade_Cobranca.Text      := Cliente_Cidade.Text;
        Cliente_Estado_Cobranca.ItemIndex := Cliente_Estado.ItemIndex;
        Cliente_Cep_Cobranca.Text         := Cliente_Cep.Text;
        Cliente_Fone_Cobranca.Text        := Cliente_Fone.Text;
        Cliente_Fax_Cobranca.Text         := Cliente_Fax.Text;
     End;
end;

procedure TClientes02.O_Mesmo_Entrega();
begin
     If Cliente_Opcao_Entrega.Text = 'O Mesmo' Then
        Begin
        Cliente_Endereco_Entrega.Text    := Cliente_Endereco.Text;
        Cliente_Bairro_Entrega.Text      := Cliente_Bairro.Text;
        Cliente_Cidade_Entrega.Text      := Cliente_Cidade.Text;
        Cliente_Estado_Entrega.ItemIndex := Cliente_Estado.ItemIndex;
        Cliente_Cep_Entrega.Text         := Cliente_Cep.Text;
        Cliente_Fone_Entrega.Text        := Cliente_Fone.Text;
        Cliente_Fax_Entrega.Text         := Cliente_Fax.Text;
     End;
end;

procedure TClientes02.Exibe_Exemplo_Codigo();
begin
     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 99.999.999/9999-99)';
        Cliente_Codigo_CNPJ.Visible  := True;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 999.999.999-99)';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := True;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := True;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := True;
        End
     Else
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
     End;
end;

procedure TClientes02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TClientes02.BT_SairClick(Sender: TObject);
begin
     Clientes02.Close;
end;

procedure TClientes02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;

        If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
           Begin
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CNPJ.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
           Begin
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CPF.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'RG' Then
           Begin
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_RG.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_EMail.Text) + #39 );
        End;

        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Clientes02.Close;
     End;
end;

procedure TClientes02.FormShow(Sender: TObject);
var Comando_SQL: string;
begin
    Exibe_Exemplo_Codigo();
end;

procedure TClientes02.BT_AlterarClick(Sender: TObject);

var
   Tipo_Pessoa, Status_Credito, Vlr_Credito, Vlr_Ultima_Compra, Banco, Representante, Comando_SQL: String;
   ICMS, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Tipo_Transporte, Transportadora, Emite_Lote, Consumo: String;

begin
     If Valida_Dados() Then
        Begin

        //*** Obtem o Tipo de Pessoa ***

        If Cliente_Tipo_Pessoa.Text = 'Pessoa Jurídica' Then
           Begin
           Tipo_Pessoa := 'PJ';
           End
        Else
           Begin
           Tipo_Pessoa := 'PF';
        End;

        //*** Obtem o Status do Crédito ***

        If Cliente_Status_Credito.Text = 'Sim' Then
           Begin
           Status_Credito := 'S';
           End
        Else
           Begin
           Status_Credito := 'N';
        End;

        //*** Obtem os Valores ***

        Vlr_Ultima_Compra := Trim(Virgula_Ponto(Cliente_Ultimo_Valor.Text));
        ICMS              := '0';
        Desconto          := Trim(Virgula_Ponto(Cliente_Desconto.Text));
        Cond_Pgto_1       := '0';
        Cond_Pgto_2       := '0';
        Cond_Pgto_3       := '0';
        Cond_Pgto_4       := '0';

        If Trim(Vlr_Credito) = '' Then
           Begin
           Vlr_Credito := '0';
        End;

        If Trim(Vlr_Ultima_Compra) = '' Then
           Begin
           Vlr_Ultima_Compra := '0';
        End;

        If Trim(ICMS) = '' Then
           Begin
           ICMS := '0';
        End;

        If Trim(Desconto) = '' Then
           Begin
           Desconto := '0';
        End;

        If Trim(Cond_Pgto_1) = '' Then
           Begin
           Cond_Pgto_1 := '0';
        End;

        If Trim(Cond_Pgto_2) = '' Then
           Begin
           Cond_Pgto_2 := '0';
        End;

        If Trim(Cond_Pgto_3) = '' Then
           Begin
           Cond_Pgto_3 := '0';
        End;

        If Trim(Cond_Pgto_4) = '' Then
           Begin
           Cond_Pgto_4 := '0';
        End;

        //*** Obtem Alguns Dados do Pedido ***

        Tipo_Transporte  := '0';

        //*** Obtem o Nro do Tipo de Cliente, Banco, Zona e Representante ***

        Banco          := '0';
        Representante  := '0';
        Transportadora := '0';

        //*** Efetua a Inserção ***

        Comando_SQL := 'Update mgt_clientes Set ';
        Comando_SQL := Comando_SQL + 'mgt_cliente_codigo_tipo = ' + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_nome = ' + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_razao_social = ' + #39 + Trim(Cliente_Razao_Social.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_municipal = ' + #39 + Trim(Cliente_Inscricao_Municipal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_estadual = ' + #39 + Trim(Cliente_Inscricao_Estadual.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco = ' + #39 + Trim(Cliente_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro = ' + #39 + Trim(Cliente_Bairro.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade = ' + #39 + Trim(Cliente_Cidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado = ' + #39 + Trim(Cliente_Estado.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep = ' + #39 + Trim(Cliente_Cep.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone = ' + #39 + Trim(Cliente_Fone.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax = ' + #39 + Trim(Cliente_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_contato = ' + #39 + Trim(Cliente_Contato.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_comercial = ' + #39 + Trim(Cliente_Fone_Comercial.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_celular = ' + #39 + Trim(Cliente_Fone_Celular.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_fax = ' + #39 + Trim(Cliente_Fone_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_cobranca = ' + #39 + Trim(Cliente_Endereco_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_cobranca = ' + #39 + Trim(Cliente_Bairro_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_cobranca = ' + #39 + Trim(Cliente_Cidade_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado_cobranca = ' + #39 + Trim(Cliente_Estado_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep_cobranca = ' + #39 + Trim(Cliente_Cep_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_cobranca = ' + #39 + Trim(Cliente_Fone_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax_cobranca = ' + #39 + Trim(Cliente_Fax_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_entrega = ' + #39 + Trim(Cliente_Endereco_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_entrega = ' + #39 + Trim(Cliente_Bairro_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_entrega = ' + #39 + Trim(Cliente_Cidade_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado_entrega = ' + #39 + Trim(Cliente_Estado_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep_entrega = ' + #39 + Trim(Cliente_Cep_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_entrega = ' + #39 + Trim(Cliente_Fone_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax_entrega = ' + #39 + Trim(Cliente_Fax_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_valor_credito = ' + Trim(Vlr_Credito) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_status_credito = ' + #39 + Trim(Status_Credito) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_banco = ' + Trim(Banco) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_vendedor = ' + Trim(Representante) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_tipo_pessoa = ' + #39 + Trim(Tipo_Pessoa) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_inclusao = ' + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Inclusao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_visita = ' + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Visita.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_alteracao = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_ultima_compra = ' + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Ultima_Compra.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_ultimo_valor = ' + Trim(Vlr_Ultima_Compra) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_observacoes = ' + #39 + Trim(Cliente_Observacoes.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_observacoes_nota = ' + #39 + Trim(Cliente_Observacoes_Nota.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_pais = ' + #39 + Trim(Cliente_Pais.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_opcao_cobranca = ' + #39 + Trim(Cliente_Opcao_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_opcao_entrega = ' + #39 + Trim(Cliente_Opcao_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_email = ' + #39 + Trim(Cliente_Email.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_site = ' + #39 + Trim(Cliente_Site.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_desconto = ' + Trim(Desconto) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_1 = ' + Trim(Cond_Pgto_1) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_2 = ' + Trim(Cond_Pgto_2) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_3 = ' + Trim(Cond_Pgto_3) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_4 = ' + Trim(Cond_Pgto_4) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_tipo_transporte = ' + #39 + Trim(Tipo_Transporte) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_transportadora = ' + Trim(Transportadora) + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_consumo = ' + #39 + Trim(Consumo) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_suframa = ' + #39 + Trim('0') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_emite_lote = ' + #39 + Trim(Emite_Lote) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_pgto_frete = ' + #39 + Trim('0') + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_base_icms = ' + #39 + Virgula_Ponto(Trim('0')) + #39 + ',';
        Comando_SQL := Comando_SQL + 'mgt_cliente_icms = ' + Trim(ICMS);

        If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
           Begin
           Comando_SQL := Comando_SQL + ' Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CNPJ.Text) + #39;
           End
        Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
           Begin
           Comando_SQL := Comando_SQL + ' Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CPF.Text) + #39;
           End
        Else If Cliente_Codigo_Tipo.Text = 'RG' Then
           Begin
           Comando_SQL := Comando_SQL + ' Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_RG.Text) + #39;
           End
        Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
           Begin
           Comando_SQL := Comando_SQL + ' Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_EMail.Text) + #39;
        End;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        If Trim(Programa_Anterior.Text) <> '' Then
           Begin
           Clientes02.Close;
        End;   
     End;
end;

procedure TClientes02.Cliente_Opcao_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     O_Mesmo_Cobranca();

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Opcao_CobrancaChange(Sender: TObject);
begin
     O_Mesmo_Cobranca();
end;

procedure TClientes02.Cliente_CepKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Cep_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_DDDKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_TipoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Valor_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Ultimo_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Tipo_PessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Inscricao_MunicipalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_NomeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Razao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Inscricao_EstadualKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_ComplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Data_InclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Data_VisitaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_PaisKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Data_Ultima_CompraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Endereco_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Complemento_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Status_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Bairro_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Cidade_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Estado_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Pais_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_ComercialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_ResidencialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_CelularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_EmailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_ZonaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_VendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_ConsignacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Tipo_TransporteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Emite_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Opcao_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     O_Mesmo_Entrega();

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Opcao_EntregaChange(Sender: TObject);
begin
     O_Mesmo_Entrega();
end;

procedure TClientes02.Cliente_Endereco_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Bairro_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Cidade_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Estado_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Cep_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fax_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fone_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_Fax_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_IcmsKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Transportadora_Nao_CadastradaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.Cliente_SuframaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes02.btnVisualizarClick(Sender: TObject);
var
    Cliente_Codigo : string;
begin
end;

procedure TClientes02.BT_ProximoClick(Sender: TObject);
begin
     If StrToInt(Movto_Pos_Atual.Text) < StrToInt(Movto_Pos_Total.Text) Then
        Begin

        Movto_Pos_Atual.Text := IntToStr(StrToInt(Movto_Pos_Atual.Text) + 1);
        Codigo_Cliente       := Trim(SGD_Movto_Clientes.Cells[1,StrToInt(Movto_Pos_Atual.Text)]);
        Tipo_Codigo_Cliente  := Trim(SGD_Movto_Clientes.Cells[2,StrToInt(Movto_Pos_Atual.Text)]);

        Carrega_Informacoes();
     End;
end;

procedure TClientes02.BT_AnteriorClick(Sender: TObject);
begin
     If StrToInt(Movto_Pos_Atual.Text) > 0 Then
        Begin

        Movto_Pos_Atual.Text := IntToStr(StrToInt(Movto_Pos_Atual.Text) - 1);
        Codigo_Cliente       := Trim(SGD_Movto_Clientes.Cells[1,StrToInt(Movto_Pos_Atual.Text)]);
        Tipo_Codigo_Cliente  := Trim(SGD_Movto_Clientes.Cells[2,StrToInt(Movto_Pos_Atual.Text)]);

        Carrega_Informacoes();
     End;
end;

procedure TClientes02.Carrega_Informacoes();
begin
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
        Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
        End
     Else If Tipo_Codigo_Cliente = 'CPF' Then
        Begin
        Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
        End
     Else If Tipo_Codigo_Cliente = 'RG' Then
        Begin
        Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
        End
     Else If Tipo_Codigo_Cliente = 'E-Mail' Then
        Begin
        Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
     End;

     Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo_tipo').Text);
     Cliente_Nome.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_nome').Text;
     Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_razao_social').Text;
     Cliente_Inscricao_Municipal.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_municipal').Text;
     Cliente_Inscricao_Estadual.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_estadual').Text;
     Cliente_Endereco.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco').Text;
     Cliente_Bairro.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro').Text;
     Cliente_Cidade.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade').Text;
     Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado').Text);
     Cliente_Cep.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep').Text;
     Cliente_Fone.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone').Text;
     Cliente_Fax.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax').Text;
     Cliente_Contato.Text              := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_contato').Text;
     Cliente_Fone_Comercial.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_comercial').Text;
     Cliente_Fone_Celular.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_celular').Text;
     Cliente_Fone_Fax.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_fax').Text;
     Cliente_Endereco_Entrega.Text     := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_entrega').Text;
     Cliente_Bairro_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_entrega').Text;
     Cliente_Cidade_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_entrega').Text;
     Cliente_Estado_Entrega.ItemIndex  := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_entrega').Text);
     Cliente_Cep_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_entrega').Text;
     Cliente_Fone_Entrega.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_entrega').Text;
     Cliente_Fax_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_entrega').Text;
     Cliente_Endereco_Cobranca.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_cobranca').Text;
     Cliente_Bairro_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_cobranca').Text;
     Cliente_Cidade_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_cobranca').Text;
     Cliente_Estado_Cobranca.ItemIndex := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_cobranca').Text);
     Cliente_Cep_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_cobranca').Text;
     Cliente_Fone_Cobranca.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_cobranca').Text;
     Cliente_Fax_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_cobranca').Text;
     Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_status_credito').Text);
     Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_tipo_pessoa').Text);
     Cliente_Data_Inclusao.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_inclusao').Text;
     Cliente_Data_Visita.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_visita').Text;
     Cliente_Data_Alteracao.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_alteracao').Text;
     Cliente_Data_Ultima_Compra.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_ultima_compra').Text;
     Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_ultimo_valor').Text;

     Cliente_Observacoes.Lines.Clear;
     Cliente_Observacoes.Lines.Add(DBG_Cliente_Observacao.Text);

     Cliente_Observacoes_Nota.Lines.Clear;
     Cliente_Observacoes_Nota.Lines.Add(DBG_Cliente_Observacao_Nota.Text);

     Cliente_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_pais').Text);

     Cliente_Opcao_Cobranca.ItemIndex  := Obtem_Nro_Opcao_Cobranca(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_cobranca').Text);
     Cliente_Opcao_Entrega.ItemIndex   := Obtem_Nro_Opcao_Entrega(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_entrega').Text);
     Cliente_Email.Text                := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_email').Text;
     Cliente_Site.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_site').Text;

     Cliente_Desconto.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_desconto').Text;
end;

procedure TClientes02.BT_NovaClick(Sender: TObject);
begin
     If Confirma('Deseja abrir uma Nova Ficha de Cliente copiando este Dados?') = 6 Then
        Begin

        Application.CreateForm(TClientes01,Clientes01);

        //*** Obtem os Dados do Cliente ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;

        If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CNPJ.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CPF.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'RG' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_RG.Text) + #39 );
           End
        Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_EMail.Text) + #39 );
        End;

        ConexaoBD.SQL_Clientes.Open;

        //*** Iniciar - Gerar os Dados - Inclusão***

        If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
           Begin
           Clientes01.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
           End
        Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
           Begin
           Clientes01.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
           End
        Else If Cliente_Codigo_Tipo.Text = 'RG' Then
           Begin
           Clientes01.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
           End
        Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
           Begin
           Clientes01.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text;
        End;

        Clientes01.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo_tipo').Text);
        Clientes01.Cliente_Nome.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_nome').Text;
        Clientes01.Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_razao_social').Text;
        Clientes01.Cliente_Inscricao_Municipal.Text  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_municipal').Text;
        Clientes01.Cliente_Inscricao_Estadual.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_inscricao_estadual').Text;
        Clientes01.Cliente_Endereco.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco').Text;
        Clientes01.Cliente_Bairro.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro').Text;
        Clientes01.Cliente_Cidade.Text               := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade').Text;
        Clientes01.Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado').Text);
        Clientes01.Cliente_Cep.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep').Text;
        Clientes01.Cliente_Fone.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone').Text;
        Clientes01.Cliente_Fax.Text                  := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax').Text;
        Clientes01.Cliente_Contato.Text              := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_contato').Text;
        Clientes01.Cliente_Fone_Comercial.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_comercial').Text;
        Clientes01.Cliente_Fone_Celular.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_celular').Text;
        Clientes01.Cliente_Fone_Fax.Text             := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_fax').Text;
        Clientes01.Cliente_Endereco_Entrega.Text     := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_entrega').Text;
        Clientes01.Cliente_Bairro_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_entrega').Text;
        Clientes01.Cliente_Cidade_Entrega.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_entrega').Text;
        Clientes01.Cliente_Estado_Entrega.ItemIndex  := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_entrega').Text);
        Clientes01.Cliente_Cep_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_entrega').Text;
        Clientes01.Cliente_Fone_Entrega.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_entrega').Text;
        Clientes01.Cliente_Fax_Entrega.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_entrega').Text;
        Clientes01.Cliente_Endereco_Cobranca.Text    := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_endereco_cobranca').Text;
        Clientes01.Cliente_Bairro_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_bairro_cobranca').Text;
        Clientes01.Cliente_Cidade_Cobranca.Text      := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cidade_cobranca').Text;
        Clientes01.Cliente_Estado_Cobranca.ItemIndex := Obtem_Nro_Estado(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_estado_cobranca').Text);
        Clientes01.Cliente_Cep_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_cep_cobranca').Text;
        Clientes01.Cliente_Fone_Cobranca.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fone_cobranca').Text;
        Clientes01.Cliente_Fax_Cobranca.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_fax_cobranca').Text;
        Clientes01.Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_status_credito').Text);
        Clientes01.Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_tipo_pessoa').Text);
        Clientes01.Cliente_Data_Inclusao.Text        := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_inclusao').Text;
        Clientes01.Cliente_Data_Visita.Text          := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_visita').Text;
        Clientes01.Cliente_Data_Alteracao.Text       := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_alteracao').Text;
        Clientes01.Cliente_Data_Ultima_Compra.Text   := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_data_ultima_compra').Text;
        Clientes01.Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_ultimo_valor').Text;

        Clientes01.Cliente_Observacoes.Lines.Clear;
        Clientes01.Cliente_Observacoes.Lines.Add(DBG_Cliente_Observacao.Text);

        Clientes01.Cliente_Observacoes_Nota.Lines.Clear;
        Clientes01.Cliente_Observacoes_Nota.Lines.Add(DBG_Cliente_Observacao_Nota.Text);

        Clientes01.Cliente_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_pais').Text);

        Clientes01.Cliente_Opcao_Cobranca.ItemIndex  := Obtem_Nro_Opcao_Cobranca(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_cobranca').Text);
        Clientes01.Cliente_Opcao_Entrega.ItemIndex   := Obtem_Nro_Opcao_Entrega(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_opcao_entrega').Text);
        Clientes01.Cliente_Email.Text                := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_email').Text;
        Clientes01.Cliente_Site.Text                 := ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_site').Text;

        //*** Final - Gerar os Dados - Inclusão***

        Clientes01.ShowModal;

        Clientes02.Close;

     End;
end;

procedure TClientes02.Cliente_Base_IcmsKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
