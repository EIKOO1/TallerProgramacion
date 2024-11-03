program dos;

type
	fecha =  record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	
	//------------------------------------------------//
	venta = record
		cod:integer;
		f:fecha;
		cant:integer;
	end;

	arbol1 =  ^nodo1;			//arbol1 con todos los campos

	nodo1= record
		dato:venta;
		hi:arbol1;
		hd:arbol1;
	end;
	//-----------------------------------------//
	venta2= record
		cod:integer;
		cant:integer;
	end;
	arbol2 = ^nodo2;
								//arbol 2 con codigo y cantidad de produtos
	nodo2= record
		dato:venta2;
		hi:arbol2;
		hd:arbol2;
	end;
	//--------------------------------------------//
	ventaslista = record
		fec:fecha;
		cant:integer;
	end;
	
	lista =  ^nodo;			//listas de ventas
	
	nodo = record
		dato:ventaslista;
		sig:lista;
	end;
	
	venta3 =record
		cod:integer;
		ventas:lista;
	end;
						
	arbol3 = ^nodo3;			//ARBOL 3 CON LISTAS DE VENTAS
	
	nodo3=record
		dato:venta3;
		hi:arbol3;
		hd:arbol3;
	end;
 //------------------------------------------------------------//
procedure cargarArbol1(var a1:arbol1; v:venta);
var
aux:arbol1;
begin
	if(a1 = nil)then
		begin
			new (aux);	
			aux^.dato:=v;
			aux^.hi:= nil;
			aux^.hd:=nil;
			a1:=aux;
		end
	else
		if (a1^.dato.cod > v.cod)then
			cargarArbol1(a1^.hi,v)	//cargo por la izquierda
		else
			cargarArbol1(a1^.hd,v);	//cargo por la derecha
end;
 
procedure cargarArbol2 (var a2:arbol2; v:venta);
var
aux:arbol2;
begin
	if (a2 = nil)then
		begin
		new (aux);
		aux^.dato.cod:=v.cod;
		aux^.dato.cant:=v.cant;
		aux^.hi:=nil;
		aux^.hd:=nil;
		a2:=aux					//tengo que cargar solamente el codigo y cantidad 
		end
	else
		if (a2^.dato.cod > v.cod)then
			cargarArbol2 (a2^.hi,v)
		else
			cargarArbol2 (a2^.hd,v);
end;
procedure agregaradelante (var l:lista;v:venta);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato.fec:= v.f;
	nuevo^.dato.cant:= v.cant;
	nuevo^.sig:= nil;
	if (l = nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:=nuevo;
		end;
end;

procedure cargarArbol3(var a3:arbol3;v:venta);
var
aux:arbol3;
begin
	if (a3 = nil)then
		begin
		new (aux);
		aux^.dato.cod:= v.cod;
		agregaradelante(aux^.dato.ventas,v);
		aux^.hi:=nil;
		aux^.hd:=nil;
		a3:=aux;
		end
	else
		if (a3^.dato.cod > v.cod)then
			cargarArbol3(a3^.hi,v)
		else
			cargarArbol3(a3^.hd,v);
end;

procedure generarfecha (var f:fecha);
begin
f.dia:= random (32)+1;
f.mes:= random (13)+1;				//genera fechas aleatorias
f.anio:= random (2024-2000+1)+2000;
end;

procedure generarventa (var v:venta);
begin
	v.cod := random (10000);			//GENERA VENTAS
	generarfecha(v.f);
	v.cant:=(10000);

end;
 
procedure generararboles(var a1:arbol1;var a2:arbol2;var a3:arbol3); 
 var
 v:venta;
 begin 
	generarventa(v); //genero la venta
	while (v.cod <> 0)do
		begin
			cargarArbol1(a1,v);
			cargarArbol2(a2,v);
			cargarArbol3(a3,v);
			generarventa(v);
		end;
 end;
 
procedure ingresarfecha(var fe:fecha);
begin
	writeln ('ingrese dia');readln (fe.dia);
	writeln ('ingrese mes');readln (fe.mes);
	writeln ('ingrese anio');readln (fe.anio);
end;

procedure buscarfecha(a1:arbol1;fe:fecha;var cantf:integer);
begin
	if (a1 <> nil)then
		begin
			buscarfecha(a1^.hd,fe,cantf);
			if (a1^.dato.f.dia= fe.dia)and(a1^.dato.f.mes= fe.mes)and (a1^.dato.f.anio= fe.anio)then
				cantf:=cantf+1;
			buscarfecha(a1^.hi,fe,cantf);
		end;
end;
 
 
 var
 a1:arbol1;
 a2:arbol2;
 a3:arbol3;
 fe:fecha;
 cantf:integer;
 begin
a1:= nil; a2:= nil; a3:=nil;
writeln ('gogogo');
generararboles(a1,a2,a3);
writeln ('hola');
ingresarfecha(fe);
cantf:=0;
writeln ('llegue vivo');
buscarfecha(a1,fe,cantf);
writeln ('la cantidad de productos vendidos es =' ,cantf);
 end.
