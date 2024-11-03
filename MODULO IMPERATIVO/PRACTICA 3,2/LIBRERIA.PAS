{Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.
}

program libreria;
type

producto = record
	cod:integer;
	cant:integer;
	monto:real;
	end;
arbol = ^nodo;

nodo = record
	dato:producto;
	hi:arbol;
	hd:arbol;
	end;

venta = record
	codventa:integer;
	codp:integer;
	cantu:integer;
	unidad:real;
	end;
	
procedure ingresarventa (var v:venta);
begin
	writeln ('INGRESE CODIGO DE VENTA'); readln (v.codventa);
		if (v.codventa <> -1)then
			begin
			writeln ('INGRESE COD PRODUCTO');readln (v.codp);
			writeln ('CANTIDAD DE UNIDADES VENDIDAS'); readln (v.cantu);
			writeln ('PRECIO POR UNIDAD');readln(v.unidad);
			end;
end;
procedure inicializar(var p:producto);
begin
	p.cant:=0;
	p.monto:=0;
end;
procedure sumarproducto (var p:producto; v:venta);
begin
	p.cant:= p.cant+v.cantu;
	p.monto:= p.monto+ (v.cantu * v.unidad);
end;

procedure agregar (var a:arbol;v:venta);
var
aux:arbol;
begin
	if (a = nil)then
		begin
			new (aux);
			inicializar(aux^.dato);
			aux^.dato.cod:=v.codp;
			sumarproducto(aux^.dato,v);
			aux^.hi:=nil;
			aux^.hd:=nil;
			a:=aux;
		end
	else
		begin
			if (a^.dato.cod =  v.codp)then
				sumarproducto (aux^.dato,v)
			else
				if (a^.dato.cod > v.codp)then
					agregar(a^.hi,v)
				else
					agregar(a^.hi,v);
		end;
end;

procedure cargararbol (var a:arbol);
var
v:venta;
begin
	ingresarventa (v);
		while (v.codventa <> -1)do
			begin
				agregar (a,v);
				ingresarventa(v);
			end;
end;

procedure mostrarcontenido(p:producto);
begin

	writeln('EL CODIGO DE PRODUCTO ES =',p.cod);
	writeln ('CANTIDAD = ',p.cant);
	writeln ('MONTO',(p.monto):2:2);
end;

procedure imprimir(a:arbol);
begin
	if(a<>nil)then
	begin
		imprimir(a^.hd);
		mostrarcontenido(a^.dato);
		imprimir(a^.hi);
	end;
end;
procedure maxventa (a:arbol;var max:integer;var codmax:integer);
begin
	if (a <>nil)then
		begin
			maxventa(a^.hd,max,codmax);
			if (a^.dato.cant > max)then
				begin
					max:=a^.dato.cant;
					codmax:=a^.dato.cod;
				end;
			maxventa(a^.hi,max,codmax);
		end;
end;


procedure cantidadcodigo (a:arbol;v:integer;var cant:integer);
begin
	if (a^.dato.cod = v)then
		cantidadcodigo(a,v,cant);
	if (a<>nil)then
	begin
		cantidadcodigo(a^.hi,v,cant);
		if (a^.dato.cod < v)then		
		cant:=cant+1;
		cantidadcodigo(a^.hd,v,cant);
	end;
end;

procedure montototal (a:arbol;min,max:integer;var mont:real);
begin
	if (a <>nil)then
		begin
			if (a^.dato.cod > min)and (a^.dato.cod < max)then
			begin
				montototal(a^.hd,min,max,mont);
				mont:=mont+ a^.dato.monto;
				writeln (mont);
				montototal(a^.hi,min,max,mont);
			end;	
		end;
end;
var
a:arbol;
codmax:integer;
v:integer;
cant:integer;
max:integer;
min:integer;
montot:real;
begin
	a:=nil;cant:=0;max:=-1;montot:=0;			
	cargararbol (a);
	imprimir (a);
	maxventa(a,max,codmax);
	writeln ('el codigo maximo es ', codmax);
	writeln ('INGREsE UN VALOR');readln(v);
	cantidadcodigo(a,v,cant);
	writeln ('la cantidad de codigos menores a ',v, ' es = ',cant);	
	writeln ('INGRESE EL RANGO MINIMO');readln (min);
	writeln ('INGRESE EL RANGO MAXIMO');readln (max);
	montototal(a,min,max,montot);
	writeln ('EL MONTO ES',montot);
end.
