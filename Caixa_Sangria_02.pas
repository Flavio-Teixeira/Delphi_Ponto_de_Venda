unit Caixa_Sangria_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TCaixa_Sangria02 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BT_Buscar: TBitBtn;
    ComboLocalBusca: TComboBox;
    GroupBox2: TGroupBox;
    GridProdutos: TDBGrid;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    EditBusca: TMaskEdit;
    procedure BT_BuscarClick(Sender: TObject);
    procedure ComboLocalBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure BT_SairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridProdutosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Sangria02: TCaixa_Sangria02;

implementation

uses Conexao_BD, Rotinas_Gerais, Caixa_Sangria_03, Principal_00;

{$R *.dfm}

procedure TCaixa_Sangria02.BT_BuscarClick(Sender: TObject);
begin
    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    If Trim(EditBusca.Text) = '' Then
      Begin
        If Trim(ComboLocalBusca.Text)= 'Valor' Then
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' Order By Registro_Caixa_Valor Desc')
        Else If Trim(ComboLocalBusca.Text)= 'Hora' Then
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' Order By Registro_Caixa_Hora Desc')
        Else
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' Order By Registro_Caixa_Data Desc');
      End
    Else
      Begin
        If Trim(ComboLocalBusca.Text)= 'Valor' Then
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' And Registro_Caixa_Valor Like "%' + Trim(EditBusca.Text) + '%" Order By Registro_Caixa_Valor Desc')
        Else If Trim(ComboLocalBusca.Text)= 'Hora' Then
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' And Registro_Caixa_Hora Like "%' + Trim(EditBusca.Text) + '%" Order By Registro_Caixa_Hora Desc')
        Else
          ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' And Registro_Caixa_Data Like "%' + Trim(EditBusca.Text) + '%" Order By Registro_Caixa_Data Desc');
    End;
    ConexaoBD.SQL_Registro_Caixa.Open;
    GridProdutos.Refresh;
end;

procedure TCaixa_Sangria02.ComboLocalBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TCaixa_Sangria02.EditBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
    if Trim(ComboLocalBusca.Text) = 'Valor' Then
      So_Valor(sender,Key)
    Else if (Trim(ComboLocalBusca.Text) = 'Hora') and (Key <> ':') Then
      So_Numero(Sender,Key)
    Else if (Trim(ComboLocalBusca.Text) = 'Data') and (Key <> '/') Then
      So_Numero(Sender,Key);

end;

procedure TCaixa_Sangria02.FormShow(Sender: TObject);
begin

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridProdutos.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridProdutos.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridProdutos.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * from Registro_Caixa Where Registro_Caixa_Maquina = '+#39+Numero_HD('C')+#39+' And Registro_Caixa_Operacao='+#39+'Sangria - Retirada'+#39+' Order By Registro_Caixa_Data Desc, Registro_Caixa_Hora Desc, Registro_Caixa_Valor Desc');
    ConexaoBD.SQL_Registro_Caixa.Open;
    GridProdutos.Refresh;
end;

procedure TCaixa_Sangria02.GridProdutosCellClick(Column: TColumn);
begin
    If Trim(GridProdutos.Fields[0].Text) <> '' Then
      Begin

        Application.CreateForm(TCaixa_Sangria03,Caixa_Sangria03);

        Ampulheta();
          Caixa_Sangria03.Edit_Data.Text      := Trim(GridProdutos.Fields[0].Text);
          Caixa_Sangria03.Edit_Hora.Text      := Trim(GridProdutos.Fields[1].Text);
          Caixa_Sangria03.EditVlr_Sangria.Text:= Trim(GridProdutos.Fields[2].Text);
          Caixa_Sangria03.Edit_Operacao.Text  := 'Sangria - Retirada';
          Caixa_Sangria03.Edit_Maquina.Text   := Numero_HD('C');
        Seta();

        Caixa_Sangria02.Visible  := False;
        Caixa_Sangria03.ShowModal;
        Caixa_Sangria03.Destroy;
        Caixa_Sangria02.Visible  := True;

    End;
end;

procedure TCaixa_Sangria02.BT_SairClick(Sender: TObject);
begin
  Caixa_Sangria02.Close;
end;

procedure TCaixa_Sangria02.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then Caixa_Sangria02.Close;
end;

procedure TCaixa_Sangria02.GridProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Trim(GridProdutos.Fields[0].Text) <> '') and (Key =#13) Then
      Begin

        Application.CreateForm(TCaixa_Sangria03,Caixa_Sangria03);

        Ampulheta();
          Caixa_Sangria03.Edit_Data.Text      := Trim(GridProdutos.Fields[0].Text);
          Caixa_Sangria03.Edit_Hora.Text      := Trim(GridProdutos.Fields[1].Text);
          Caixa_Sangria03.EditVlr_Sangria.Text:= Trim(GridProdutos.Fields[2].Text);
          Caixa_Sangria03.Edit_Operacao.Text  := 'Sangria - Retirada';
          Caixa_Sangria03.Edit_Maquina.Text   := Numero_HD('C');
        Seta();

        Caixa_Sangria02.Visible  := False;
        Caixa_Sangria03.ShowModal;
        Caixa_Sangria03.Destroy;
        Caixa_Sangria02.Visible  := True;

    End;
end;

end.
