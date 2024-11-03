
program programalistas.pas;

type


lista =  ^nodo;

nodo = record
dato:integer;
sig:lista;
end;

procedure agregaradelante(var l:lista;ale:integer);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:=ale;
	nuevo^.sig:=nil;
	if (l = nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:=nuevo;
		end;
end;






procedure CargarLista (var l:lista);
var
ale:integer;
begin
	ale:=random(150-110+1)+110;
	while (ale <> 120 ) do
	begin
		agregaradelante(l,ale);
		ale:=random(150-110+1)+110;
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

function BuscarElemento(l:lista;v:integer):boolean;
var
ok:boolean;
aux:lista;
begin
	aux:=l;
	ok:=false;
	while (aux <>nil) and (ok = false) do
	begin
	if (aux^.dato = v)then
		ok:= true
	else
		aux:= aux^.sig;
	end;
	BuscarElemento:=ok;
end;


var
l:lista;
v:integer;
begin
	l:=nil;
	randomize;
	CargarLista(l);
	ImprimirLista(l);
	writeln (' que valor desea buscar');readln (v);
	if (BuscarElemento(l,v)) then
		writeln ('encontre el elemento')
	else
		writeln ('no ta uacho');
end.


