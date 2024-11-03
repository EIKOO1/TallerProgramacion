{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program netflix;


type

genero = 1..8;

pelicula = record
	cod:integer;
	codgenero:genero;
	puntaje:real;
	end;
	
lista = ^nodo;

nodo = record
	dato:pelicula;
	sig:lista;
	end;
	
punteros = record
	pri:lista;
	ult:lista;
	end;
	
vector = array [genero] of punteros;
vectorcontador =array [genero] of real;

procedure inicializarvec (var v:vector);
var
 i:integer;
 begin
	for i := 1 to 8 do					//indico nil todas las direcciones
		begin
			v[i].pri:= nil;
		end;
 end;
 
procedure ingresarpelicula (var p:pelicula);
begin
	writeln ('INGRESE CODIGO DE PELICULA');readln (p.cod);
	if (p.cod <> -1) then
		begin
			writeln ('GENERO');readln (p.codgenero);
			writeln ('PUNTAJE'); readln (p.puntaje);
		end;
end;

procedure agregaratras (var l:punteros;p:pelicula);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:=p;
	nuevo^.sig:= nil;
	if (l.pri = nil)then
		begin
			l.pri:= nuevo;
			l.ult:=nuevo
		end
	else
		begin
			l.ult^.sig:= nuevo;
			l.ult:=nuevo;
		end;
end;

procedure cargarpelis (var v:vector);
var
p:pelicula;
begin
	ingresarpelicula(p);
	while (p.cod <> -1)do
		begin
			agregaratras(v[p.codgenero],p);
			ingresarpelicula(p);
		end;
end;
procedure mostrarlistageneros(l:lista);
begin
	while (l <> nil) do
		begin
			writeln ('CODIGO = ', l^.dato.cod);
			writeln ('PUNTAJE = ', (l^.dato.puntaje):2:2);
			l:= l^.sig;
		end;
end;
procedure mostrargeneros(v:vector);
var
i:integer;
begin
	for i := 1 to 8 do 
		begin
			writeln ('GENERO = ', i);
			mostrarlistageneros(v[i].pri);
			writeln ('--------------');
		end;
end;
function buscarmaxcod (l:lista):real;
var
max:real;
begin
	max:=-1;
	while (l <> nil)do
	begin
		if (l^.dato.puntaje >max)then
			begin
				max:=l^.dato.puntaje;
			end;
		l:= l^.sig;
	end;
	buscarmaxcod:=max;	
end;

procedure cargarvectorcontador (v:vector;var vc:vectorcontador);
var
i:integer;

begin
	for i:= 1 to 8 do
		begin
			vc[i]:= buscarmaxcod(v[i].pri);
		end;
end;

procedure mostrarvectorcontador(vc:vectorcontador);
var
i:integer;
begin
 for i := 1 to 8 do
	begin
		writeln ((vc[i]):2:2);
	end;
end;

procedure ordenarinsercion (var vc:vectorcontador);
var
i,j:integer;
actual:real;
begin
	for i := 2 to 8 do
		begin
			actual:= vc[i];
			j:= i-1;
			while (j > 0) and (vc[j] > actual)do
				begin
					vc[j+1]:= vc[j];
					j:= j-1;
				end;
		vc[j+1]:=actual;
		end;

end;

var

v:vector;
vc:vectorcontador;
begin
	inicializarvec (v);
	cargarpelis(v);
	mostrargeneros(v);
	cargarvectorcontador(v,vc);
	mostrarvectorcontador(vc);
	ordenarinsercion(vc);
end.










