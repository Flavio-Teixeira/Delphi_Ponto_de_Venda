unit Caixa_Deposito_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Deposito00 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Depositar: TBitBtn;
    Panel_Valores: TPanel;
    Label1: TLabel;
    EditVlr_Deposito: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_DepositarClick(Sender: TObject);
    procedure EditVlr_DepositoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Deposito00: TCaixa_Deposito00;

implementation

uses Rotinas_Gerais, Conexao_BD, Principal_00;

{$R *.dfm}

procedure TCaixa_Deposito00.BT_SairClick(Sender: TObject);
begin
    Caixa_Deposito00.Close;
end;

procedure TCaixa_Deposito00.BT_DepositarClick(Sender: TObject);
Var
  Comando_SQL : String;
begin

    If Trim(EditVlr_Deposito.Text)<>'' Then
      Begin
      Movto_Registro_Caixa('Depósito');
    End;
    Caixa_Deposito00.Close;

end;

procedure TCaixa_Deposito00.EditVlr_DepositoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Caixa_Deposito00.Close;
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

procedure TCaixa_Deposito00.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Deposito00.Close;
    End;
end;

end.
