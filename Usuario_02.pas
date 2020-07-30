unit Usuario_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUsuario02 = class(TForm)
    Panel1: TPanel;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    EditSenha: TEdit;
    lblNome: TLabel;
    Usuario_Gaveta: TCheckBox;
    Usuario_Impressora: TCheckBox;
    BT_Cor_Grid: TBitBtn;
    BT_Cor_Letra: TBitBtn;
    Cor_da_Letra: TEdit;
    Cor_do_Grid: TEdit;
    Cor_Grid: TColorDialog;
    Cor_Letra: TColorDialog;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_Cor_GridClick(Sender: TObject);
    procedure BT_Cor_LetraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario02: TUsuario02;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TUsuario02.BT_SairClick(Sender: TObject);
begin
    Usuario02.Close;
end;

procedure TUsuario02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
  Ampulheta();

    If Trim(EditSenha.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Senha...');
      EditSenha.SetFocus;
      End
    Else
      Begin

      Comando_SQL := 'Update Usuarios Set ';
      Comando_SQL := Comando_SQL + 'Usuario_Senha = "' + Trim(EditSenha.Text) + '", ';
      Comando_SQL := Comando_SQL + 'Usuario_Cor_Grid = "' + Trim(Cor_do_Grid.Text) + '", ';
      Comando_SQL := Comando_SQL + 'Usuario_Cor_Letra = "' + Trim(Cor_da_Letra.Text) + '", ';

      If Usuario_Gaveta.Checked Then
         Begin
         Comando_SQL := Comando_SQL + 'Usuario_Gaveta = "S", ';
         End
      Else
         Begin
         Comando_SQL := Comando_SQL + 'Usuario_Gaveta = "N", ';
      End;

      If Usuario_Impressora.Checked Then
         Begin
         Comando_SQL := Comando_SQL + 'Usuario_Impressora = "S" ';
         End
      Else
         Begin
         Comando_SQL := Comando_SQL + 'Usuario_Impressora = "N" ';
      End;

      Comando_SQL := Comando_SQL + ' Where Usuario_Nome="' + Trim(lblNome.Caption) + '"';

      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Alteração efetuada com sucesso...');
      Usuario02.Close;
    End;

  Seta();
end;

procedure TUsuario02.BT_ExcluirClick(Sender: TObject);
begin
      Ampulheta();

        ConexaoBD.SQl_Usuarios.Close;
        ConexaoBD.SQl_Usuarios.SQL.Clear;
        ConexaoBD.SQl_Usuarios.SQL.Add('Select * From Usuarios');
        ConexaoBD.SQl_Usuarios.Open;

        If ConexaoBD.SQl_Usuarios.RecordCount = 1 Then
          Begin
            MSG_Erro('Não é possível Excluir este Usuário !' + #13 + 'Cadastre outro Usuário primeiro.');
          End
        Else
          Begin
            If Confirma('Deseja realmente excluir o Usuário '+Trim(lblNome.Caption)+' ?')= 6 Then
              Begin
              ConexaoBD.SQL_Comunitario.Close;
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add('Delete From Usuarios Where Usuario_Nome="' + Trim(lblNome.Caption) + '"');
              ConexaoBD.SQL_Comunitario.ExecSQL;
              MSG_Erro('Exclusão efetuada com sucesso...');
            End;
        End;

        Usuario02.Close;

      Seta();
end;

procedure TUsuario02.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TUsuario02.BT_Cor_GridClick(Sender: TObject);
begin
     If Cor_Grid.Execute Then
        Begin
        Cor_do_Grid.Text := ColorToString(Cor_Grid.Color);
     End;
end;

procedure TUsuario02.BT_Cor_LetraClick(Sender: TObject);
begin
     If Cor_Letra.Execute Then
        Begin
        Cor_da_Letra.Text := ColorToString(Cor_Letra.Color);
     End;
end;

end.
