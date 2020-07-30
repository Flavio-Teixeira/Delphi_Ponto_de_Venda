unit Trocas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TTrocas00 = class(TForm)
    Panel1: TPanel;
    BT_Sair: TBitBtn;
    BT_Incluir: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GridTrocas: TDBGrid;
    GroupBox2: TGroupBox;
    BT_Buscar: TBitBtn;
    Label2: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Label3: TLabel;
    Rel_Periodo_Final: TMaskEdit;
    BT_Imprimir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure GridTrocasCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Trocas00: TTrocas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Trocas_01, Trocas_02, Principal_00,
  Trocas_03;

{$R *.dfm}

procedure TTrocas00.BT_SairClick(Sender: TObject);
begin
    Trocas00.Close;
end;

procedure TTrocas00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TTrocas01,Trocas01);
    Trocas00.Visible  := False;
    Trocas01.ShowModal;
    Trocas01.Destroy;
    Trocas00.Visible  := True;
end;

procedure TTrocas00.GridTrocasCellClick(Column: TColumn);
begin
    If GridTrocas.Fields[0].Text <> '' Then
      Begin
      Application.CreateForm(TTrocas02,Trocas02);

      Ampulheta();
      Trocas02.Troca_Numero.Text     := Trim(GridTrocas.Fields[0].Text);
      Trocas02.Troca_Codigo.Text     := Trim(GridTrocas.Fields[1].Text);
      Trocas02.Troca_Descricao.Text  := Trim(GridTrocas.Fields[2].Text);
      Trocas02.Troca_Qtde.Text       := Trim(GridTrocas.Fields[3].Text);
      Trocas02.Troca_Data.Text       := Trim(GridTrocas.Fields[4].Text);
      Trocas02.Troca_Observacao.Text := Trim(GridTrocas.Fields[5].Text);
      Seta();

      Trocas00.Visible := False;
      Trocas02.ShowModal;
      Trocas02.Destroy;
      Trocas00.Visible := True;
    End;
end;

procedure TTrocas00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridTrocas.Handle,SB_VERT,True);

    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text := DateToStr(Date());

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridTrocas.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridTrocas.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Trocas.Close;
    ConexaoBD.SQL_Trocas.SQL.Clear;
    ConexaoBD.SQL_Trocas.SQL.Add('Select * from Trocas Order By Troca_Data Desc, Troca_Codigo Asc');
    ConexaoBD.SQL_Trocas.Open;
    GridTrocas.Refresh;

    Seta();
end;

procedure TTrocas00.BT_BuscarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
    Comando_SQL := 'Select * From Trocas Where ((Troca_Data >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Troca_Data <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')) Order By Troca_Data Desc, Troca_Codigo Asc';

    ConexaoBD.SQL_Trocas.Close;
    ConexaoBD.SQL_Trocas.SQL.Clear;
    ConexaoBD.SQL_Trocas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Trocas.Open;
    GridTrocas.Refresh;
end;

procedure TTrocas00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Rel_Periodo_Final.Text := Rel_Periodo_Inicial.Text;

      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TTrocas00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TTrocas00.BT_ImprimirClick(Sender: TObject);
begin
     BT_Incluir.Enabled  := False;
     BT_Imprimir.Enabled := False;
     BT_Sair.Enabled     := False;

     Ampulheta();

     Application.CreateForm(TTrocas03,Trocas03);

     Seta();

     Trocas03.QRL_Periodo.Caption := 'Período: ' + Trim(Rel_Periodo_Inicial.Text) + ' Até ' + Trim(Rel_Periodo_Final.Text);

     Trocas03.QR_Trocas.PreviewModal;
     Trocas03.QR_Trocas.Destroy;
     Trocas03.Destroy;

     BT_Incluir.Enabled  := True;
     BT_Imprimir.Enabled := True;
     BT_Sair.Enabled     := True;
end;

end.
