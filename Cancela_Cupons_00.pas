unit Cancela_Cupons_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TCancela_Cupons00 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    GridCupons: TDBGrid;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Cancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure GridCuponsKeyPress(Sender: TObject; var Key: Char);
    procedure GridCuponsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BT_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cancela_Cupons00: TCancela_Cupons00;
  Item_Cancelar   : String;

implementation

uses Conexao_BD, Rotinas_Gerais, Principal_00;

{$R *.dfm}

procedure TCancela_Cupons00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridCupons.Handle,SB_VERT,True);

      If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
         Begin
         GridCupons.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
         GridCupons.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
      End;

      ConexaoBD.SQL_Cabeca_Cupons.Close;
      ConexaoBD.SQL_Cabeca_Cupons.SQL.Clear;
      ConexaoBD.SQL_Cabeca_Cupons.SQL.Add('Select * from Cabeca_Cupons Where (Cabeca_Cupom_Status="Fechado")And(Cabeca_Cupom_Data_Emissao='+ #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') +#39+ ')And(Cabeca_Cupom_Maquina="' + Numero_HD('C') + '") Order By Cabeca_Cupom_Numero DESC');
      ConexaoBD.SQL_Cabeca_Cupons.Open;
      GridCupons.Refresh;

      If ConexaoBD.SQL_Cabeca_Cupons.RecordCount > 0 Then
        Begin
          Item_Cancelar := Trim(  ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.AsString );
      End;

    Seta();
end;
procedure TCancela_Cupons00.BT_SairClick(Sender: TObject);
begin
  Cancela_Cupons00.Close;
end;

procedure TCancela_Cupons00.GridCuponsKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
        Begin
          Cancela_Cupons00.Close;
        End
    Else If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TCancela_Cupons00.GridCuponsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

    If Trim(GridCupons.Fields[0].Text)= Item_Cancelar Then
      Begin
        GridCupons.Canvas.Brush.Color   := clMoneyGreen;
        GridCupons.Fields[0].Alignment  := taCenter;
        GridCupons.Fields[1].Alignment  := taCenter;
        GridCupons.DefaultDrawDataCell(Rect, GridCupons.columns[datacol].field, State);
    End;

End;

procedure TCancela_Cupons00.BT_CancelarClick(Sender: TObject);
Var
  Cod_Prod  :String;
  Qtd_Volta :String;
begin
        If Item_Cancelar <> '' Then
          Begin

          If Confirma('Deseja realmente Cancelar o Cupom '+Trim(Item_Cancelar)+' ?')= 6 Then
            Begin
            ConexaoBD.SQL_Comunitario_Secundario.Close;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Update Cabeca_Cupons Set Cabeca_Cupom_Status="Cancelado" Where (Cabeca_Cupom_Numero=' + Item_Cancelar + ')And(Cabeca_Cupom_Maquina="' + Numero_HD('C') + '")');
            ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

            ConexaoBD.SQL_Comunitario_Secundario.Close;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Update Registro_Caixa Set Registro_Caixa_Operacao="Cancelado" Where (Registro_Caixa_Pedido="' + Item_Cancelar + '")And(Registro_Caixa_Maquina="' + Numero_HD('C') + '")');
            ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

            ConexaoBD.SQL_Corpo_Cupons.Close;
            ConexaoBD.SQL_Corpo_Cupons.SQL.Clear;
            ConexaoBD.SQL_Corpo_Cupons.SQL.Add('Select * from Corpo_Cupons Where (Corpo_Cupom_Cabeca=' + Item_Cancelar + ')And(Corpo_Cupom_Maquina="' + Numero_HD('C') + '") Order By Corpo_Cupom_Prod_Codigo');
            ConexaoBD.SQL_Corpo_Cupons.Open;

            // Retorna Produtos ao Estoque
            While Not ConexaoBD.SQL_Corpo_Cupons.Eof Do
              Begin

                Cod_Prod  := ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Codigo.Text;
                Qtd_Volta := ConexaoBD.SQL_Corpo_CuponsCorpo_Cupom_Prod_Qtde.AsString;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add('Update Produtos Set Produto_Estoque_Atual= (Produto_Estoque_Atual + ' + Qtd_Volta + ') Where Produto_Codigo=' + Trim(Cod_Prod));
                ConexaoBD.SQL_Comunitario.ExecSQL;

                ConexaoBD.SQL_Corpo_Cupons.Next;

            End;

            MSG_Erro('Cupom cancelado com sucesso...');
            Cancela_Cupons00.Close;

          End;

        End;
end;

procedure TCancela_Cupons00.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        Cancela_Cupons00.Close;
     End;
end;

end.
