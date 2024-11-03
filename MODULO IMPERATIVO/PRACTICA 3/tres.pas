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
}

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
	
	
procedure cargararbol (var a:arbol);
var
b:biblioteca;
begin
	ingresardatos(b);
		while (b.isbn <>0)do
			begin
				agregar (a,b);
				agregar2 (a,b);
				ingresardatos(b);
			end;
end;

var
a:arbol;
a2:arbol2;
begin
a:=nil;
cargararbol(a);
end.
