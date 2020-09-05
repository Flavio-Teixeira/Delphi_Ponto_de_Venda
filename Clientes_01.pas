unit Clientes_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TClientes01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Cliente_Codigo_Tipo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Cliente_Nome: TEdit;
    Label4: TLabel;
    Cliente_Razao_Social: TEdit;
    Label6: TLabel;
    Cliente_Tipo_Pessoa: TComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Cliente_Inscricao_Municipal: TEdit;
    Label8: TLabel;
    Cliente_Inscricao_Estadual: TEdit;
    Label13: TLabel;
    Cliente_Endereco: TEdit;
    Label15: TLabel;
    Cliente_Bairro: TEdit;
    Label16: TLabel;
    Cliente_Cidade: TEdit;
    Label19: TLabel;
    Cliente_Estado: TComboBox;
    Label17: TLabel;
    Cliente_Cep: TMaskEdit;
    Label20: TLabel;
    Cliente_Pais: TComboBox;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Cliente_Endereco_Entrega: TEdit;
    Cliente_Bairro_Entrega: TEdit;
    Cliente_Cidade_Entrega: TEdit;
    Cliente_Estado_Entrega: TComboBox;
    Cliente_Cep_Entrega: TMaskEdit;
    Label27: TLabel;
    Cliente_Opcao_Entrega: TComboBox;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Cliente_Contato: TEdit;
    Label30: TLabel;
    Cliente_Fone_Comercial: TEdit;
    Label32: TLabel;
    Cliente_Fone_Celular: TEdit;
    Label33: TLabel;
    Cliente_Fone_Fax: TEdit;
    GroupBox5: TGroupBox;
    Cliente_Data_Inclusao: TMaskEdit;
    Cliente_Data_Visita: TMaskEdit;
    Cliente_Data_Alteracao: TMaskEdit;
    Cliente_Data_Ultima_Compra: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Cliente_Observacoes: TMemo;
    Label36: TLabel;
    GroupBox6: TGroupBox;
    Label38: TLabel;
    Cliente_Status_Credito: TComboBox;
    Label39: TLabel;
    Cliente_Ultimo_Valor: TEdit;
    Cliente_Mensagem_Mascara: TLabel;
    Label44: TLabel;
    Cliente_Email: TEdit;
    Cliente_Codigo_CNPJ: TMaskEdit;
    Cliente_Codigo_CPF: TMaskEdit;
    Cliente_Codigo_RG: TEdit;
    Cliente_Codigo_EMail: TEdit;
    Programa_Anterior: TEdit;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label37: TLabel;
    Label51: TLabel;
    Label54: TLabel;
    Cliente_Endereco_Cobranca: TEdit;
    Cliente_Bairro_Cobranca: TEdit;
    Cliente_Cidade_Cobranca: TEdit;
    Cliente_Estado_Cobranca: TComboBox;
    Cliente_Cep_Cobranca: TMaskEdit;
    Cliente_Opcao_Cobranca: TComboBox;
    Label29: TLabel;
    Cliente_Site: TEdit;
    Label26: TLabel;
    Cliente_Fone_Cobranca: TEdit;
    Cliente_Fax_Cobranca: TEdit;
    Label31: TLabel;
    Label34: TLabel;
    Cliente_Fone_Entrega: TEdit;
    Cliente_Fax_Entrega: TEdit;
    Label35: TLabel;
    Label50: TLabel;
    Cliente_Observacoes_Nota: TMemo;
    Label53: TLabel;
    Cliente_Fone: TEdit;
    Label55: TLabel;
    Cliente_Fax: TEdit;
    Nro_Banco: TEdit;
    Nro_Representante: TEdit;
    Nro_Transportadora: TEdit;
    Label40: TLabel;
    Cliente_Desconto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Cliente_Codigo_TipoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_TipoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_PessoaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Inscricao_MunicipalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Razao_SocialKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Inscricao_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_BairroKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_EstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Data_InclusaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Data_VisitaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Data_AlteracaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Data_Ultima_CompraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Opcao_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Endereco_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Complemento_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Bairro_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Cidade_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Estado_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Cep_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Pais_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Status_CreditoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Valor_CreditoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_ContatoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_DDDKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_RamalKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fone_ResidencialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fone_CelularKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ZonaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ConsignacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Ultimo_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Cliente_Codigo_TipoChange(Sender: TObject);
    procedure Cliente_Opcao_EntregaChange(Sender: TObject);
    procedure Cliente_EmailKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Codigo_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Codigo_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Codigo_EMailKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Codigo_RGKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Cliente_Codigo_EMailExit(Sender: TObject);
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
    procedure Cliente_FoneKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fax_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Fone_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Fax_CobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_SiteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Condicao_Pgto_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_SuframaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ConsumoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Opcao_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Opcao_CobrancaChange(Sender: TObject);
    procedure Cliente_IcmsKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_Nao_CadastradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Codigo_CNPJExit(Sender: TObject);
    procedure Cliente_Base_IcmsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure O_Mesmo_Entrega();
    procedure O_Mesmo_Cobranca();    
    procedure Exibe_Exemplo_Codigo();
  public
    { Public declarations }
  end;

var
  Clientes01: TClientes01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TClientes01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        If Trim(Cliente_Codigo_CNPJ.Text) = '.   .   /    -' Then
           Begin
           Erro          := 'O CNPJ do Cliente não foi informado';
           Campo_Retorno := 'Cliente_Codigo_CNPJ';
           End
        Else
           Begin
           If Not Valida_CNPJ(Cliente_Codigo_CNPJ.Text) Then
              Begin
              Erro          := 'O CNPJ do Cliente não está correto';
              Campo_Retorno := 'Cliente_Codigo_CNPJ';
           End;
        End;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        If Trim(Cliente_Codigo_CPF.Text) = '.   .   -' Then
           Begin
           Erro          := 'O CPF do Cliente não foi informado';
           Campo_Retorno := 'Cliente_Codigo_CPF';
           End
        Else
           Begin
           If Not Valida_CPF(Cliente_Codigo_CPF.Text) Then
              Begin
              Erro          := 'O CPF do Cliente não está correto';
              Campo_Retorno := 'Cliente_Codigo_CPF';
           End;
        End;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        If Trim(Cliente_Codigo_RG.Text) = '' Then
           Begin
           Erro          := 'O RG do Cliente não foi informado';
           Campo_Retorno := 'Cliente_Codigo_RG';
        End;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        If Trim(Cliente_Codigo_EMail.Text) = '' Then
           Begin
           Erro          := 'O E-Mail do Cliente não foi informado';
           Campo_Retorno := 'Cliente_Codigo_EMail';
        End;
     End;

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
     Else If Trim(Cliente_Endereco_Entrega.Text) = '' Then
        Begin
        Erro          := 'O Endereço de Entrega do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Endereco_Entrega';
        End
     Else If Trim(Cliente_Bairro_Entrega.Text) = '' Then
        Begin
        Erro          := 'O Bairro de Entrega do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Bairro_Entrega';
        End
     Else If Trim(Cliente_Cidade_Entrega.Text) = '' Then
        Begin
        Erro          := 'A Cidade de Entrega do Cliente não foi informada';
        Campo_Retorno := 'Cliente_Cidade_Entrega';
        End
     Else If Trim(Cliente_Cep_Entrega.Text) = '-' Then
        Begin
        Erro          := 'O CEP de Entrega do Cliente não foi informado';
        Campo_Retorno := 'Cliente_Cep_Entrega';
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
        End
     Else
        Begin }
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

        If ConexaoBD.SQL_Clientes.RecordCount > 0 Then
           Begin
           Erro          := 'O Código do Cliente Já existe';

           If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_CNPJ';
              End
           Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_CPF';
              End
           Else If Cliente_Codigo_Tipo.Text = 'RG' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_RG';
              End
           Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_EMail';
           End;
        End;
     //End;

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
        Else If Campo_Retorno = 'Cliente_Razao_Social' Then
           Begin
           Cliente_Razao_Social.SetFocus;
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
        Else If Campo_Retorno = 'Cliente_Endereco_Entrega' Then
           Begin
           Cliente_Endereco_Entrega.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Bairro_Entrega' Then
           Begin
           Cliente_Bairro_Entrega.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cidade_Entrega' Then
           Begin
           Cliente_Cidade_Entrega.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Cep_Entrega' Then
           Begin
           Cliente_Cep_Entrega.SetFocus;
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

procedure TClientes01.O_Mesmo_Entrega();
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

procedure TClientes01.O_Mesmo_Cobranca();
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

procedure TClientes01.Exibe_Exemplo_Codigo();
begin
     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 99.999.999/9999-99)';
        Cliente_Codigo_CNPJ.Text     := '';
        Cliente_Codigo_CNPJ.Visible  := True;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        Cliente_Codigo_CNPJ.SetFocus;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 999.999.999-99)';
        Cliente_Codigo_CPF.Text      := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := True;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        Cliente_Codigo_CPF.SetFocus;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_RG.Text       := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := True;
        Cliente_Codigo_EMail.Visible := False;
        Cliente_Codigo_RG.SetFocus;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_EMail.Text    := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := True;
        Cliente_Codigo_EMail.SetFocus;
        End
     Else
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
     End;
end;

procedure TClientes01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TClientes01.BT_SairClick(Sender: TObject);
begin
     Clientes01.Close;
end;

procedure TClientes01.Cliente_Codigo_TipoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_TipoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Tipo_PessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Inscricao_MunicipalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_NomeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Razao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        If Trim(Cliente_Nome.Text) = '' Then
           Begin
           Cliente_Nome.Text := Cliente_Razao_Social.Text;
        End;

        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Inscricao_EstadualKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_ComplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_CepKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_PaisKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Data_InclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Data_VisitaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Data_Ultima_CompraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Opcao_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     O_Mesmo_Entrega();

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Endereco_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Complemento_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Bairro_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Cidade_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Estado_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Cep_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Pais_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Status_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Valor_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_DDDKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_ComercialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_ResidencialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_CelularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_ZonaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_VendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_ConsignacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Ultimo_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.FormShow(Sender: TObject);
begin
     Exibe_Exemplo_Codigo();

     //*** Carrega as Datas ***

     Cliente_Data_Inclusao.Text      := DateToStr(Date());
     Cliente_Data_Visita.Text        := DateToStr(Date());
     Cliente_Data_Ultima_Compra.Text := DateToStr(Date());
     Cliente_Data_Alteracao.Text     := DateToStr(Date());
end;

procedure TClientes01.Cliente_Codigo_TipoChange(Sender: TObject);
begin
     Exibe_Exemplo_Codigo();
end;

procedure TClientes01.Cliente_Opcao_EntregaChange(Sender: TObject);
begin
     O_Mesmo_Entrega();
end;

procedure TClientes01.Cliente_EmailKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Codigo_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Codigo_CPFKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Codigo_EMailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Codigo_RGKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.BT_IncluirClick(Sender: TObject);

var
   Tipo_Pessoa, Status_Credito, Vlr_Credito, Vlr_Ultima_Compra, Tipo_Cliente, Banco, Zona, Representante, Comando_SQL: String;
   ICMS, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Tipo_Transporte, Transportadora, Emite_Lote: String;
   Consumo: String;

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

        If Trim(Icms) = '' Then
           Begin
           Icms := '0';
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

        Comando_SQL := 'Insert Into mgt_clientes(';
        Comando_SQL := Comando_SQL + 'mgt_cliente_codigo,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_codigo_tipo,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_nome,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_razao_social,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_municipal,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_inscricao_estadual,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_contato,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_comercial,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_celular,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_fax,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_endereco_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_bairro_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cidade_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_estado_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_cep_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fone_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_fax_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_status_credito,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_banco,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_vendedor,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_tipo_pessoa,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_inclusao,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_visita,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_alteracao,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_data_ultima_compra,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_ultimo_valor,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_observacoes,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_observacoes_nota,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_pais,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_opcao_cobranca,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_opcao_entrega,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_email,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_site,';        
        Comando_SQL := Comando_SQL + 'mgt_cliente_desconto,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_1,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_2,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_3,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_condicao_pgto_4,';        
        Comando_SQL := Comando_SQL + 'mgt_cliente_tipo_transporte,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_transportadora,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_consumo,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_suframa,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_emite_lote,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_pgto_frete,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_base_icms,';
        Comando_SQL := Comando_SQL + 'mgt_cliente_icms) ';
        Comando_SQL := Comando_SQL + 'Values(';

        If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
           Begin
           Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_CNPJ.Text) + #39 + ',';
           End
        Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
           Begin
           Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_CPF.Text) + #39 + ',';
           End
        Else If Cliente_Codigo_Tipo.Text = 'RG' Then
           Begin
           Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_RG.Text) + #39 + ',';
           End
        Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
           Begin
           Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_EMail.Text) + #39 + ',';
        End;

        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Razao_Social.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Inscricao_Municipal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Inscricao_Estadual.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Bairro.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cep.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Contato.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone_Comercial.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone_Celular.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Endereco_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Bairro_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cidade_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cep_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fax_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Endereco_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Bairro_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cidade_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Cep_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fone_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Fax_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Status_Credito) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Banco) + ',';
        Comando_SQL := Comando_SQL + Trim(Representante) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Tipo_Pessoa) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Inclusao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Visita.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Alteracao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Cliente_Data_Ultima_Compra.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Vlr_Ultima_Compra) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Observacoes.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Observacoes_Nota.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Pais.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Opcao_Cobranca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Opcao_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Email.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Site.Text) + #39 + ',';        
        Comando_SQL := Comando_SQL + Trim(Desconto) + ',';
        Comando_SQL := Comando_SQL + Trim(Cond_Pgto_1) + ',';
        Comando_SQL := Comando_SQL + Trim(Cond_Pgto_2) + ',';
        Comando_SQL := Comando_SQL + Trim(Cond_Pgto_3) + ',';
        Comando_SQL := Comando_SQL + Trim(Cond_Pgto_4) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Tipo_Transporte) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Transportadora) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Consumo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim('0') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Emite_Lote) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim('0') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(Trim('0')) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(ICMS) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Cliente?') = 6 Then
           Begin
           Cliente_Codigo_Tipo.ItemIndex      := 0;
           Cliente_Codigo_CNPJ.Text           := '';
           Cliente_Codigo_CPF.Text            := '';
           Cliente_Codigo_RG.Text             := '';
           Cliente_Codigo_EMail.Text          := '';
           Cliente_Codigo_Tipo.Text           := '';
           Cliente_Nome.Text                  := '';
           Cliente_Razao_Social.Text          := '';
           Cliente_Inscricao_Municipal.Text   := '';
           Cliente_Inscricao_Estadual.Text    := '';
           Cliente_Endereco.Text              := '';
           Cliente_Bairro.Text                := '';
           Cliente_Cidade.Text                := '';
           Cliente_Estado.Text                := '';
           Cliente_Cep.Text                   := '';
           Cliente_Fone.Text                  := '';
           Cliente_Fax.Text                   := '';
           Cliente_Contato.Text               := '';
           Cliente_Fone_Comercial.Text        := '';
           Cliente_Fone_Celular.Text          := '';
           Cliente_Fone_Fax.Text              := '';
           Cliente_Endereco_Cobranca.Text     := '';
           Cliente_Bairro_Cobranca.Text       := '';
           Cliente_Cidade_Cobranca.Text       := '';
           Cliente_Estado_Cobranca.Text       := '';
           Cliente_Cep_Cobranca.Text          := '';
           Cliente_Fone_Cobranca.Text         := '';
           Cliente_Fax_Cobranca.Text          := '';
           Cliente_Endereco_Entrega.Text      := '';
           Cliente_Bairro_Entrega.Text        := '';
           Cliente_Cidade_Entrega.Text        := '';
           Cliente_Estado_Entrega.Text        := '';
           Cliente_Cep_Entrega.Text           := '';
           Cliente_Fone_Entrega.Text          := '';
           Cliente_Fax_Entrega.Text           := '';
           Cliente_Status_Credito.ItemIndex   := 0;
           Cliente_Tipo_Pessoa.ItemIndex      := 0;
           Cliente_Ultimo_Valor.Text          := '';
           Cliente_Observacoes.Text           := '';
           Cliente_Observacoes_Nota.Text      := '';
           Cliente_Pais.ItemIndex             := 0;
           Cliente_Opcao_Cobranca.ItemIndex   := 0;
           Cliente_Opcao_Entrega.ItemIndex    := 0;
           Cliente_Email.Text                 := '';
           Cliente_Site.Text                  := '';
           Cliente_Desconto.Text              := '0';

           //*** Carrega as Datas ***

           Cliente_Data_Inclusao.Text      := DateToStr(Date());
           Cliente_Data_Visita.Text        := DateToStr(Date());
           Cliente_Data_Ultima_Compra.Text := DateToStr(Date());
           Cliente_Data_Alteracao.Text     := DateToStr(Date());

           Exibe_Exemplo_Codigo();
           End
        Else
           Begin
           Clientes01.Close;
        End;
     End;
end;

procedure TClientes01.Cliente_Codigo_EMailExit(Sender: TObject);
begin
     Cliente_Email.Text := Cliente_Codigo_EMail.Text;
end;

procedure TClientes01.Cliente_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Tipo_TransporteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Emite_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_FoneKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_FaxKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fax_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fone_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Fax_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_SiteKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Condicao_Pgto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_SuframaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_ConsumoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Opcao_CobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     O_Mesmo_Cobranca();

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Opcao_CobrancaChange(Sender: TObject);
begin
     O_Mesmo_Cobranca();
end;

procedure TClientes01.Cliente_IcmsKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Transportadora_Nao_CadastradaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TClientes01.Cliente_Codigo_CNPJExit(Sender: TObject);

var
   Campo_Retorno, Erro: String;

begin
     //*** Valida o CNPJ ***

     If Trim(Cliente_Codigo_CNPJ.Text) <> '.   .   /    -' Then
        Begin

     //If Not Valida_CNPJ(Cliente_Codigo_CNPJ.Text) Then
     //   Begin
     //   MSG_Erro('O CNPJ do Cliente não está correto');
     //   Cliente_Codigo_CNPJ.SetFocus;
     //   End
     //Else
     //   Begin

        //*** Verifica se o CNPJ Já existe ***

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

        If ConexaoBD.SQL_Clientes.RecordCount > 0 Then
           Begin
           Erro := 'O Código do Cliente Já existe';

           If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_CNPJ';
              End
           Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_CPF';
              End
           Else If Cliente_Codigo_Tipo.Text = 'RG' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_RG';
              End
           Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
              Begin
              Campo_Retorno := 'Cliente_Codigo_EMail';
           End;
        End;

        If Trim(Erro) <> '' Then
           Begin
           MSG_Erro(Erro);
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
           End;
        End;
     //End;

     End;
end;

procedure TClientes01.Cliente_Base_IcmsKeyPress(Sender: TObject;
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
