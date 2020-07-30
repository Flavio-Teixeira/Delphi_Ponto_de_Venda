unit Mvto_Compra_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TMvto_Compra00 = class(TForm)
    Compra: TPanel;
    Titulo_Lista_Compras: TPanel;
    Label1: TLabel;
    lbl_Descricao: TLabel;
    lbl_Codigo: TLabel;
    lbl_Vlt_Unit: TLabel;
    lbl_Vlr_Total: TLabel;
    txt_Codigo: TEdit;
    txt_Descricao: TEdit;
    txt_Vlt_Unit: TEdit;
    txt_Vlr_Total: TEdit;
    txt_Qtde: TEdit;
    lbl_Operacao: TLabel;
    procedure txt_QtdeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mvto_Compra00: TMvto_Compra00;

implementation

uses Rotinas_Gerais, Frente_Loja_00;

{$R *.dfm}

procedure TMvto_Compra00.txt_QtdeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
          If (Trim(txt_Qtde.Text)<>'')And(StrToInt(txt_Qtde.Text)> 0) Then
            Begin

              Ampulheta();
                If Trim(lbl_Operacao.Caption) = 'x' Then
                  Begin
                  Frente_Loja00.EditQuantidade.Text   := Trim(txt_Qtde.Text);
                  Mvto_Compra00.Close;
                  End
                Else
                  Begin
                  Movto_Lista(Trim(txt_Codigo.Text),'Código',Trim(lbl_Operacao.Caption),StrToInt(txt_Qtde.Text));
                  Frente_Loja00.EditCod_Barras.Text   := '';
                  Frente_Loja00.EditDescricao.Caption := '';
                End;
              Seta();

          End;
          Mvto_Compra00.Close;
        End
     Else If Key = #27 Then
        Begin
        Mvto_Compra00.Close;
        End
     Else
        Begin
        So_Numero(Sender, Key);
     End;
end;

end.
