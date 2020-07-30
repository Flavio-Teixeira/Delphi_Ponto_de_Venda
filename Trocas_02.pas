unit Trocas_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TTrocas02 = class(TForm)
    Panel1: TPanel;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Troca_Codigo: TEdit;
    Troca_Descricao: TEdit;
    Troca_Qtde: TEdit;
    Troca_Data: TMaskEdit;
    Troca_Observacao: TEdit;
    Label7: TLabel;
    Troca_Numero: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure Troca_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_DataKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_ObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Trocas02: TTrocas02;

implementation

uses Conexao_BD, Rotinas_Gerais, Produtos_00;

{$R *.dfm}

procedure TTrocas02.BT_SairClick(Sender: TObject);
begin
    Trocas02.Close;
end;

procedure TTrocas02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;
   
begin
    Ampulheta();

    If Trim(Troca_Codigo.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Código...');
      End
    Else If Trim(Troca_Descricao.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      End
    Else If Trim(Troca_Qtde.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Quatidade...');
      Troca_Qtde.SetFocus;
      End
    Else If Trim(Troca_Data.Text)='/  /' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Data...');
      Troca_Data.SetFocus;
      End
    Else
      Begin
        Comando_SQL := 'Update Trocas Set ';
        Comando_SQL := Comando_SQL + 'Troca_Codigo = ' + #39 + Troca_Codigo.Text     + #39 + ', ';
        Comando_SQL := Comando_SQL + 'Troca_Descricao = ' + #39 + Troca_Descricao.Text  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'Troca_Qtde = ' + #39 + Troca_Qtde.Text       + #39 + ', ';
        Comando_SQL := Comando_SQL + 'Troca_Data = ' + #39 + Inverte_Data_Plus(Trim(Troca_Data.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + 'Troca_Observacao = ' + #39 + Troca_Observacao.Text + #39 + ' ';
        Comando_SQL := Comando_SQL + 'Where ';
        Comando_SQL := Comando_SQL + 'Troca_Numero = ' + #39 + Troca_Numero.Text     + #39 + ' ';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração efetuada com sucesso...');

        Trocas02.Close;
    End;

  Seta();
end;

procedure TTrocas02.BT_ExcluirClick(Sender: TObject);
begin
      Ampulheta();

      If Confirma('Deseja realmente excluir a Troca Nro.: '+Trim(Troca_Numero.Text)+' ?')= 6 Then
         Begin
         ConexaoBD.SQL_Comunitario.Close;
         ConexaoBD.SQL_Comunitario.SQL.Clear;
         ConexaoBD.SQL_Comunitario.SQL.Add('Delete From Trocas Where Troca_Numero="' + Trim(Troca_Numero.Text) + '"');
         ConexaoBD.SQL_Comunitario.ExecSQL;
         MSG_Erro('Exclusão efetuada com sucesso...');
      End;

      Trocas02.Close;

      Seta();
end;

procedure TTrocas02.Troca_QtdeKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TTrocas02.Troca_DataKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas02.Troca_ObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas02.Label3Click(Sender: TObject);
begin
   Application.CreateForm(TProdutos00,Produtos00);
   Produtos00.Edit_Tipo.Text:= 'Troca_Alteracao';
   Produtos00.ShowModal;
   Produtos00.Destroy;
end;

end.
