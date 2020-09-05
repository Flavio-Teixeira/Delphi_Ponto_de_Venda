unit Informacao_Maquinas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TInformacao_Maquinas00 = class(TForm)
    Panel1: TPanel;
    BT_Sair: TBitBtn;
    BT_Incluir: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GridMaquinas: TDBGrid;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridMaquinasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Informacao_Maquinas00: TInformacao_Maquinas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Informacao_Maquinas_01,
  Informacao_Maquinas_02, Principal_00;

{$R *.dfm}

procedure TInformacao_Maquinas00.BT_SairClick(Sender: TObject);
begin
    Informacao_Maquinas00.Close;
end;

procedure TInformacao_Maquinas00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TInformacao_Maquinas01,Informacao_Maquinas01);
    Informacao_Maquinas00.Visible  := False;
    Informacao_Maquinas01.ShowModal;
    Informacao_Maquinas01.Destroy;
    Informacao_Maquinas00.Visible  := True;
end;

procedure TInformacao_Maquinas00.FormShow(Sender: TObject);
begin

    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridMaquinas.Handle,SB_VERT,True);

      If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
         Begin
         GridMaquinas.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
         GridMaquinas.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
      End;

      ConexaoBD.SQL_Informacao_Maquinas.Close;
      ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
      ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('Select * from Informacao_Maquinas Order By Informacao_Maquina_Descricao');
      ConexaoBD.SQL_Informacao_Maquinas.Open;
      GridMaquinas.Refresh;
    Seta();
end;

procedure TInformacao_Maquinas00.GridMaquinasCellClick(Column: TColumn);
begin
    If GridMaquinas.Fields[0].Text <> '' Then
      Begin
      Application.CreateForm(TInformacao_Maquinas02,Informacao_Maquinas02);

      Ampulheta();
      Informacao_Maquinas02.lblHD.Caption       := Trim(GridMaquinas.Fields[0].Text);
      Informacao_Maquinas02.EditDescricao.Text  := Trim(GridMaquinas.Fields[1].Text);
      Seta();

      Informacao_Maquinas00.Visible := False;
      Informacao_Maquinas02.ShowModal;
      Informacao_Maquinas02.Destroy;
      Informacao_Maquinas00.Visible := True;
    End;
end;

end.
