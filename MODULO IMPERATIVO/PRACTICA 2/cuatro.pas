program cuatro;
type

lista = ^nodo;

nodo =  record
	dato:integer;
	sig:lista;
	end;

procedure agregaradelante (var l:lista; v:integer);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:=v;
	nuevo^.sig:=nil;
	if (l = nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:=nuevo;
		end;
	
end;

procedure cargarlista (var l:lista);
var
v:integer;
begin
	writeln ('ingrese el numero'); readln (v);
		while ( v <> 0) do
		begin
			agregaradelante (l,v);
			writeln ('ingrese numero'); readln (v);
		end;
end;

procedure binario (num:integer);
begin
	if (num <> 0)then
	begin
		binario (num div 2);
		write (num mod 2);
	end;
end;

procedure recorrerlista(l:lista);
begin
	while (l <>nil)do
	begin
		writeln ('el numero es ');
		
		binario(l^.dato);
		
		writeln ('         ' );
		l:= l^.sig;
	end;
end;


var
l:lista;
begin
l:= nil;
cargarlista(l);
recorrerlista(l);
end.
