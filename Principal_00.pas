unit Principal_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, ImgList, ToolWin,
  StdCtrls;

type
  TPrincipal = class(TForm)
    Menu_Principal: TMainMenu;
    mnu_Cadastros: TMenuItem;
    mnu_Cadastros_Produtos: TMenuItem;
    mnu_Sair: TMenuItem;
    mnu_Cadastros_Grupos: TMenuItem;
    mnu_Cadastros_Fornecedores: TMenuItem;
    Mn_Mensagens: TStatusBar;
    Timer1: TTimer;
    mnu_Sobre: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Atl_Grupos: TToolButton;
    Atl_Fornecedores: TToolButton;
    Atl_Produtos: TToolButton;
    ToolButton2: TToolButton;
    Atl_Sair: TToolButton;
    mnu_Frente_Loja: TMenuItem;
    Edit_Usuario: TEdit;
    mnu_Cadastros_Usuarios: TMenuItem;
    mnu_Relatorios: TMenuItem;
    mnu_Relatorios_Registro_Caixa: TMenuItem;
    Atl_Usuarios: TToolButton;
    mnu_Cadastros_Maquinas: TMenuItem;
    Atl_Informacao_Maquinas: TToolButton;
    mnu_Configuracoes: TMenuItem;
    mnu_Configuracoes_Permissoes: TMenuItem;
    mnu_Estoque: TMenuItem;
    mnu_Estoque_Ajuste: TMenuItem;
    mnu_Configuracoes_Limpeza: TMenuItem;
    FechamentodeCaixa1: TMenuItem;
    Lucratividade1: TMenuItem;
    ValordeVendaDiriaporCaixa1: TMenuItem;
    ltimaVendaporFornecedor1: TMenuItem;
    PosioAtualdoEstoque1: TMenuItem;
    EntradadeProdutos1: TMenuItem;
    NotadeEntrada1: TMenuItem;
    CancelamentodeNotadeEntrada1: TMenuItem;
    HistricodeNotasdeEntradas1: TMenuItem;
    Edit_Cor_Grid: TEdit;
    Edit_Cor_Letra: TEdit;
    Edit_Gaveta: TEdit;
    Edit_Impressora: TEdit;
    Lista_IMG: TImageList;
    N1: TMenuItem;
    ItensApagadosnaVenda1: TMenuItem;
    Empresa1: TMenuItem;
    Caixa_Aberto: TEdit;
    T_Valor_Venda_Diaria: TEdit;
    T_Valor_Venda: TEdit;
    T_Valor_Sangria: TEdit;
    Clientes1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ComprasdosClientes1: TMenuItem;
    N4: TMenuItem;
    EstoqueMinimo1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ControledeTrocas1: TMenuItem;
    Inventario: TMenuItem;
    N7: TMenuItem;
    ContagemdeCedulas: TMenuItem;
    mnu_Atualizar: TMenuItem;
    LucratividadeDistribuidora: TMenuItem;
    N8: TMenuItem;
    PerdadeProdutos: TMenuItem;
    mnu_EnviarEstoque: TMenuItem;
    procedure mnu_SairClick(Sender: TObject);
    procedure mnu_Cadastros_ProdutosClick(Sender: TObject);
    procedure mnu_Cadastros_GruposClick(Sender: TObject);
    procedure mnu_Cadastros_FornecedoresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnu_SobreClick(Sender: TObject);
    procedure Atl_FornecedoresClick(Sender: TObject);
    procedure Atl_GruposClick(Sender: TObject);
    procedure Atl_ProdutosClick(Sender: TObject);
    procedure Atl_SairClick(Sender: TObject);
    procedure mnu_Frente_LojaClick(Sender: TObject);
    procedure mnu_Cadastros_UsuariosClick(Sender: TObject);
    procedure mnu_Relatorios_Registro_CaixaClick(Sender: TObject);
    procedure Atl_UsuariosClick(Sender: TObject);
    procedure mnu_Cadastros_MaquinasClick(Sender: TObject);
    procedure Atl_Informacao_MaquinasClick(Sender: TObject);
    procedure mnu_Configuracoes_PermissoesClick(Sender: TObject);
    procedure mnu_Estoque_AjusteClick(Sender: TObject);
    procedure mnu_Configuracoes_LimpezaClick(Sender: TObject);
    procedure FechamentodeCaixa1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Lucratividade1Click(Sender: TObject);
    procedure ValordeVendaDiriaporCaixa1Click(Sender: TObject);
    procedure ltimaVendaporFornecedor1Click(Sender: TObject);
    procedure PosioAtualdoEstoque1Click(Sender: TObject);
    procedure NotadeEntrada1Click(Sender: TObject);
    procedure ItensApagadosnaVenda1Click(Sender: TObject);
    procedure CancelamentodeNotadeEntrada1Click(Sender: TObject);
    procedure HistricodeNotasdeEntradas1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure ComprasdosClientes1Click(Sender: TObject);
    procedure EstoqueMinimo1Click(Sender: TObject);
    procedure ControledeTrocas1Click(Sender: TObject);
    procedure InventarioClick(Sender: TObject);
    procedure ContagemdeCedulasClick(Sender: TObject);
    procedure mnu_AtualizarClick(Sender: TObject);
    procedure LucratividadeDistribuidoraClick(Sender: TObject);
    procedure PerdadeProdutosClick(Sender: TObject);
    procedure mnu_EnviarEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowHint(Sender: TObject);

  end;

var
  Principal: TPrincipal;

implementation

uses Produtos_00, Fornecedores_00, Grupos_00, Rotinas_Gerais, Sobre_00, Frente_Loja_00,
  Usuario_00, Rel_RegistroCaixa_00, Informacao_Maquinas_00, Permissoes_00,
  Conexao_BD, Estoque_00, Limpeza_Login_00, Rel_Fechamento_Caixa_00,
  Rel_Lucratividade_00, Valor_Venda_Diaria_00,
  Rel_Fornecedor_Ultima_Venda_00, Posicao_Atual_Estoque_00,
  Entrada_Produtos_NF_00, Rel_Item_Apagado_Venda_00, Cancela_Entrada_00,
  Historico_Nota_Entrada_00, Empresa_00, Clientes_00,
  Rel_ComprasClientes_00, Rel_Estoque_Minimo_00, Trocas_00, Inventario_00,
  Contagem_Cedulas_00, Atualizacao_00, Rel_Lucratividade_D00, Rel_Perda_Produtos_00,
  EnviarEstoque_00;

{$R *.dfm}

procedure TPrincipal.ShowHint(Sender: TObject);
begin
     Mn_Mensagens.Panels[2].Text := Application.Hint;
end;

procedure TPrincipal.mnu_SairClick(Sender: TObject);
begin
  Principal.Close;
end;

procedure TPrincipal.mnu_Cadastros_ProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TProdutos00,Produtos00);
  Produtos00.ShowModal;
  Produtos00.Destroy;
end;

procedure TPrincipal.mnu_Cadastros_GruposClick(Sender: TObject);
begin
  Application.CreateForm(TGrupos00,Grupos00);
  Grupos00.ShowModal;
  Grupos00.Destroy;
end;

procedure TPrincipal.mnu_Cadastros_FornecedoresClick(Sender: TObject);
begin
  Application.CreateForm(TFornecedores00,Fornecedores00);
  Fornecedores00.ShowModal;
  Fornecedores00.Destroy;
end;

procedure TPrincipal.FormShow(Sender: TObject);
var Menu : String;
begin

  Ampulheta();

    // Mostra a data na barra de status
    Mn_Mensagens.Panels[0].Text := MostraData;
    Mn_Mensagens.Panels[2].Text := '';

    // Ajusta o Tamanho do Formulário
    with Principal do begin
      Left := 0;
      Top  := 0;
      Height := Screen.Height - 29;
      Width  := Screen.Width;
    end;

    // Verifica acesso aos itens do menu
    ConexaoBD.SQL_Permissoes.Close;
    ConexaoBD.SQL_Permissoes.SQL.Clear;
    ConexaoBD.SQL_Permissoes.SQL.Add('Select * from Permissao_Acessos Where Permissao_Acesso_Login ="' + Trim(Edit_Usuario.Text) + '"');
    ConexaoBD.SQL_Permissoes.Open;

    While ConexaoBD.SQL_Permissoes.Eof = False Do
      Begin
        Menu := ConexaoBD.SQL_PermissoesPermissao_Acesso_Area.Text;
        If Trim(ConexaoBD.SQL_PermissoesPermissao_Acesso_Permitido.Text) = 'S' Then
          Begin
            With TMenuItem(FindComponent(Menu)) Do Enabled := True;
          end
        Else
          begin
            With TMenuItem(FindComponent(Menu)) Do Enabled := False;
        End;
        ConexaoBD.SQL_Permissoes.Next;
    End;
    ConexaoBD.SQL_Permissoes.Close;

  Seta();

end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
     Mn_Mensagens.Panels[1].Text := TimeToStr(Time);
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';

     Application.OnHint := ShowHint;

end;

procedure TPrincipal.mnu_SobreClick(Sender: TObject);
begin

  Application.CreateForm(TSobre00,Sobre00);
  Sobre00.ShowModal;
  Sobre00.Destroy;

end;

procedure TPrincipal.Atl_FornecedoresClick(Sender: TObject);
begin
  Application.CreateForm(TFornecedores00,Fornecedores00);
  Fornecedores00.ShowModal;
  Fornecedores00.Destroy;
end;

procedure TPrincipal.Atl_GruposClick(Sender: TObject);
begin
  Application.CreateForm(TGrupos00,Grupos00);
  Grupos00.ShowModal;
  Grupos00.Destroy;
End;

Procedure TPrincipal.Atl_ProdutosClick(Sender: TObject);
  Begin
    Application.CreateForm(TProdutos00,Produtos00);
    Produtos00.ShowModal;
    Produtos00.Destroy;
End;

Procedure TPrincipal.Atl_SairClick(Sender: TObject);
  Begin
    Principal.Close;
End;

Procedure TPrincipal.mnu_Frente_LojaClick(Sender: TObject);
  var
     Vlr_Exibicao: String;

  Begin
    Ampulheta();

    //*** Início - Venda Diária ***

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Valor_Venda_Diaria');
    ConexaoBD.SQL_Comunitario.Open;

    If ConexaoBD.SQL_Comunitario.RecordCount > 0 Then
       Begin
       Vlr_Exibicao := ConexaoBD.SQL_Comunitario.FieldValues['Valor_Venda_Diaria_Vlr'];

       Principal.T_Valor_Venda_Diaria.Text := Ponto_Virgula(Vlr_Exibicao);
       End
    Else
       Begin
       Principal.T_Valor_Venda_Diaria.Text := '0';
    End;

    //*** Final - Venda Diária ***

    Application.CreateForm(TFrente_Loja00,Frente_Loja00);

    Principal.Visible := False;

    If Screen.Width <= 640 Then
       Begin
       //*** Ajusta o Formulário Para o Tamanho de 640 x 480 ***

       Frente_Loja00.EditDescricao.Width        := 260;
       Frente_Loja00.Dados_Produto.Width        := 597;
       Frente_Loja00.Titulo_Lista_Compras.Width := 595;
       Frente_Loja00.Panel1.Width               := 619;

       Frente_Loja00.Lista_Itens.Width          := 576;
       Frente_Loja00.Lista_Itens.Height         := 220;

       Frente_Loja00.Total_Qtd_Compra.Width := 120;
       Frente_Loja00.Total_Vlr_Compra.Width := 112;
       Frente_Loja00.Panel6.Width := 277;
       Frente_Loja00.Panel11.Width := 277;

       Frente_Loja00.Panel5.Width := 285;
       Frente_Loja00.Panel5.Top   := 250;
       Frente_Loja00.Panel5.Left  := 12;

       Frente_Loja00.Panel_Totais.Width := 285;
       Frente_Loja00.Panel_Totais.Top := 250;
       Frente_Loja00.Panel_Totais.Left := 304;

       Frente_Loja00.Compra.Width := 596;
       Frente_Loja00.Compra.Height := 305;

       Frente_Loja00.Panel_Principal.Width  := 619;
       Frente_Loja00.Panel_Principal.Height := 363;

       Frente_Loja00.Width  := 632;
       Frente_Loja00.Height := 444;
    End;

    ConexaoBD.SQL_Empresa.Close;
    ConexaoBD.SQL_Empresa.SQL.Clear;
    ConexaoBD.SQL_Empresa.SQL.Add('Select * from Empresa');
    ConexaoBD.SQL_Empresa.Open;

    If (ConexaoBD.SQL_Empresa.RecordCount > 0) Then begin
        Frente_Loja00.Nome_Loja.Caption := ConexaoBD.SQL_EmpresaEmpresa_Nome_Exibicao.Text;
        Frente_Loja00.Nome_Vendedor.Caption := Trim(Edit_Usuario.Text);
        Frente_Loja00.EditVinculoCliente.Checked := StrToBool(ConexaoBD.SQL_EmpresaEmpresa_Vincula_Cliente.Text);
    End;

    ConexaoBD.SQL_Empresa.Close;

    Seta();

    Frente_Loja00.ShowModal;
    Frente_Loja00.Destroy;

    Principal.Visible := True;
End;

procedure TPrincipal.mnu_Cadastros_UsuariosClick(Sender: TObject);
begin
    Application.CreateForm(TUsuario00,Usuario00);
    Usuario00.ShowModal;
    Usuario00.Destroy;
end;

procedure TPrincipal.mnu_Relatorios_Registro_CaixaClick(Sender: TObject);
begin
    Application.CreateForm(TRel_RegistroCaixa00,Rel_RegistroCaixa00);
    Rel_RegistroCaixa00.ShowModal;
    Rel_RegistroCaixa00.Destroy;
end;

procedure TPrincipal.Atl_UsuariosClick(Sender: TObject);
begin
    Application.CreateForm(TUsuario00,Usuario00);
    Usuario00.ShowModal;
    Usuario00.Destroy;
end;

procedure TPrincipal.mnu_Cadastros_MaquinasClick(Sender: TObject);
begin
    Application.CreateForm(TInformacao_Maquinas00,Informacao_Maquinas00);
    Informacao_Maquinas00.ShowModal;
    Informacao_Maquinas00.Destroy;
end;

procedure TPrincipal.Atl_Informacao_MaquinasClick(Sender: TObject);
begin
    Application.CreateForm(TInformacao_Maquinas00,Informacao_Maquinas00);
    Informacao_Maquinas00.ShowModal;
    Informacao_Maquinas00.Destroy;
end;

procedure TPrincipal.mnu_Configuracoes_PermissoesClick(Sender: TObject);
begin
  Application.CreateForm(TPermissoes00,Permissoes00);
  Permissoes00.ShowModal;
  Permissoes00.Destroy;
end;

procedure TPrincipal.mnu_Estoque_AjusteClick(Sender: TObject);
begin
  Application.CreateForm(TEstoque00,Estoque00);
  Estoque00.ShowModal;
  Estoque00.Destroy;
end;

procedure TPrincipal.mnu_Configuracoes_LimpezaClick(Sender: TObject);
begin
  Application.CreateForm(TLimpeza_Login00,Limpeza_Login00);
  Limpeza_Login00.ShowModal;
  Limpeza_Login00.Destroy;
end;

procedure TPrincipal.FechamentodeCaixa1Click(Sender: TObject);
begin
    Application.CreateForm(TRelFechamentoCaixa00,RelFechamentoCaixa00);
    RelFechamentoCaixa00.ShowModal;
    RelFechamentoCaixa00.Destroy;
end;

procedure TPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then
       Begin
       Principal.Close;
    End;
end;

procedure TPrincipal.Lucratividade1Click(Sender: TObject);
begin
     Application.CreateForm(TRelLucratividade00,RelLucratividade00);
     RelLucratividade00.ShowModal;
     RelLucratividade00.Destroy;
end;

procedure TPrincipal.ValordeVendaDiriaporCaixa1Click(Sender: TObject);
begin
     Application.CreateForm(TValorVendaDiaria00,ValorVendaDiaria00);
     ValorVendaDiaria00.ShowModal;
     ValorVendaDiaria00.Destroy;
end;

procedure TPrincipal.ltimaVendaporFornecedor1Click(Sender: TObject);
begin
    Application.CreateForm(TRelFornecedorUltimaVenda00,RelFornecedorUltimaVenda00);
    RelFornecedorUltimaVenda00.ShowModal;
    RelFornecedorUltimaVenda00.Destroy;
end;

procedure TPrincipal.PosioAtualdoEstoque1Click(Sender: TObject);
begin
    Application.CreateForm(TPosicaoAtualEstoque00,PosicaoAtualEstoque00);
    PosicaoAtualEstoque00.ShowModal;
    PosicaoAtualEstoque00.Destroy;
end;

procedure TPrincipal.NotadeEntrada1Click(Sender: TObject);
begin
    Application.CreateForm(TEntradaProdutosNF00,EntradaProdutosNF00);
    EntradaProdutosNF00.ShowModal;
    EntradaProdutosNF00.Destroy;
end;

procedure TPrincipal.ItensApagadosnaVenda1Click(Sender: TObject);
begin
    Application.CreateForm(TRelItemApagadoVenda00,RelItemApagadoVenda00);
    RelItemApagadoVenda00.ShowModal;
    RelItemApagadoVenda00.Destroy;
end;

procedure TPrincipal.CancelamentodeNotadeEntrada1Click(Sender: TObject);
begin
     Application.CreateForm(TCancelaEntrada00,CancelaEntrada00);
     CancelaEntrada00.ShowModal;
     CancelaEntrada00.Destroy;
end;

procedure TPrincipal.HistricodeNotasdeEntradas1Click(Sender: TObject);
begin
     Application.CreateForm(THistoricoNotaEntrada00,HistoricoNotaEntrada00);
     HistoricoNotaEntrada00.ShowModal;
     HistoricoNotaEntrada00.Destroy;
end;

procedure TPrincipal.Empresa1Click(Sender: TObject);
begin
     Application.CreateForm(TEmpresa00,Empresa00);
     Empresa00.ShowModal;
     Empresa00.Destroy;
end;

procedure TPrincipal.Clientes1Click(Sender: TObject);
begin
     Application.CreateForm(TClientes00,Clientes00);
     Clientes00.ShowModal;
     Clientes00.Destroy;
end;

procedure TPrincipal.ComprasdosClientes1Click(Sender: TObject);
begin
    Application.CreateForm(TRel_ComprasClientes00,Rel_ComprasClientes00);
    Rel_ComprasClientes00.ShowModal;
    Rel_ComprasClientes00.Destroy;
end;

procedure TPrincipal.EstoqueMinimo1Click(Sender: TObject);
begin
     Application.CreateForm(TRelEstoqueMinimo00,RelEstoqueMinimo00);
     RelEstoqueMinimo00.ShowModal;
     RelEstoqueMinimo00.Destroy;
end;

procedure TPrincipal.ControledeTrocas1Click(Sender: TObject);
begin
    Application.CreateForm(TTrocas00,Trocas00);
    Trocas00.ShowModal;
    Trocas00.Destroy;
end;

procedure TPrincipal.InventarioClick(Sender: TObject);
begin
    Application.CreateForm(TInventario00,Inventario00);
    Inventario00.ShowModal;
    Inventario00.Destroy;
end;

procedure TPrincipal.ContagemdeCedulasClick(Sender: TObject);
begin
     Application.CreateForm(TContagemCedulas00,ContagemCedulas00);
     ContagemCedulas00.ShowModal;
     ContagemCedulas00.Destroy;
end;

procedure TPrincipal.mnu_AtualizarClick(Sender: TObject);
begin
  Application.CreateForm(TAtualizacao00,Atualizacao00);
  Atualizacao00.ShowModal;
  Atualizacao00.Destroy;
end;

procedure TPrincipal.LucratividadeDistribuidoraClick(Sender: TObject);
begin
     Application.CreateForm(TRelLucratividadeD00,RelLucratividadeD00);
     RelLucratividadeD00.ShowModal;
     RelLucratividadeD00.Destroy;
end;

procedure TPrincipal.PerdadeProdutosClick(Sender: TObject);
begin
    Application.CreateForm(TRelPerdaProdutos00,RelPerdaProdutos00);
    RelPerdaProdutos00.ShowModal;
    RelPerdaProdutos00.Destroy;
end;

procedure TPrincipal.mnu_EnviarEstoqueClick(Sender: TObject);
begin
  Application.CreateForm(TEnviarEstoque00,EnviarEstoque00);
  EnviarEstoque00.ShowModal;
  EnviarEstoque00.Destroy;
end;

End.
