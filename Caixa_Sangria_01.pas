unit Caixa_Sangria_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Sangria01 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Abrir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AbrirClick(Sender: TObject);
    procedure BT_AbrirKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Sangria01: TCaixa_Sangria01;

implementation

uses GHDL32, Rotinas_Gerais, Principal_00;

{$R *.dfm}

procedure TCaixa_Sangria01.BT_SairClick(Sender: TObject);
begin
     Caixa_Sangria01.Close;
end;

procedure TCaixa_Sangria01.BT_AbrirClick(Sender: TObject);
begin
     Abre_Gaveta();
     Caixa_Sangria01.Close;
end;

procedure TCaixa_Sangria01.BT_AbrirKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Caixa_Sangria01.Close;
     End;
end;

procedure TCaixa_Sangria01.BT_SairKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        Caixa_Sangria01.Close;
     End;
end;

end.
