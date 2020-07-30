unit Caixa_Abertura_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Abertura00 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Abrir: TBitBtn;
    Panel_Valores: TPanel;
    EditVlr_Abertura: TEdit;
    Label1: TLabel;
    MSG_Status: TLabel;

    procedure BT_SairClick(Sender: TObject);
    Procedure BT_AbrirClick(Sender: TObject);
    Procedure EditVlr_AberturaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Abertura00: TCaixa_Abertura00;

implementation
uses Conexao_BD, Rotinas_Gerais, Frente_Loja_00, Principal_00,
  Splash_Screen;

{$R *.dfm}

procedure TCaixa_Abertura00.BT_SairClick(Sender: TObject);
begin
    Caixa_Abertura00.Close;
end;

Procedure TCaixa_Abertura00.BT_AbrirClick(Sender: TObject);
Begin
    SplashScreen.Refresh;

    BT_Abrir.Enabled := False;
    BT_Sair.Enabled  := False;

    MSG_Status.Caption := 'Aguarde... Ativando Frente de Loja...';
    MSG_Status.Refresh;

    Caixa_Abertura00.Refresh;

    If Trim(Caixa_Abertura00.EditVlr_Abertura.Text)<>'' Then
      Begin
        Movto_Registro_Caixa('Abertura');
        Frente_Loja00.EditPermissao_Acesso.Text := 'S';
    End;

    Caixa_Abertura00.Close;
End;

Procedure TCaixa_Abertura00.EditVlr_AberturaKeyPress(Sender: TObject; var Key: Char);
Begin
     If Key = #27 Then
        Begin
        Caixa_Abertura00.Close;
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
End;

End.
