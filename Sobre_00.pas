unit Sobre_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TSobre00 = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Data_Final: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BT_Ok: TButton;
    procedure BT_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sobre00: TSobre00;

implementation

{$R *.dfm}

procedure TSobre00.BT_OkClick(Sender: TObject);
begin
     Sobre00.Close;
end;

procedure TSobre00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TSobre00.FormShow(Sender: TObject);
begin
     Data_Final.Caption := Copy(DateToStr(Date()),7,4);
end;

end.
