unit Fornecedores_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFornecedores02 = class(TForm)
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    EditRazaoSocial: TEdit;
    EditNomeFantasia: TEdit;
    EditRamoAtividade: TEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    EditEndereco: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditCep: TMaskEdit;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Label44: TLabel;
    EditContato: TEdit;
    EditEmail: TEdit;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    EditFone_Comercial: TEdit;
    EditFone_Celular: TEdit;
    EditFone_Fax: TEdit;
    CBEstado: TComboBox;
    Label6: TLabel;
    lblNumero: TLabel;
    GroupBox5: TGroupBox;
    BT_Inicio: TBitBtn;
    BT_Anterior: TBitBtn;
    BT_Proximo: TBitBtn;
    BT_Final: TBitBtn;
    EditInscricaoEstadual: TEdit;
    Label9: TLabel;
    Cliente_Mensagem_Mascara: TLabel;
    EditCNPJ: TMaskEdit;
    Label2: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure EditCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure EditInscricaoEstadualKeyPress(Sender: TObject; var Key: Char);
    procedure EditRazaoSocialKeyPress(Sender: TObject; var Key: Char);
    procedure EditNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure EditRamoAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EditComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure EditBairroKeyPress(Sender: TObject; var Key: Char);
    procedure EditCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditCepKeyPress(Sender: TObject; var Key: Char);
    procedure CBEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure EditContatoKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure EditFone_ComercialKeyPress(Sender: TObject; var Key: Char);
    procedure EditFone_CelularKeyPress(Sender: TObject; var Key: Char);
    procedure EditFone_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_InicioClick(Sender: TObject);
    procedure BT_AnteriorClick(Sender: TObject);
    procedure BT_ProximoClick(Sender: TObject);
    procedure BT_FinalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fornecedores02: TFornecedores02;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TFornecedores02.BT_SairClick(Sender: TObject);
begin
  Fornecedores02.Close;
end;

procedure TFornecedores02.EditCNPJKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
        Begin
        So_Numero(Sender, Key);
     End;
end;

procedure TFornecedores02.EditInscricaoEstadualKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditRazaoSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditNomeFantasiaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditRamoAtividadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditComplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditBairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditCepKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
        Begin
        So_Numero(Sender, Key);
     End;
end;

procedure TFornecedores02.CBEstadoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditEmailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditFone_ComercialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditFone_CelularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.EditFone_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores02.FormShow(Sender: TObject);
begin

    Ampulheta();

      ConexaoBD.SQL_Fornecedores.Close;
      ConexaoBD.SQL_Fornecedores.SQL.Clear;
      ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from Fornecedores Where Fornecedor_Numero=' + Trim(lblNumero.Caption));
      ConexaoBD.SQL_Fornecedores.Open;

      EditCNPJ.Text               := ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text;
      EditInscricaoEstadual.Text  := ConexaoBD.SQL_FornecedoresFornecedor_IE.Text;
      EditRazaoSocial.Text        := ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text;
      EditRamoAtividade.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text;
      EditNomeFantasia.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text;
      EditEndereco.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text;
      EditComplemento.Text        := ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text;
      EditBairro.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text;
      EditCidade.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text;
      EditCep.Text                := ConexaoBD.SQL_FornecedoresFornecedor_Cep.Text;
      CBEstado.Text               := ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text;
      EditContato.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text;
      EditEmail.Text              := ConexaoBD.SQL_FornecedoresFornecedor_Email.Text;
      EditFone_Comercial.Text     := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text;
      EditFone_Celular.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text;
      EditFone_Fax.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text;

    Seta();
end;

procedure TFornecedores02.BT_AlterarClick(Sender: TObject);
Var
  ComandoSQL: String;
begin

  Ampulheta();

    If Trim(EditNomeFantasia.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Nome Fantasia...');
      EditNomeFantasia.SetFocus;
      End
    Else
      Begin

        ComandoSQL := 'Update Fornecedores Set ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Cnpj           ="' + Texto_Grava(EditCNPJ.Text)              + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_IE             ="' + Texto_Grava(EditInscricaoEstadual.Text) + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Razao_Social   ="' + Texto_Grava(EditRazaoSocial.Text)       + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Nome_Fantasia  ="' + Texto_Grava(EditNomeFantasia.Text)      + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Ramo_Atividade ="' + Texto_Grava(EditRamoAtividade.Text)     + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Endereco       ="' + Texto_Grava(EditEndereco.Text)          + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Complemento    ="' + Texto_Grava(EditComplemento.Text)       + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Bairro         ="' + Texto_Grava(EditBairro.Text)            + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Cidade         ="' + Texto_Grava(EditCidade.Text)            + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_CEP            ="' + Texto_Grava(EditCep.Text)               + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Estado         ="' + Texto_Grava(CBEstado.Text)              + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Contato        ="' + Texto_Grava(EditContato.Text)           + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Email          ="' + Texto_Grava(EditEmail.Text)             + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Comercial ="' + Texto_Grava(EditFone_Comercial.Text)    + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Celular   ="' + Texto_Grava(EditFone_Celular.Text)      + '", ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Fax       ="' + Texto_Grava(EditFone_Fax.Text)          + '" ';
        ComandoSQL := ComandoSQL + 'Where Fornecedor_Numero   ='  + Texto_Grava(lblNumero.Caption)          ;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração efetuada com sucesso...');
    End;

  Seta();

end;

procedure TFornecedores02.BT_ExcluirClick(Sender: TObject);
begin
    If Confirma('Deseja realmente excluir o Fornecedor '+Trim(lblNumero.Caption)+' ?')= 6 Then
      Begin
      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete from Fornecedores Where Fornecedor_Numero=' + Trim(lblNumero.Caption));
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Exclusão efetuada com sucesso...');

      Movto_Ponteiro('Proximo','Fornecedores');
    End;
end;

procedure TFornecedores02.BT_InicioClick(Sender: TObject);
begin
     Movto_Ponteiro('Inicio','Fornecedores');
end;

procedure TFornecedores02.BT_AnteriorClick(Sender: TObject);
begin
     Movto_Ponteiro('Anterior','Fornecedores');
end;

procedure TFornecedores02.BT_ProximoClick(Sender: TObject);
begin
     Movto_Ponteiro('Proximo','Fornecedores');
end;

procedure TFornecedores02.BT_FinalClick(Sender: TObject);
begin
     Movto_Ponteiro('Final','Fornecedores');
end;

end.
