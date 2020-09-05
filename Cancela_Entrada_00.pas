unit Cancela_Entrada_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelaEntrada00 = class(TForm)
    Panel3: TPanel;
    BT_Cancelar: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Numero_Nota_Sistema: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Numero_Nota_SistemaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelaEntrada00: TCancelaEntrada00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TCancelaEntrada00.BT_SairClick(Sender: TObject);
begin
     CancelaEntrada00.Close;
end;

procedure TCancelaEntrada00.Numero_Nota_SistemaKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TCancelaEntrada00.BT_CancelarClick(Sender: TObject);

var
   ComandoSQL, Nro_Cabeca: String;


begin
     If Trim(Numero_Nota_Sistema.Text) <> '' Then
        Begin

        ConexaoBD.SQL_Entrada_Nota_Cabeca.Close;
        ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Clear;
        ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Add('Select * from Entrada_Nota_Cabeca Where Entrada_Nota_Cabeca_Numero = ' + Trim(Numero_Nota_Sistema.Text) );
        ConexaoBD.SQL_Entrada_Nota_Cabeca.Open;

        If ConexaoBD.SQL_Entrada_Nota_Cabeca.RecordCount <= 0 Then
           Begin
           MSG_Erro('O Número Informado Não foi localizado...');
           End
        Else
           Begin

           Ampulheta();

           Nro_Cabeca := ConexaoBD.SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Numero.Text;

           If Trim(ConexaoBD.SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Ajusta.Text) = 'S' Then
              Begin

              ConexaoBD.SQL_Entrada_Nota_Produto.Close;
              ConexaoBD.SQL_Entrada_Nota_Produto.SQL.Clear;
              ConexaoBD.SQL_Entrada_Nota_Produto.SQL.Add('Select * from Entrada_Nota_Produto Where Entrada_Nota_Produto_Cabeca = ' + Trim(Nro_Cabeca) );
              ConexaoBD.SQL_Entrada_Nota_Produto.Open;

              If ConexaoBD.SQL_Entrada_Nota_Produto.RecordCount > 0 Then
                 Begin

                 ConexaoBD.SQL_Entrada_Nota_Produto.First;

                 While Not ConexaoBD.SQL_Entrada_Nota_Produto.Eof Do
                       Begin
                       ComandoSQL := 'Update Produtos Set ';
                       ComandoSQL := ComandoSQL + ' Produto_Estoque_Atual = Produto_Estoque_Atual - ' + Trim(ConexaoBD.SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Qtde.Text);
                       ComandoSQL := ComandoSQL + ' Where  Produto_Codigo = ' + Trim(ConexaoBD.SQL_Entrada_Nota_ProdutoEntrada_Nota_Produto_Cod.Text);

                       ConexaoBD.SQL_Comunitario.SQL.Clear;
                       ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
                       ConexaoBD.SQL_Comunitario.ExecSQL;

                       ConexaoBD.SQL_Entrada_Nota_Produto.Next;
                 End;
              End;

           End;

           //*** Apaga os Produtos ***

           ComandoSQL := 'Delete from Entrada_Nota_Produto Where Entrada_Nota_Produto_Cabeca=' + Trim(Nro_Cabeca);
           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Apaga as Cabeças ***

           ComandoSQL := 'Delete from Entrada_Nota_Cabeca Where Entrada_Nota_Cabeca_Numero=' + Trim(Nro_Cabeca);
           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Finalização do Processo ***

           Seta();

           MSG_Erro('Cancelamento Concluído...');

           CancelaEntrada00.Close;
        End;
     End;
end;

end.
