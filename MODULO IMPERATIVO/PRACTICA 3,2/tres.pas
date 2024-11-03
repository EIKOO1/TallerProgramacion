{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó. //PREGUNTAR
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program EJERCICIOBIBLIOTECA;

type

prestamo = record
num:integer;
dia:integer;	//lo q se lee;
mes:integer;
cant:integer;
end;


biblioteca = record
isbn:integer;
pre:prestamo;
end;

lista = ^nodo;

nodo= record
	dato:prestamo;
	sig:lista;
	end;

biblio = record
isbn:integer;
p:lista;
end;

	
arbol2 = ^nodo2;

nodo2 =record
	dato:biblio;	
	hi:arbol2;
	hd:arbol2;
	end;
	
	
//------------------------------------------------------

arbol = ^nodoa;

nodoa = record
	dato:biblioteca;
	hi:arbol;
	hd:arbol;
	end;



procedure agregar (var a:arbol;b:biblioteca);
var
aux:arbol;
begin
	if (a = nil)then
	begin
		new (aux);
		aux^.dato:=b;
		aux^.hi:=nil;
		aux^.hd:=nil;
		a:=aux;
	end
	else
		if (a^.dato.isbn > b.isbn)then
			agregar (a^.hi,b)
		else
			agregar(a^.hd,b);
end;

procedure ingresardatos (var b:biblioteca);
begin
	Writeln ('INGRESE ISBN');readln (b.isbn);
	if (b.isbn <> 0)then
	begin
		writeln ('INGRESE NUMERO DE SOCIO'); readln (b.pre.num);
		writeln ('DIA'); readln (b.pre.dia);
		writeln ('MES'); readln (b.pre.mes);
		writeln ('CANTIDAD DE DIAS PRESTADOS');readln (b.pre.cant);
	end;
end;

procedure agregaradelante  (var l:lista;b:prestamo);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:= b;
	nuevo^.sig:=nil;
	if (l <>nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:= l;
			l:=nuevo;
		end;
end;

procedure agregar2 (var a2:arbol2;b:biblioteca);
var
aux:arbol2;
begin
	if (a2 = nil )then
		begin
			new(aux);
			aux^.dato.isbn:= b.isbn;
			aux^.dato.p:=nil;	
			agregaradelante(aux^.dato.p,b.pre);
			aux^.hi:= nil;
			aux^.hd:=nil;
			a2:=aux;		
		end
	else
		begin
		if (a2^.dato.isbn = b.isbn)then
			agregaradelante(a2^.dato.p,b.pre)
		else
			if (a2^.dato.isbn > b.isbn)then
				agregar2 (a2^.hi,b)
			else
				agregar2 (a2^.hd,b);
end;
end;

	
procedure cargararbol (var a:arbol;var a2:arbol2);
var
b:biblioteca;
begin
	ingresardatos(b);
		while (b.isbn <>0)do
			begin
				agregar (a,b);
				agregar2 (a2,b);
				ingresardatos(b);
			end;
end;

procedure isbnmasgrande (a:arbol);
begin
		if (a<>nil)then
			begin
			isbnmasgrande(a^.hd);
			if (a^.hd =  nil)then
				writeln ('el isbn mas grande es ', a^.dato.isbn);
			end;
		end;
procedure imprimirarbol (a:arbol);
begin
		if (a <>nil)then
		begin
		imprimirarbol(a^.hd);
		writeln (a^.dato.isbn);
		imprimirarbol(a^.hi);
		end;
end;
procedure imprimirarbol (a:arbol2);
begin
		if (a <>nil)then
			begin
				imprimirarbol(a^.hd);
				writeln (a^.dato.isbn);
				imprimirarbol(a^.hi);
			end;
end;
procedure isbnmaschico (a2:arbol2);
begin
	if (a2 <>nil)then
		begin
			isbnmaschico(a2^.hi);
			if (a2^.hi = nil)then
				writeln ('el mas chico es = ',a2^.dato.isbn);
		end;
end;
procedure buscarsocio (a:arbol;v:integer;var cant:integer);
begin
	if (a <>nil)then
		begin
			buscarsocio (a^.hd,v,cant);
				if (a^.dato.pre.num = v)then
					cant:=cant+1;
			buscarsocio(a^.hi,v,cant);
		end;
	
end;

function buscarsocio (a:arbol;v:integer):integer;
var
cant:integer;
begin
end;

var
a:arbol;
a2:arbol2;
v:integer;
cant:integer;
begin
a:=nil;
a2:=nil;
cant:=0;
cargararbol(a,a2);
isbnmasgrande(a);
imprimirarbol(a2);
isbnmaschico(a2);
writeln ('ingrese numero de socio'); readln (v);
buscarsocio(a,v,cant);
writeln ('cantidad de prestamos es ',cant);

end.
