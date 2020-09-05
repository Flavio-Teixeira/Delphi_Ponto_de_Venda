unit Empresa_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TEmpresa00 = class(TForm)
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    EditEndereco: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditCep: TMaskEdit;
    CBEstado: TComboBox;
    EditTelefone: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    EditRazaoSocial: TEdit;
    Label5: TLabel;
    EditNomeExibicao: TEdit;
    EditVinculoCliente: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure EditRazaoSocialKeyPress(Sender: TObject; var Key: Char);
    procedure EditNomeExibicaoKeyPress(Sender: TObject; var Key: Char);
    procedure EditEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EditBairroKeyPress(Sender: TObject; var Key: Char);
    procedure EditCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure CBEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure EditCepKeyPress(Sender: TObject; var Key: Char);
    procedure EditTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Empresa00: TEmpresa00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TEmpresa00.FormShow(Sender: TObject);
begin
    Ampulheta();

    ConexaoBD.SQL_Empresa.Close;
    ConexaoBD.SQL_Empresa.SQL.Clear;
    ConexaoBD.SQL_Empresa.SQL.Add('Select * from Empresa');
    ConexaoBD.SQL_Empresa.Open;

    If ConexaoBD.SQL_Empresa.RecordCount < 1 Then begin
      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Insert into Empresa values('+#39+#39+', '+#39+#39+', '+#39+#39+', '+#39+#39+', '+#39+#39+', '+#39+#39+', '+#39+#39+', '+#39+#39+')');
      ConexaoBD.SQL_Comunitario.ExecSQL;

      ConexaoBD.SQL_Empresa.Close;
      ConexaoBD.SQL_Empresa.SQL.Clear;
      ConexaoBD.SQL_Empresa.SQL.Add('Select * from Empresa');
      ConexaoBD.SQL_Empresa.Open;
    End;

    EditRazaoSocial.Text       := ConexaoBD.SQL_EmpresaEmpresa_Razao_Social.Text;
    EditNomeExibicao.Text      := ConexaoBD.SQL_EmpresaEmpresa_Nome_Exibicao.Text;
    EditEndereco.Text          := ConexaoBD.SQL_EmpresaEmpresa_Endereco.Text;
    EditBairro.Text            := ConexaoBD.SQL_EmpresaEmpresa_Bairro.Text;
    EditCidade.Text            := ConexaoBD.SQL_EmpresaEmpresa_Cidade.Text;
    CBEstado.Text              := ConexaoBD.SQL_EmpresaEmpresa_Estado.Text;
    EditCep.Text               := ConexaoBD.SQL_EmpresaEmpresa_Cep.Text;
    EditTelefone.Text          := ConexaoBD.SQL_EmpresaEmpresa_Fone.Text;
    EditVinculoCliente.Checked := StrToBool(ConexaoBD.SQL_EmpresaEmpresa_Vincula_Cliente.Text);

    Seta();
end;

procedure TEmpresa00.BT_SairClick(Sender: TObject);
begin
    Empresa00.Close;
end;

procedure TEmpresa00.EditRazaoSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditNomeExibicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditBairroKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditCidadeKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.CBEstadoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditCepKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.EditTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEmpresa00.BT_AlterarClick(Sender: TObject);
var ComandoSQL: string;
begin
    ComandoSQL := 'update Empresa set ';
    ComandoSQL := ComandoSQL +'Empresa_Razao_Social ="'  +EditRazaoSocial.Text  +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Nome_Exibicao ="' +EditNomeExibicao.Text +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Endereco ="'      +EditEndereco.Text     +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Bairro ="'        +EditBairro.Text       +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Cidade ="'        +EditCidade.Text       +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Estado ="'        +CBEstado.Text         +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Cep ="'           +EditCep.Text          +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Fone ="'          +EditTelefone.Text     +'", ';
    ComandoSQL := ComandoSQL +'Empresa_Vincula_Cliente ="' + BoolToStr(EditVinculoCliente.Checked) +'"';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Alteração efetuada com sucesso...');

    Empresa00.Close;
end;

end.
