unit Splash_Screen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TSplashScreen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LBL_Registro_Status: TLabel;
    LBL_Registro: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreen: TSplashScreen;

implementation

{$R *.dfm}

procedure TSplashScreen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     SplashScreen := Nil;
end;

end.
