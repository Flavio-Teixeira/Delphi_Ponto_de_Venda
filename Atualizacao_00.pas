unit Atualizacao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, xmldom, XMLIntf, msxmldom,
  XMLDoc, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP;

type
  TAtualizacao00 = class(TForm)
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
  Atualizacao00: TAtualizacao00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TAtualizacao00.BT_SairClick(Sender: TObject);
begin
  Atualizacao00.Close;
end;

procedure TAtualizacao00.BT_IncluirClick(Sender: TObject);

var
  Total_Registros, Registro_Atual, Qtde_Barra: Integer;
  vXMLDoc: TXMLDocument;
  vXMLno, vXMLproduto: IXMLNode;

begin
  Ampulheta();

  BT_Incluir.Enabled := False;
  BT_Sair.Enabled    := False;

  //*** Apaga o XML antigo ***
  If FileExists('C:\Atualiza_Site\atualizacao.xml') Then
     Begin
     DeleteFile('C:\Atualiza_Site\atualizacao.xml');
  End;

  //*** Obtem a Quantidade de Registros dos Produtos ***
  ConexaoBD.SQL_Comunitario.Close;
  ConexaoBD.SQL_Comunitario.SQL.Clear;
  ConexaoBD.SQL_Comunitario.SQL.Add('SELECT count(Produto_Codigo) AS Total_Registros FROM Produtos');
  ConexaoBD.SQL_Comunitario.Open;

  Total_Registros := StrToInt(ConexaoBD.SQL_Comunitario.FieldByName('Total_Registros').Text);
  Registro_Atual  := 0;
  Qtde_Barra      := 0;

  //*** Seleciona os Produtos ***
  ConexaoBD.SQL_Comunitario.Close;
  ConexaoBD.SQL_Comunitario.SQL.Clear;
  ConexaoBD.SQL_Comunitario.SQL.Add('SELECT Produto_Codigo, Produto_Preco_Varejo, Produto_Estoque_Atual FROM Produtos ORDER BY Produto_Codigo');
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

        vXMLproduto.AddChild('barra').NodeValue := Trim(ConexaoBD.SQL_Comunitario.FieldByName('Produto_Codigo').Text);
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

  vXMLDoc.SaveToFile('C:\Atualiza_Site\atualizacao.xml');
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
  IdMessage.Subject := Trim('Vida Perfeita: ' + DateToStr(Date) +  ' - Atualiza��o do E-Commerce.');

  If FileExists('C:\Atualiza_Site\atualizacao.xml') Then
     Begin
     TIdAttachment.create(IdMessage.MessageParts, TFileName('C:\Atualiza_Site\atualizacao.xml'));
     End
  Else
     Begin
     MSG_Erro('Erro do Anexo XML, por favor verifique!!!');
  End;

  IdMessage.Body.Clear;
  IdMessage.Body.Add('Atualiza��o do E-Commerce: Data ' + DateToStr(Date) + '.');
  IdMessage.Body.Add('');
  IdMessage.Body.Add('Segue anexo o arquivo XML para atualiza��o do E-Commerce.');
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
        MSG_Erro('Erro de envio da Atualiza��o, por favor verifique!!!');
     End;
  Finally
     IdSMTP.Disconnect;
  End;

  Seta();

  MSG_Erro('O arquivo XML para atualiza��o do site foi gerado e enviado por e-mail, ele tamb�m se encontra na pasta: "C:\Atualiza_Site\atualizacao.xml", caso queira atualizar o site, acesse a �rea administrativa do site e importe o arquivo.');

  Atualizacao00.Close;
end;

end.
