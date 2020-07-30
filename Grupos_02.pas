unit Grupos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TGrupos02 = class(TForm)
    Panel1: TPanel;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    EditDescricao: TEdit;
    lblCodigo: TLabel;
    GroupBox3: TGroupBox;
    BT_Inicio: TBitBtn;
    BT_Anterior: TBitBtn;
    BT_Proximo: TBitBtn;
    BT_Final: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
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
  Grupos02: TGrupos02;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TGrupos02.BT_SairClick(Sender: TObject);
begin
  Grupos02.Close;
end;

procedure TGrupos02.BT_ExcluirClick(Sender: TObject);
begin
      Ampulheta();

        ConexaoBD.SQL_Produtos.Close;
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where Produto_Grupo=' + Trim(lblCodigo.Caption));
        ConexaoBD.SQL_Produtos.Open;

        If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
          Begin
            MSG_Erro('Não é possível Excluir este Grupo !' + #13 + 'Ainda existem Produtos relacionados ao mesmo.');
          End
        Else
          Begin
            If Confirma('Deseja realmente excluir o Grupo '+Trim(lblCodigo.Caption)+' ?')= 6 Then
              Begin
              ConexaoBD.SQL_Comunitario.Close;
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add('Delete From Grupos Where Grupo_Numero=' + Trim(lblCodigo.Caption));
              ConexaoBD.SQL_Comunitario.ExecSQL;
              MSG_Erro('Exclusão efetuada com sucesso...');

              Movto_Ponteiro('Proximo','Grupos');
            End;
        End;
        
      Seta();

end;

procedure TGrupos02.BT_AlterarClick(Sender: TObject);
begin

  Ampulheta();

    If Trim(EditDescricao.Text)='' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      EditDescricao.SetFocus;
      End
    Else
      Begin
      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Update Grupos Set Grupo_Descricao = "' + Texto_Grava(EditDescricao.Text) + '" Where Grupo_Numero = ' + Trim(lblCodigo.Caption));
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Alteração efetuada com sucesso...');
    End;

  Seta();

end;

procedure TGrupos02.EditDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TGrupos02.BT_InicioClick(Sender: TObject);
begin
     Movto_Ponteiro('Inicio','Grupos');
end;

procedure TGrupos02.BT_AnteriorClick(Sender: TObject);
begin
     Movto_Ponteiro('Anterior','Grupos');
end;

procedure TGrupos02.BT_ProximoClick(Sender: TObject);
begin
     Movto_Ponteiro('Proximo','Grupos');
end;

procedure TGrupos02.BT_FinalClick(Sender: TObject);
begin
     Movto_Ponteiro('Final','Grupos');
end;

end.
