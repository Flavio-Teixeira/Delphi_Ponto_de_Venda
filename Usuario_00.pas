unit Usuario_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TUsuario00 = class(TForm)
    Panel1: TPanel;
    BT_Sair: TBitBtn;
    BT_Incluir: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GridUsuarios: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    BT_Buscar: TBitBtn;
    ComboLocalBusca: TComboBox;
    EditBusca: TMaskEdit;
    DB_Usuario_Nome: TDBEdit;
    DB_Usuario_Senha: TDBEdit;
    DB_Usuario_Fiscal: TDBEdit;
    DB_Usuario_Cor_Grid: TDBEdit;
    DB_Usuario_Cor_Letra: TDBEdit;
    DB_Usuario_Gaveta: TDBEdit;
    DB_Usuario_Impressora: TDBEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure GridUsuariosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_BuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario00: TUsuario00;

implementation

uses Conexao_BD, Rotinas_Gerais, Usuario_01, Usuario_02, Principal_00;

{$R *.dfm}

procedure TUsuario00.BT_SairClick(Sender: TObject);
begin
    Usuario00.Close;
end;

procedure TUsuario00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TUsuario01,Usuario01);
    Usuario00.Visible  := False;
    Usuario01.ShowModal;
    Usuario01.Destroy;
    Usuario00.Visible  := True;
end;

procedure TUsuario00.GridUsuariosCellClick(Column: TColumn);
begin
    If GridUsuarios.Fields[0].Text <> '' Then
      Begin
      Application.CreateForm(TUsuario02,Usuario02);

      Ampulheta();
      Usuario02.lblNome.Caption := Trim(GridUsuarios.Fields[0].Text);
      Usuario02.EditSenha.Text  := Trim(GridUsuarios.Fields[1].Text);

      If DB_Usuario_Gaveta.Text = 'S' Then
         Begin
         Usuario02.Usuario_Gaveta.Checked := True;
         End
      Else
         Begin
         Usuario02.Usuario_Gaveta.Checked := False;
      End;

      If DB_Usuario_Impressora.Text = 'S' Then
         Begin
         Usuario02.Usuario_Impressora.Checked := True;
         End
      Else
         Begin
         Usuario02.Usuario_Impressora.Checked := False;
      End;

      Usuario02.Cor_da_Letra.Text := DB_Usuario_Cor_Letra.Text;
      Usuario02.Cor_do_Grid.Text  := DB_Usuario_Cor_Grid.Text;

      Seta();

      Usuario00.Visible := False;
      Usuario02.ShowModal;
      Usuario02.Destroy;
      Usuario00.Visible := True;
    End;
end;

procedure TUsuario00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridUsuarios.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridUsuarios.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridUsuarios.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Usuarios.Close;
    ConexaoBD.SQL_Usuarios.SQL.Clear;
    ConexaoBD.SQL_Usuarios.SQL.Add('Select * from Usuarios Order By Usuario_Nome');
    ConexaoBD.SQL_Usuarios.Open;
    GridUsuarios.Refresh;

    Seta();
end;

procedure TUsuario00.EditBuscaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      BT_Buscar.SetFocus;
      End
    Else
      Begin
      Key := UpCase(Key);
    End;
end;

procedure TUsuario00.BT_BuscarClick(Sender: TObject);
begin
    ConexaoBD.SQl_Usuarios.Close;
    ConexaoBD.SQl_Usuarios.SQL.Clear;

    If (Trim(EditBusca.Text) = '') Then
      Begin
      ConexaoBD.SQl_Usuarios.SQL.Add('Select * From Usuarios Order By Usuario_Nome');
      End
    Else
      Begin
      ConexaoBD.SQl_Usuarios.SQL.Add('Select * From Usuarios Where Usuario_Nome like "%' + Texto_Grava(EditBusca.Text) + '%"');
    End;

    ConexaoBD.SQl_Usuarios.Open;
    GridUsuarios.Refresh;
end;

end.
