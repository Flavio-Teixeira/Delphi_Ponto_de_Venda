{------------------------------------------------- 
 Arquivo para uso da DLL GHDL32 com o Delphi
--------------------------------------------------}

unit GHDL32;

interface

const
{ Portas }
	GAVETA_COM1	= 1;
	GAVETA_COM2	= 2;
	GAVETA_COM3	= 3;
	GAVETA_COM4	= 4;
{ Funções }
	GAVETA_INICIALIZA	= 1;
	GAVETA_ABRE			= 2;
	GAVETA_ESTADO		= 3;

{ Códigos de retorno }
	GAVETA_OK		= 0;
	GAVETA_FECHADA	= 1;
	GAVETA_ABERTA	= 2;
{ Códigos de retorno com erro }
	GAVETA_NAO_INICIALIZADA	= -1;
	GAVETA_PORTA_INVALIDA	= -2;
	GAVETA_FUNCAO_INVALIDA	= -3;

function DriverGaveta(func, porta : Integer) : Integer; stdcall;
procedure GavetaConfigura(tpulso, tmin : Integer); stdcall;

implementation

function DriverGaveta; stdcall; external 'GHDL32';
procedure GavetaConfigura; stdcall; external 'GHDL32';
                                    

end.
