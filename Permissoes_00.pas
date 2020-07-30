unit Permissoes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, ExtCtrls;

type
  TPermissoes00 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    Padrao: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Grid_Permissoes: TStringGrid;
    RB_NT_S: TRadioButton;
    RB_NT_N: TRadioButton;
    CB_Usuarios: TComboBox;
    Label1: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure Grid_PermissoesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure CB_UsuariosChange(Sender: TObject);

  private
    { Private declarations }
    Procedure Carrega_Grid();

  public
    { Public declarations }
  end;

var
  Permissoes00: TPermissoes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Principal_00;

{$R *.dfm}

{ *** Script das Permiss�es ***
TRUNCATE TABLE `Permissao_Acessos`;
INSERT INTO `Permissao_Acessos` (`Permissao_Acesso_Login`, `Permissao_Acesso_Area`, `Permissao_Acesso_Descricao`, `Permissao_Acesso_Permitido`, `Permissao_Acesso_Posicao`) VALUES
('Padr�o', 'mnu_Frente_Loja              ', '1. Frente_Loja', 'S', 1),

('Padr�o', 'mnu_Cadastros                ', '2. Cadastros', 'S', 2),
('Padr�o', 'mnu_Cadastros_Fornecedores   ', '2.1. Cadastros >> Fornecedores', 'S', 3),
('Padr�o', 'mnu_Cadastros_Grupos         ', '2.2. Cadastros >> Grupos', 'S', 4),
('Padr�o', 'mnu_Cadastros_Produtos       ', '2.3. Cadastros >> Produtos', 'S', 5),
('Padr�o', 'mnu_Cadastros_Usuarios       ', '2.4. Cadastros >> Usu�rios', 'S', 6),
('Padr�o', 'mnu_Cadastros_Maquinas       ', '2.5. Cadastros >> Informa��o das M�quinas', 'S', 7),
('Padr�o', 'Empresa1                     ', '2.6. Cadastros >> Informa��es da Empresa', 'S', 8),
('Padr�o', 'Clientes1                    ', '2.7. Cadastros >> Clientes', 'S', 9),

('Padr�o', 'mnu_Estoque                  ', '3. Estoque', 'S', 10),
('Padr�o', 'mnu_Estoque_Ajuste           ', '3.1. Estoque >> Ajuste de Estoque', 'S', 11),
('Padr�o', 'PosioAtualdoEstoque1         ', '3.2. Estoque >> Posi��o Atual de Estoque', 'S', 12),
('Padr�o', 'EntradadeProdutos1           ', '3.3. Estoque >> Entrada de Produtos', 'S', 13),
('Padr�o', 'NotadeEntrada1               ', '3.3.1. Estoque >> Entrada de Produtos >> Nota de Entrada', 'S', 14),
('Padr�o', 'CancelamentodeNotadeEntrada1 ', '3.3.2. Estoque >> Entrada de Produtos >> Cancelamento de Nota de Entrada', 'S', 15),
('Padr�o', 'HistricodeNotasdeEntradas1   ', '3.3.3. Estoque >> Entrada de Produtos >> Hist�rico de Notas de Entradas', 'S', 16),
('Padr�o', 'ControledeTrocas1            ', '3.4. Estoque >> Controle de Trocas', 'S', 17),

('Padr�o', 'mnu_Relatorios               ', '4. Relat�rios', 'S', 18),
('Padr�o', 'Lucratividade1               ', '4.1. Relat�rios >> Lucratividade', 'S', 19),
('Padr�o', 'FechamentodeCaixa1           ', '4.2. Relat�rios >> Fechamento de Caixa', 'S', 20),
('Padr�o', 'mnu_Relatorios_Registro_Caixa', '4.3. Relat�rios >> Fechamento de Caixa - Detalhado', 'S', 21),
('Padr�o', 'ltimaVendaporFornecedor1     ', '4.4. Relat�rios >> �ltima Venda por Fornecedor', 'S', 22),
('Padr�o', 'ItensApagadosnaVenda1        ', '4.5. Relat�rios >> Itens Apagados na Venda', 'S', 23),
('Padr�o', 'ComprasdosClientes1          ', '4.6. Relat�rios >> Compras dos Clientes', 'S', 24),
('Padr�o', 'EstoqueMinimo1               ', '4.7. Relat�rios >> Estoque M�nimo', 'S', 25),

('Padr�o', 'mnu_Configuracoes            ', '5. Configura��es', 'S', 26),
('Padr�o', 'mnu_Configuracoes_Permissoes ', '5.1. Configura��es >> Permiss�es de Acesso', 'S', 27),
('Padr�o', 'mnu_Configuracoes_Limpeza    ', '5.2. Configura��es >> Limpeza de Registros por Per�odo', 'S', 28),
('Padr�o', 'ValordeVendaDiriaporCaixa1   ', '5.3. Configura��es >> Valor de Venda Di�ria por Caixa', 'S', 29),

('Padr�o', 'mnu_Sobre                    ', '6. Sobre', 'S', 30),

('Padr�o', 'mnu_Sair                     ', '7. Sair', 'S', 31);
}

Procedure TPermissoes00.Carrega_Grid();
var Ind: Integer;
begin
  Ampulheta();

  //*** Zera Grid ***

  For Ind := 0 To Grid_Permissoes.RowCount Do
    Begin
    Grid_Permissoes.Cells[0,Ind] := '';
    Grid_Permissoes.Cells[1,Ind] := '';
    Grid_Permissoes.Cells[2,Ind] := '';
    Grid_Permissoes.Cells[3,Ind] := '';
  End;
  Padrao.Text := '';

  //*** Continua o Carregamento Normal ***
  ConexaoBD.SQL_Permissoes.Close;
  ConexaoBD.SQL_Permissoes.SQL.Clear;
  ConexaoBD.SQL_Permissoes.SQL.Add('Select * from Permissao_Acessos Where Permissao_Acesso_Login = "' + Trim(CB_Usuarios.Text) + '" Order By Permissao_Acesso_Posicao');
  ConexaoBD.SQL_Permissoes.Open;

  If ConexaoBD.SQL_Permissoes.RecordCount > 0 Then
    Begin

    Grid_Permissoes.RowCount  := (ConexaoBD.SQL_Permissoes.RecordCount + 1);
    Grid_Permissoes.FixedRows := 1;
    Ind := 0;

    ConexaoBD.SQL_Permissoes.First;

    While Not ConexaoBD.SQL_Permissoes.Eof Do
      Begin
      Ind := Ind + 1;
      Grid_Permissoes.Cells[0,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Area.Text);
      Grid_Permissoes.Cells[1,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Descricao.Text);

      If Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Permitido.Text) = 'S' Then
        begin
        Grid_Permissoes.Cells[2,Ind] := 'Sim';
        end
      Else
        begin
        Grid_Permissoes.Cells[2,Ind] := 'N�o';
      End;

      Grid_Permissoes.Cells[3,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Posicao.Text);
      ConexaoBD.SQL_Permissoes.Next;
    End;

    ConexaoBD.SQL_Usuarios.Close;
    ConexaoBD.SQL_Usuarios.SQL.Clear;
    ConexaoBD.SQL_Usuarios.SQL.Add('Select * From Usuarios Where Usuario_Nome = "' + Trim(CB_Usuarios.Text) + '"');
    ConexaoBD.SQL_Usuarios.Open;

    If ConexaoBD.SQL_UsuariosUsuario_Fiscal.Text = 'S' Then
      Begin
        RB_NT_S.Checked := True;
      End
    Else
      Begin
        RB_NT_N.Checked := True;
    End;

    End
  Else if Trim(CB_Usuarios.Text) <> '--------- Selecione um Usu�rio ---------' Then
    begin

    ConexaoBD.SQL_Permissoes.Close;
    ConexaoBD.SQL_Permissoes.SQL.Clear;
    ConexaoBD.SQL_Permissoes.SQL.Add('Select * from Permissao_Acessos Where Permissao_Acesso_Login = ' +#39+ 'Padr�o' +#39+ ' Order By Permissao_Acesso_Posicao');
    ConexaoBD.SQL_Permissoes.Open;

    If ConexaoBD.SQL_Permissoes.RecordCount > 0 Then
      Begin

      Padrao.Text               := 'S';
      Grid_Permissoes.RowCount  := (ConexaoBD.SQL_Permissoes.RecordCount + 1);
      Grid_Permissoes.FixedRows := 1;
      Ind := 0;

      ConexaoBD.SQL_Permissoes.First;

      While Not ConexaoBD.SQL_Permissoes.Eof Do
        Begin
        Ind := Ind + 1;
        Grid_Permissoes.Cells[0,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Area.Text);
        Grid_Permissoes.Cells[1,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Descricao.Text);

        If Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Permitido.Text) = 'S' Then
          begin
          Grid_Permissoes.Cells[2,Ind] := 'Sim';
          end
        Else
          begin
          Grid_Permissoes.Cells[2,Ind] := 'N�o';
        End;

        Grid_Permissoes.Cells[3,Ind] := Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Posicao.Text);
        ConexaoBD.SQL_Permissoes.Next;

      End;

      ConexaoBD.SQL_Usuarios.Close;
      ConexaoBD.SQL_Usuarios.SQL.Clear;
      ConexaoBD.SQL_Usuarios.SQL.Add('Select * From Usuarios Where Usuario_Nome = "' + Trim(CB_Usuarios.Text) + '"');
      ConexaoBD.SQL_Usuarios.Open;

      If ConexaoBD.SQL_UsuariosUsuario_Fiscal.Text = 'S' Then
        Begin
          RB_NT_S.Checked := True;
        End
      Else
        Begin
          RB_NT_N.Checked := True;
      End;

    End;

    end
  Else
    Begin
    Grid_Permissoes.RowCount  := 2;
    Grid_Permissoes.FixedRows := 1;
  End;

  //*** Prepara��o do StringGrid ***

  //*** Quantidade ***
  Grid_Permissoes.Cells[0,0]   := '�rea';
  Grid_Permissoes.ColWidths[0] := 0;

  //*** C�digo do Produto ***
  Grid_Permissoes.Cells[1,0]   := 'Descri��o';
  Grid_Permissoes.ColWidths[1] := 354;

  //*** Descri��o do Produto ***
  Grid_Permissoes.Cells[2,0]   := 'Permitido';
  Grid_Permissoes.ColWidths[2] := 50;

  //*** Posi��o ***
  Grid_Permissoes.Cells[3,0]   := 'Posi��o';
  Grid_Permissoes.ColWidths[3] := 0;

  Grid_Permissoes.Refresh;

  Seta();
end;

procedure TPermissoes00.BT_SairClick(Sender: TObject);
begin
    Permissoes00.Close;
end;

procedure TPermissoes00.Grid_PermissoesDblClick(Sender: TObject);
begin
  If Grid_Permissoes.Cells[2,Grid_Permissoes.Row] = 'Sim' Then
    begin
    Grid_Permissoes.Cells[2,Grid_Permissoes.Row] := 'N�o';
    end
  Else If Grid_Permissoes.Cells[2,Grid_Permissoes.Row] = 'N�o' Then
    begin
    Grid_Permissoes.Cells[2,Grid_Permissoes.Row] := 'Sim';
  end;
end;

procedure TPermissoes00.FormShow(Sender: TObject);
begin

  If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
     Begin
     Grid_Permissoes.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
     Grid_Permissoes.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
  End;

  ConexaoBD.SQL_Usuarios.Close;
  ConexaoBD.SQL_Usuarios.SQL.Clear;
  ConexaoBD.SQL_Usuarios.SQL.Add('Select * from Usuarios Order By Usuario_Nome');
  ConexaoBD.SQL_Usuarios.Open;

  ConexaoBD.SQL_Usuarios.First;
  CB_Usuarios.Items.Clear;
  CB_Usuarios.Items.Add('--------- Selecione um Usu�rio ---------');
  While Not ConexaoBD.SQL_Usuarios.Eof Do
    begin
    CB_Usuarios.Items.Add(Trim(ConexaoBD.SQL_UsuariosUsuario_Nome.Text));
    ConexaoBD.SQL_Usuarios.Next;
  End;
  CB_Usuarios.ItemIndex := 0;

  ConexaoBD.SQL_Usuarios.Close;

  Carrega_Grid();

end;

procedure TPermissoes00.BT_AlterarClick(Sender: TObject);
var
  Acesso, Comando_SQL: String;
  Ind : Integer;
begin

  Ampulheta();

  If Trim(CB_Usuarios.Text) <> '--------- Selecione um Usu�rio ---------' Then
    begin

    If RB_NT_S.Checked = True Then
      begin
      Acesso := 'S';
      End
    else
      begin
      Acesso := 'N';
    End;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Update Usuarios set Usuario_Fiscal ="' + Trim(Acesso) + '" Where Usuario_Nome ="' + Trim(CB_Usuarios.Text)+ '"');
    ConexaoBD.SQL_Comunitario.ExecSQL;

    if Trim(Padrao.Text) = '' Then
      begin

      For ind:=1 To (Grid_Permissoes.RowCount -1) Do
        begin
        Comando_SQL := 'Update Permissao_Acessos set ';
        if Grid_Permissoes.Cells[2,Ind] = 'Sim' Then
          begin
          Comando_SQL := Comando_SQL + 'Permissao_Acesso_Permitido = "S" ';
          end
        else
          begin
          Comando_SQL := Comando_SQL + 'Permissao_Acesso_Permitido = "N" ';
        End;

        Comando_SQL := Comando_SQL + ' Where (Permissao_Acesso_Login = "' + Trim(CB_Usuarios.Text) + '") and ';
        Comando_SQL := Comando_SQL + '(Permissao_Acesso_Area = "' + Grid_Permissoes.Cells[0,Ind] + '")';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

      end;
      End
    else
      begin
      For ind:=1 To (Grid_Permissoes.RowCount -1) Do
        begin
        Comando_SQL := 'Insert Into Permissao_Acessos(';
        Comando_SQL := Comando_SQL + 'Permissao_Acesso_Login, ';
        Comando_SQL := Comando_SQL + 'Permissao_Acesso_Area, ';
        Comando_SQL := Comando_SQL + 'Permissao_Acesso_Descricao, ';
        Comando_SQL := Comando_SQL + 'Permissao_Acesso_Permitido, ';
        Comando_SQL := Comando_SQL + 'Permissao_Acesso_Posicao';
        Comando_SQL := Comando_SQL + ') Values(';
        Comando_SQL := Comando_SQL + '"' + Trim(CB_Usuarios.Text)             + '", ';
        Comando_SQL := Comando_SQL + '"' + Trim(Grid_Permissoes.Cells[0,Ind]) + '", ';
        Comando_SQL := Comando_SQL + '"' + Trim(Grid_Permissoes.Cells[1,Ind]) + '", ';
        if Trim(Grid_Permissoes.Cells[2,Ind]) = 'Sim' Then
          begin
          Comando_SQL := Comando_SQL + '"S" , ';
          End
        else
          begin
          Comando_SQL := Comando_SQL + '"N" , ';
        End;
        Comando_SQL := Comando_SQL + Trim(Grid_Permissoes.Cells[3,Ind]) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
      End;
    End;
    MSG_Erro('Altera��o efetuada com sucesso...');
    Permissoes00.Close;
    End
  Else
    begin
    MSG_Erro('Selecione um usu�rio...');
    CB_Usuarios.SetFocus;
  End;

  Seta();

End;

procedure TPermissoes00.CB_UsuariosChange(Sender: TObject);
begin
    Carrega_Grid();
end;

end.
