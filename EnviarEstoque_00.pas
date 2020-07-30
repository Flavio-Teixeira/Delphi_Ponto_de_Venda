unit EnviarEstoque_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, xmldom, XMLIntf, msxmldom,
  XMLDoc, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP;

type
  TEnviarEstoque00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    TempoProgresso: TProgressBar;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnviarEstoque00: TEnviarEstoque00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TEnviarEstoque00.BT_SairClick(Sender: TObject);
begin
  EnviarEstoque00.Close;
end;

procedure TEnviarEstoque00.BT_IncluirClick(Sender: TObject);

var
  Comando_SQL: String;
  Total_Registros, Registro_Atual, Qtde_Barra: Integer;
  vXMLDoc: TXMLDocument;
  vXMLno, vXMLproduto: IXMLNode;

begin
  Ampulheta();

  BT_Incluir.Enabled := False;
  BT_Sair.Enabled    := False;

  //*** Apaga o XML antigo ***
  If FileExists('C:\Atualiza_Site\estoque_colaborador.xml') Then
     Begin
     DeleteFile('C:\Atualiza_Site\estoque_colaborador.xml');
  End;

  //*** Obtem a Quantidade de Registros dos Produtos ***
  Comando_SQL := 'SELECT count(Produto_Codigo) AS Total_Registros FROM Produtos ';
  Comando_SQL := Comando_SQL + 'WHERE ';
  Comando_SQL := Comando_SQL + 'Produto_Fornecedor_Cod IN(17,22,27,50,83,86) OR ';
  Comando_SQL := Comando_SQL + 'Produto_Grupo = ' + #39 + '3' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898415550158' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438207646' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438208421' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438205727' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601825' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601801' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601788' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438209466' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204546' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204522' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204560' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772154304' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772154298' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313049' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900312516' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313681' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '3080' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '3079' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898206500027' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977206' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '263' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300407' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300414' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900312516' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438209466' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898228909204' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898557170795' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977183' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300124' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898335131581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898233931412' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977183' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898206500010' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300020' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300044' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300082' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300501' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246180' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246036' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246272' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246296' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246289' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246210' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898362360961' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246098' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2189' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100063' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2600' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246111' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898362360565' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100049' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246012' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898335131581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010020435' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400175' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400151' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898912678072' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400199' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400014' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438208584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897104900274' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897104900267' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246371' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246364' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896354900010' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1665' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1529' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1528' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1590' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2189' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1860' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2257' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2600' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2631' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1549' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1716' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1548' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1527' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1545' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '074312026362' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551094' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551629' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551599' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551582' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551056' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551575' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551353' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551520' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551346' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551551' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551025' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551537' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551209' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551568' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551605' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899592801811' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551094' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551575' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551056' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551520' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551346' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551209' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898596080376' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898596080192' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356567' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356185' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010070102' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003878463' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898894132912' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898176855004' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896108009259' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898994132912' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551681' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010040914' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864336' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7784569245487' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864251' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864312' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003878487' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864282' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899004784565' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899089410496' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010050166' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898392380366' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898392380069' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772153390' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772153413' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010050166' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663301317' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300228' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300204' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110957' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110971' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110377' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896422511155' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898276061534' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945011889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945011995' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110292' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '789840000378' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898589722243' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '164164' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898906005723' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898538357924' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899089410496' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '789840000378' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010070096' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898589722243' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898912045690' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898630921320' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896084571108' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896108009792' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898415550141' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898630921320' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2273' + #39 + ' ';
  Comando_SQL := Comando_SQL + 'ORDER BY Produto_Fornecedor_Cod, Produto_Descricao';

  ConexaoBD.SQL_Comunitario.Close;
  ConexaoBD.SQL_Comunitario.SQL.Clear;
  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
  ConexaoBD.SQL_Comunitario.Open;

  Total_Registros := StrToInt(ConexaoBD.SQL_Comunitario.FieldByName('Total_Registros').Text);
  Registro_Atual  := 0;

  //*** Seleciona os Produtos ***
  Comando_SQL := 'SELECT Produto_Cod_Barra, Produto_Estoque_Atual, Produto_Preco_Varejo FROM Produtos ';
  Comando_SQL := Comando_SQL + 'WHERE ';
  Comando_SQL := Comando_SQL + 'Produto_Fornecedor_Cod IN(17,22,27,50,83,86) OR ';
  Comando_SQL := Comando_SQL + 'Produto_Grupo = ' + #39 + '3' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898415550158' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438207646' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438208421' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438205727' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601825' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601801' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896798601788' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438209466' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204546' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204522' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438204560' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772154304' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772154298' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313049' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900312516' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313681' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '3080' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '3079' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898206500027' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977206' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '263' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300407' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300414' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900312516' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897900313018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438209466' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898228909204' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898557170795' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977183' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896200300124' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898335131581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898233931412' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898935977183' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898206500010' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300020' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300044' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300082' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300501' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246180' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246036' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246272' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246296' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246289' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246210' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898362360961' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246098' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2189' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100063' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2600' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246111' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898362360565' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100049' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246012' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898335131581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010020435' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400175' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400151' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898912678072' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400199' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898434400014' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896438208584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897104900274' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7897104900267' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246371' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898911246364' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896354900010' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1665' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1529' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1528' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1590' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2189' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1860' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2257' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2600' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2631' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1549' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1716' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1548' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1584' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1527' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '1545' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '074312026362' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551094' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551629' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551599' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551582' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551056' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551575' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551353' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551520' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551346' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551551' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551025' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551537' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551209' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551568' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551605' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899592801811' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551094' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551575' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551056' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551520' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551346' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551209' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356581' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898596080376' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898596080192' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356567' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898905356185' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010070102' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003878463' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898894132912' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898176855004' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896108009259' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898994132912' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898323551681' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010040914' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864336' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7784569245487' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864251' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864312' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003878487' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899003864282' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899004784565' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899089410496' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010050166' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898392380366' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898392380069' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772153390' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7891772153413' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010050166' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663301317' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300228' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896663300204' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110957' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110971' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110377' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896422511155' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898276061534' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945011889' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945011995' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '748945110292' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '789840000378' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898589722243' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '164164' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898906005723' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898538357924' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899089410496' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '789840000378' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896442100018' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7899010070096' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898589722243' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898912045690' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898630921320' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896084571108' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7896108009792' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898415550141' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '7898630921320' + #39 + ' OR ';
  Comando_SQL := Comando_SQL + 'Produto_Cod_Barra = ' + #39 + '2273' + #39 + ' ';
  Comando_SQL := Comando_SQL + 'ORDER BY Produto_Fornecedor_Cod, Produto_Descricao';

  ConexaoBD.SQL_Comunitario.Close;
  ConexaoBD.SQL_Comunitario.SQL.Clear;
  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
  ConexaoBD.SQL_Comunitario.Open;

  //*** Gera o XML ***
  vXMLDoc := TXMLDocument.Create(self);

  vXMLDoc.Active := True;
  vXMLDoc.Version := '1.0';
  vXMLDoc.Encoding := 'UTF-8';

  vXMLno := vXMLDoc.AddChild('atualizacao');

  While Not ConexaoBD.SQL_Comunitario.Eof Do
        Begin
        //*** Atualiza a Barra de Progresso ***
        Registro_Atual          := Registro_Atual + 1;
        Qtde_Barra              := Round((Registro_Atual * 100) / Total_Registros);
        TempoProgresso.Position := Qtde_Barra;
        TempoProgresso.Refresh;

        //*** Prepara o N� do Produto ***
        vXMLproduto := vXMLno.AddChild('produto');
        vXMLno.ChildNodes.Last.Attributes['nItem'] := IntToStr(Registro_Atual);

        vXMLproduto.AddChild('barra').NodeValue := Trim(ConexaoBD.SQL_Comunitario.FieldByName('Produto_Cod_Barra').Text);
        vXMLproduto.AddChild('preco').NodeValue := Trim(ConexaoBD.SQL_Comunitario.FieldByName('Produto_Preco_Varejo').Text);

        If StrToInt(Trim(ConexaoBD.SQL_Comunitario.FieldByName('Produto_Estoque_Atual').Text)) <= 0 Then
           Begin
           vXMLproduto.AddChild('estoque').NodeValue := '0';
           End
        Else
           Begin
           vXMLproduto.AddChild('estoque').NodeValue := Trim(ConexaoBD.SQL_Comunitario.FieldByName('Produto_Estoque_Atual').Text);
        End;

        ConexaoBD.SQL_Comunitario.Next;
  End;

  vXMLDoc.SaveToFile('C:\Atualiza_Site\estoque_colaborador.xml');
  vXMLDoc.Free;

  //*** Envia os E-Mails ***
  IdMessage.MessageParts.Clear;

  IdSMTP.Host     := Trim('');
  IdSMTP.Username := Trim('');
  IdSMTP.Password := Trim('');

  IdMessage.From.Address := Trim('');
  IdMessage.From.Name    := Trim('');
  IdMessage.From.Text    := Trim('');

  IdMessage.Recipients.EMailAddresses := Trim('');

  IdMessage.CCList.EMailAddresses := '';
  IdMessage.BccList.EMailAddresses := '';
  IdMessage.Priority := mpNormal;
  IdMessage.Subject := Trim('Vida Perfeita: ' + DateToStr(Date) +  ' - Atualiza��o do Estoque para os Colaboradores.');

  If FileExists('C:\Atualiza_Site\estoque_colaborador.xml') Then
     Begin
     TIdAttachment.create(IdMessage.MessageParts, TFileName('C:\Atualiza_Site\estoque_colaborador.xml'));
     End
  Else
     Begin
     MSG_Erro('Erro do Anexo XML, por favor verifique!!!');
  End;

  IdMessage.Body.Clear;
  IdMessage.Body.Add('Atualiza��o do Estoque: Data ' + DateToStr(Date) + '.');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('Segue anexo o arquivo XML de nome (estoque_colaborador.xml) para atualiza��o do Estoque.');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('Atenciosamente,');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('Sitema de gerenciamento');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('--');
  IdMessage.Body.Add('Vida Perfeita');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('Fone/Fax: (0xx11) 4238-3732');
  IdMessage.Body.Add('WebSite: http://www.vidaperfeita.com.br');
  IdMessage.Body.Add('E-Mail: vidaperfeita@vidaperfeita.com.br');

  IdSMTP.Connect;
  Try
     Try
        IdSMTP.Send(IdMessage);
     Except
        MSG_Erro('Erro de envio do Estoque aos Colaboradores, por favor verifique!!!');
     End;
  Finally
     IdSMTP.Disconnect;
  End;

  Seta();

  MSG_Erro('O arquivo XML para atualiza��o do Estoque dos Colaboradores foi enviado!');

  EnviarEstoque00.Close;
end;

end.
