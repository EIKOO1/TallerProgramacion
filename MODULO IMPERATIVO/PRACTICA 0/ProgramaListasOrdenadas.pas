program listasordenadas;

type

lista = ^nodo;

nodo = record
	dato:integer;
	sig:lista;
end;

procedure insertarordenado (var l:lista;ale:integer);
var
anterior,actual,nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:=ale;
	anterior:=l;
	actual:=l;
	while (actual <> nil) and (ale > actual^.dato)do
	begin
		anterior:=actual;
		actual:= actual^.sig;
	end;
	if (anterior = actual)then
		l:= nuevo
	else
		anterior^.sig:=nuevo;
		
	nuevo^.sig:=actual;
end;


procedure CargarListaOrdenada (var l:lista);
var
ale:integer;
begin
	ale := random (150- 100+1)+100;
	while (ale <> 120 ) do
	begin
		insertarordenado(l,ale);
		ale := random (150- 100+1)+100;
	end;
end;

procedure ImprimirLista (l:lista);
var
aux:lista;
begin
	aux:=l;
	while (aux <> nil) do
	begin
		writeln (aux^.dato);
		aux:= aux^.sig;
	end;
end;

function BuscarElementoOrdenado(l:lista;v:integer):boolean;
var
ok:boolean;
aux:lista;
begin
	aux:=l;
	ok:=false;
	while (aux <> nil) and (aux^.dato < v) do
	begin
		aux:= aux^.sig;
	end;
	
	if (aux <> nil)and (aux^.dato = v) then
		ok:=true;
	BuscarElementoOrdenado:=ok;
end;


var
l:lista;
v:integer;
begin
	randomize;
	l:= nil;
	CargarListaOrdenada(l);
	ImprimirLista(l);
	Writeln ('Dame un valo');readln (v);
	if (BuscarElementoOrdenado(l,v))then
		writeln ('si si')
	else
		writeln ('saca');
end.








