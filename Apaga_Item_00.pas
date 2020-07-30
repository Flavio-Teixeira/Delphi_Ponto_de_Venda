unit Apaga_Item_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TApagaItem00 = class(TForm)
    Lista_Itens: TStringGrid;
    Label1: TLabel;
    Campo_Retorno: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Lista_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Lista_ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ApagaItem00: TApagaItem00;

implementation

uses Frente_Loja_00, Rotinas_Gerais, Principal_00, Cancela_Item_Login_00;

{$R *.dfm}

procedure TApagaItem00.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        ApagaItem00.Close;
     End;
end;

procedure TApagaItem00.FormShow(Sender: TObject);

var
   Ind: Integer;

begin
     Campo_Retorno.Text := '';

     Application.CreateForm(TCancelaItemLogin00,CancelaItemLogin00);
     CancelaItemLogin00.ShowModal;
     CancelaItemLogin00.Destroy;

     If Trim(Campo_Retorno.Text) <> '' Then
        Begin

        If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
           Begin
           Lista_Itens.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
           Lista_Itens.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
        End;

        Lista_Itens.RowCount          := Frente_Loja00.Lista_Itens.RowCount;
        Lista_Itens.FixedRows         := Frente_Loja00.Lista_Itens.FixedRows;

        //*** Código do Produto ***
        Lista_Itens.Cells[0,0]        := 'Código';
        Lista_Itens.ColWidths[0]      := 100;

        //*** Descrição do Produto ***
        Lista_Itens.Cells[1,0]        := 'Descrição';
        Lista_Itens.ColWidths[1]      := 240;

        //*** Quantidade ***
        Lista_Itens.Cells[2,0]        := 'Qtde';
        Lista_Itens.ColWidths[2]      := 50;

        //*** Valor Unitário ***
        Lista_Itens.Cells[3,0]        := 'Vlr.Unit';
        Lista_Itens.ColWidths[3]      := 80;

        //*** Valor Total ***
        Lista_Itens.Cells[4,0]        := 'Vlr.Total';
        Lista_Itens.ColWidths[4]      := 80;

        //*** Descrição Completa ***
        Lista_Itens.Cells[5,0]        := '';
        Lista_Itens.ColWidths[5]      := -1;

        //*** Estoque ***
        Lista_Itens.Cells[6,0]        := 'Estoque';
        Lista_Itens.ColWidths[6]      := 75;

        For Ind := 0 To Frente_Loja00.Lista_Itens.RowCount Do
            Begin
            Lista_Itens.Cells[0,Ind] := Frente_Loja00.Lista_Itens.Cells[0,Ind];
            Lista_Itens.Cells[1,Ind] := Frente_Loja00.Lista_Itens.Cells[1,Ind];
            Lista_Itens.Cells[2,Ind] := Frente_Loja00.Lista_Itens.Cells[2,Ind];
            Lista_Itens.Cells[3,Ind] := Frente_Loja00.Lista_Itens.Cells[3,Ind];
            Lista_Itens.Cells[4,Ind] := Frente_Loja00.Lista_Itens.Cells[4,Ind];
            Lista_Itens.Cells[5,Ind] := Frente_Loja00.Lista_Itens.Cells[5,Ind];
            Lista_Itens.Cells[6,Ind] := Frente_Loja00.Lista_Itens.Cells[6,Ind];
        End;

        End
     Else
        Begin
        MSG_Erro('Acesso recusado...');
     End;
end;

procedure TApagaItem00.Lista_ItensKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        ApagaItem00.Close;
     End;
end;

procedure TApagaItem00.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = vk_Delete Then
      Begin
      Apaga_Item();
    End;
end;

procedure TApagaItem00.Lista_ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = vk_Delete Then
      Begin
      Apaga_Item();
    End;
end;

end.
