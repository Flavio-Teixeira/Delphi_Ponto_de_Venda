unit Caixa_Sangria_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Sangria00 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Retirar: TBitBtn;
    Panel_Valores: TPanel;
    Label1: TLabel;
    EditVlr_Sangria: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_RetirarClick(Sender: TObject);
    procedure EditVlr_SangriaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Sangria00: TCaixa_Sangria00;

implementation

uses Rotinas_Gerais, Conexao_BD, Principal_00, Frente_Loja_00;

{$R *.dfm}

procedure TCaixa_Sangria00.BT_SairClick(Sender: TObject);
begin
    Caixa_Sangria00.Close;
end;

procedure TCaixa_Sangria00.BT_RetirarClick(Sender: TObject);
Var
  Comando_SQL : String;
begin

    If (Trim(EditVlr_Sangria.Text)<>'') and (StrToFloat(EditVlr_Sangria.Text)<= 10000) Then
      Begin
        //*** Tela Principal ***

        Principal.T_Valor_Sangria.Text := FloatToStr( StrToFloat(Ponto_Virgula(Trim(Principal.T_Valor_Sangria.Text))) + StrToFloat(Ponto_Virgula(Trim(EditVlr_Sangria.Text))) );

        //*** Registro das Vendas ***

        Registro_Vendas(Trim(Numero_HD('C')), '', Trim(Principal.T_Valor_Sangria.Text), '');

        Movto_Registro_Caixa('Sangria');
        Caixa_Sangria00.Close;
      End
    Else if StrToFloat(EditVlr_Sangria.Text)> 10000 Then
      Begin
        MSG_Erro('Valor não pode ser superior a 10.000,00...');
        EditVlr_Sangria.Text := '0';
        EditVlr_Sangria.SetFocus;
      End
    Else
      Begin
      Caixa_Sangria00.Close;
    End;

end;

procedure TCaixa_Sangria00.EditVlr_SangriaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Caixa_Sangria00.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TCaixa_Sangria00.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Sangria00.Close;
    End;
end;

end.
