unit Fornecedores_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ExtDlgs;

type
  TFornecedores01 = class(TForm)
    Panel2: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Cliente_Mensagem_Mascara: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditRazaoSocial: TEdit;
    EditNomeFantasia: TEdit;
    EditCNPJ: TMaskEdit;
    EditInscricaoEstadual: TEdit;
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
    CBEstado: TComboBox;
    EditCep: TMaskEdit;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Label44: TLabel;
    EditContato: TEdit;
    EditEmail: TEdit;
    EditRamoAtividade: TEdit;
    GroupBox3: TGroupBox;
    EditFone_Comercial: TEdit;
    EditFone_Celular: TEdit;
    EditFone_Fax: TEdit;
    Label33: TLabel;
    Label3: TLabel;
    Label1: TLabel;

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
    procedure BT_IncluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fornecedores01: TFornecedores01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TFornecedores01.BT_SairClick(Sender: TObject);
begin
  Fornecedores01.Close;
end;

procedure TFornecedores01.EditCNPJKeyPress(Sender: TObject; var Key: Char);
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

procedure TFornecedores01.EditInscricaoEstadualKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditRazaoSocialKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditRamoAtividadeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditComplementoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditBairroKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditCidadeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditCepKeyPress(Sender: TObject; var Key: Char);
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

procedure TFornecedores01.CBEstadoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditContatoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditEmailKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditFone_ComercialKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditFone_CelularKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.EditFone_FaxKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedores01.BT_IncluirClick(Sender: TObject); var ComandoSQL : String;
begin

  Ampulheta();

    If Trim(EditNomeFantasia.Text) = '' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Nome Fantasia...');
      EditNomeFantasia.SetFocus;
      End
    Else
      Begin

        ComandoSQL := 'Insert into Fornecedores(';
        ComandoSQL := ComandoSQL + 'Fornecedor_Cnpj, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_IE, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Razao_Social, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Nome_Fantasia, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Ramo_Atividade, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Endereco, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Complemento, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Bairro, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Cidade, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_CEP, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Estado, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Contato, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Email, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Comercial, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Celular, ';
        ComandoSQL := ComandoSQL + 'Fornecedor_Fone_Fax) ';
        ComandoSQL := ComandoSQL + 'Values(';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditCNPJ.Text)              + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditInscricaoEstadual.Text) + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditRazaoSocial.Text)       + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditNomeFantasia.Text)      + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditRamoAtividade.Text)     + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditEndereco.Text)          + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditComplemento.Text)       + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditBairro.Text)            + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditCidade.Text)            + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditCep.Text)               + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(CBEstado.Text)              + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditContato.Text)           + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditEmail.Text)             + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditFone_Comercial.Text)    + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditFone_Celular.Text)      + #39 + ', ';
        ComandoSQL := ComandoSQL + #39 + Texto_Grava(EditFone_Fax.Text)          + #39 + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão efetuada com sucesso...');

        If Confirma('Deseja incluir outro Fornecedor?')=6 Then
          Begin
          EditCNPJ.Text               :='';
          EditInscricaoEstadual.Text  :='';
          EditRazaoSocial.Text        :='';
          EditNomeFantasia.Text       :='';
          EditRamoAtividade.Text      :='';
          EditEndereco.Text           :='';
          EditComplemento.Text        :='';
          EditBairro.Text             :='';
          EditCidade.Text             :='';
          EditCep.Text                :='';
          CBEstado.ItemIndex          := 24;
          EditContato.Text            :='';
          EditEmail.Text              :='';
          EditFone_Comercial.Text     :='';
          EditFone_Celular.Text       :='';
          EditFone_Fax.Text           :='';
          EditCNPJ.SetFocus;
          End
        Else
          Begin
          Fornecedores01.Close;
        End;
    End;

  Seta();

end;

end.
