unit Trocas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TTrocas01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Troca_Codigo: TEdit;
    Troca_Descricao: TEdit;
    Label1: TLabel;
    Troca_Qtde: TEdit;
    Troca_Data: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Troca_Observacao: TEdit;
    Label3: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Troca_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_DataKeyPress(Sender: TObject; var Key: Char);
    procedure Troca_ObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Trocas01: TTrocas01;

implementation

uses Conexao_BD, Rotinas_Gerais, Produtos_00;

{$R *.dfm}

procedure TTrocas01.BT_SairClick(Sender: TObject);
begin
    Trocas01.Close;
end;

procedure TTrocas01.BT_IncluirClick(Sender: TObject);

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
      Comando_SQL := 'Insert Into Trocas ';
      Comando_SQL := Comando_SQL + '(';
      Comando_SQL := Comando_SQL + 'Troca_Codigo, ';
      Comando_SQL := Comando_SQL + 'Troca_Descricao, ';
      Comando_SQL := Comando_SQL + 'Troca_Qtde, ';
      Comando_SQL := Comando_SQL + 'Troca_Data, ';
      Comando_SQL := Comando_SQL + 'Troca_Observacao ';
      Comando_SQL := Comando_SQL + ') ';
      Comando_SQL := Comando_SQL + 'Values ';
      Comando_SQL := Comando_SQL + '( ';
      Comando_SQL := Comando_SQL + #39 + Troca_Codigo.Text     + #39 + ', ';
      Comando_SQL := Comando_SQL + #39 + Troca_Descricao.Text  + #39 + ', ';
      Comando_SQL := Comando_SQL + #39 + Troca_Qtde.Text       + #39 + ', ';
      Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Troca_Data.Text),'amd','/') + #39 + ', ';
      Comando_SQL := Comando_SQL + #39 + Troca_Observacao.Text + #39 + ' ';
      Comando_SQL := Comando_SQL + ') ';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão efetuada com sucesso...');

        If Confirma('Deseja incluir outra Troca?') = 6 Then
          Begin
          Troca_Codigo.Text     := '';
          Troca_Descricao.Text  := '';
          Troca_Qtde.Text       := '1';
          Troca_Data.Text       := DateToStr(Date());
          Troca_Observacao.Text := '';
          End
        Else
          Begin
          Trocas01.Close;
        End;
    End;

  Seta();
end;

procedure TTrocas01.Troca_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas01.Troca_DescricaoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas01.Troca_QtdeKeyPress(Sender: TObject; var Key: Char);
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

procedure TTrocas01.Troca_DataKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas01.Troca_ObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTrocas01.FormShow(Sender: TObject);
begin
   Troca_Codigo.Text     := '';
   Troca_Descricao.Text  := '';
   Troca_Qtde.Text       := '1';
   Troca_Data.Text       := DateToStr(Date());
   Troca_Observacao.Text := '';
end;

procedure TTrocas01.Label3Click(Sender: TObject);
begin
   Application.CreateForm(TProdutos00,Produtos00);
   Produtos00.Edit_Tipo.Text:= 'Troca';
   Produtos00.ShowModal;
   Produtos00.Destroy;
end;

end.
