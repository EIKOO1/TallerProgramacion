program libreria;
const 
dimf = 30;
finrubro=8;
type
rubro = 1..finrubro;
producto = record
	cod:integer;
	codrubro:rubro;
	precio:real;
	end;

lista = ^nodo;

nodo = record
	dato:producto;
	sig:lista;
	end;

vector = array [rubro] of lista;
vector30= array [1..dimf] of producto;


procedure inicializarvec (var v:vector);
var
i:integer;
begin
	for i := 1 to finrubro do
		begin
			v[i]:= nil;
		end;
end;

procedure ingresarproducto (var p:producto);
begin
	writeln ('ingrese CODIGO');readln (p.cod);
	writeln('RUBRO');readln (p.codrubro);
	writeln ('PRECIO');readln(p.precio);
end;

procedure insertarordenado (var l:lista; p:producto);
var
nuevo,anterior,actual:lista;
begin
	new (nuevo);
	nuevo^.dato:= p;
	anterior:=l;
	actual:=l;
	while (actual <> nil)and(p.cod > actual^.dato.cod)do
		begin
			anterior:= actual;
			actual:=actual^.sig;
		end;
	if (actual = anterior)then
		begin
			l:=nuevo;
		end
	else	
		anterior^.sig:=nuevo;
	nuevo^.sig:=actual;		
end;

procedure cargarvector (var v:vector);
var
p:producto;
begin
	ingresarproducto (p);
	while (p.precio <> 0)do
		begin
			insertarordenado (v[p.codrubro],p);
			ingresarproducto (p);
		end;
end;
procedure mostrarproducto(l:lista);
begin
	while (l <> nil) do
		begin
			writeln (l^.dato.cod);
			l:=l^.sig;
		end;
end;
procedure mostrarv(v:vector);
var
i:integer;
begin
	for i := 1 to finrubro do
		begin
			mostrarproducto(v[i]);
		end;
end;



procedure cargarvector30(l:lista; var v2:vector30;var diml:integer);
begin
	diml:= 0 ;
	while (l <> nil) do
		begin
			diml:= diml+1;
			v2[diml]:=l^.dato;
			l:=l^.sig;
		end;
end;

procedure ordenarvector30 (var v2:vector30;diml:integer);
var
i,j:integer;
actual: producto;
begin
	for i := 2 to diml do
		begin
			actual:= v2[i];
			j:= i-1;
			while (j > 0) and (v2[j].precio > actual.precio)do
				begin
					v2[j+1]:= v2[j];
					j:= j-1;
				end;
			v2[j+1]:=actual;
		end;
end;
procedure 
var
v:vector;
v2:vector30;
diml:integer;

begin
inicializarvec(v);
cargarvector(v);
mostrarv(v);
cargarvector30(v[3],v2,diml);
mostrarv2(v2,diml);
end.
