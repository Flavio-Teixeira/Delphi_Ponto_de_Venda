unit MSG_Adiciona_Cliente_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TMSGAdicionaClientePedido = class(TForm)
    Cliente_Selecionado: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    BT_Adicionar: TButton;
    BT_Alterar: TButton;
    Programa_Anterior: TEdit;
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGAdicionaClientePedido: TMSGAdicionaClientePedido;

implementation

uses Clientes_00;

{$R *.dfm}

procedure TMSGAdicionaClientePedido.BT_AdicionarClick(Sender: TObject);
begin
     Clientes00.Resultado_Adiciona_Cliente_Pedido.Text := '0';
     MSGAdicionaClientePedido.Close;
end;

procedure TMSGAdicionaClientePedido.BT_AlterarClick(Sender: TObject);
begin
     Clientes00.Resultado_Adiciona_Cliente_Pedido.Text := '1';
     MSGAdicionaClientePedido.Close;
end;

end.
