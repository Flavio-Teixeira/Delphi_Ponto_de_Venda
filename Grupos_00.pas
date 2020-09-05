unit Grupos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TGrupos00 = class(TForm)
    Panel1: TPanel;
    BT_Sair: TBitBtn;
    BT_Incluir: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GridGrupos: TDBGrid;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridGruposCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Grupos00: TGrupos00;

implementation

uses Conexao_BD, Grupos_01, Grupos_02, Rotinas_Gerais, Principal_00;

{$R *.dfm}

procedure TGrupos00.BT_SairClick(Sender: TObject);
begin
  Grupos00.Close;
end;

procedure TGrupos00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TGrupos01,Grupos01);
    Grupos00.Visible  := False;
    Grupos01.ShowModal;
    Grupos01.Destroy;
    Grupos00.Visible  := True;
end;

procedure TGrupos00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridGrupos.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridGrupos.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridGrupos.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Grupos.Close;
    ConexaoBD.SQL_Grupos.SQL.Clear;
    ConexaoBD.SQL_Grupos.SQL.Add('Select * from Grupos Order By Grupo_Numero');
    ConexaoBD.SQL_Grupos.Open;
    GridGrupos.Refresh;

    Seta();
end;

procedure TGrupos00.GridGruposCellClick(Column: TColumn);
begin
    If GridGrupos.Fields[0].Text <> '' Then
      Begin
      Application.CreateForm(TGrupos02,Grupos02);

      Ampulheta();
      Grupos02.lblCodigo.Caption    := Trim(GridGrupos.Fields[0].Text);
      Grupos02.EditDescricao.Text := Trim(GridGrupos.Fields[1].Text);
      Seta();

      Grupos00.Visible := False;
      Grupos02.ShowModal;
      Grupos02.Destroy;
      Grupos00.Visible := True;
    End;
End;


end.
