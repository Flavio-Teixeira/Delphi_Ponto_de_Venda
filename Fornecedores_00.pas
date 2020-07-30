unit Fornecedores_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls;

type
  TFornecedores00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BT_Buscar: TBitBtn;
    ComboLocalBusca: TComboBox;
    EditBusca: TMaskEdit;
    GroupBox2: TGroupBox;
    GridFornecedores: TDBGrid;
    Panel2: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridFornecedoresCellClick(Column: TColumn);
    procedure ComboLocalBuscaChange(Sender: TObject);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_BuscarClick(Sender: TObject);
    procedure ComboLocalBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fornecedores00: TFornecedores00;

implementation

uses Conexao_BD, Fornecedores_01, Fornecedores_02, Rotinas_Gerais,
  Principal_00;

{$R *.dfm}

procedure TFornecedores00.BT_SairClick(Sender: TObject);
begin
  Fornecedores00.Close;
end;

procedure TFornecedores00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TFornecedores01,Fornecedores01);
    Fornecedores00.Visible  := False;
    Fornecedores01.ShowModal;
    Fornecedores01.Destroy;
    Fornecedores00.Visible  := True;
end;

procedure TFornecedores00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridFornecedores.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridFornecedores.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridFornecedores.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Fornecedores.Close;
    ConexaoBD.SQL_Fornecedores.SQL.Clear;
    ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from Fornecedores Order By Fornecedor_Numero');
    ConexaoBD.SQL_Fornecedores.Open;
    GridFornecedores.Refresh;

    Seta();
end;

procedure TFornecedores00.GridFornecedoresCellClick(Column: TColumn);
begin
    If Trim(GridFornecedores.Fields[0].Text) <> '' Then
      Begin
      Application.CreateForm(TFornecedores02,Fornecedores02);

      Ampulheta();
      Fornecedores02.lblNumero.Caption := Trim(GridFornecedores.Fields[0].Text);
      Seta();

      Fornecedores00.Visible  := False;
      Fornecedores02.ShowModal;
      Fornecedores02.Destroy;
      Fornecedores00.Visible  := True;
    End;
End;

procedure TFornecedores00.ComboLocalBuscaChange(Sender: TObject);
begin

    If Trim(ComboLocalBusca.Text) = 'Número' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '9999999999';
      EditBusca.MaxLength := 10;
      End
    Else If Trim(ComboLocalBusca.Text) = 'CNPJ' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '99.999.999/9999-99;1; ';
      EditBusca.MaxLength := 18;
      End
    Else If (Trim(ComboLocalBusca.Text) = 'Razão Social') Or
    (Trim(ComboLocalBusca.Text) = 'Nome Fantasia') Or
    (Trim(ComboLocalBusca.Text) = 'Endereço') Or
    (Trim(ComboLocalBusca.Text) = 'Bairro') Or
    (Trim(ComboLocalBusca.Text) = 'Cidade') Or
    (Trim(ComboLocalBusca.Text) = 'Contato') Or
    (Trim(ComboLocalBusca.Text) = 'E-mail') Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength :=100;
      End
    Else If Trim(ComboLocalBusca.Text) = 'Fone' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength := 15;
      End
    Else If Trim(ComboLocalBusca.Text) = 'CEP' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '99999-999;1; ';
      EditBusca.MaxLength := 9;
      End
    Else
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength := 2;
    End;
end;

procedure TFornecedores00.EditBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else if (Trim(ComboLocalBusca.Text) = 'Estado') Then
      Begin
      Key := UpCase(Key);
    End;
end;

procedure TFornecedores00.BT_BuscarClick(Sender: TObject);
begin
    ConexaoBD.SQL_Fornecedores.Close;
    ConexaoBD.SQL_Fornecedores.SQL.Clear;

    If (Trim(EditBusca.Text) = '')Or(Trim(EditBusca.Text) = '-')Or(Trim(EditBusca.Text) = '.   .   /    -') Then
      Begin

      If Trim(ComboLocalBusca.Text) = 'Número' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Numero');
        End
      Else If Trim(ComboLocalBusca.Text) = 'CNPJ' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Cnpj');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Razão Social' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Razao_Social');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Nome Fantasia' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Nome_Fantasia');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Endereço' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Endereco');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Bairro' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Bairro');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Cidade' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Cidade');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Estado' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Estado');
        End
      Else If Trim(ComboLocalBusca.Text)= 'CEP' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_CEP');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Fone' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Fone_Comercial, Fornecedor_Fone_Celular, Fornecedor_Fone_Fax');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Contato' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Contato');
        End
      Else
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Email');
      End;

      End
    Else
      Begin

      If Trim(ComboLocalBusca.Text) = 'Número' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Numero = ' + Texto_Grava(EditBusca.Text));
        End
      Else If Trim(ComboLocalBusca.Text) = 'CNPJ' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Cnpj Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Razão Social' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Razao_Social Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Nome Fantasia' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Nome_Fantasia Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Endereço' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Endereco Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Bairro' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Bairro Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Cidade' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Cidade Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Estado' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Estado Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'CEP' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_CEP Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Fone' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where (Fornecedor_Fone_Comercial Like "%' + Texto_Grava(EditBusca.Text) + '%") Or (Fornecedor_Fone_Celular Like "%' + Texto_Grava(EditBusca.Text) + '%") Or (Fornecedor_Fone_Fax Like "%' + Texto_Grava(EditBusca.Text) + '%")');
        End
      Else If Trim(ComboLocalBusca.Text)= 'Contato' Then
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Contato Like "%' + Texto_Grava(EditBusca.Text) + '%"');
        End
      Else
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where Fornecedor_Email Like "%' + Texto_Grava(EditBusca.Text) + '%"');
      End;

    End;
    ConexaoBD.SQL_Fornecedores.Open;
    GridFornecedores.Refresh;
end;

procedure TFornecedores00.ComboLocalBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TFornecedores00.EditBuscaChange(Sender: TObject);
begin
    If Trim(ComboLocalBusca.Text) = 'Número' Then
      Begin
      EditBusca.EditMask  := '9999999999';
      EditBusca.MaxLength := 10;
    End
end;

end.
