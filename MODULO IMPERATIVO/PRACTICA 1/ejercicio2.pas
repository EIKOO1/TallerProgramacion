{- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}

program dos;

const
dimf = 300;

type

oficina = record
	cod:integer;
	dni:integer;
	valor:real;
end;

vector = array[1..dimf] of oficina;

procedure cargaroficina (var o:oficina);
begin
writeln ('ingrese codigo'); readln (o.cod);
	if (o.cod <> -1)then
	begin
		writeln ('DNI'); readln (o.dni);
		writeln ('Valor expensa');readln (o.valor);
	end;
end;


procedure CargarVector(var v:vector; var diml:integer);
var
o:oficina;
begin
	cargaroficina(o);
	while (o.cod <> -1)and ( diml < dimf)do
	begin
		diml:=diml+1;
		v[diml]:=o;
		cargaroficina(o);
	end;
end;

procedure ordenarvector(var v:vector;diml:integer);
var
i,j,pos:integer;
item:oficina;
begin
	for i := 1 to diml-1 do
	begin
	pos:= i;
	for j := i+1 to diml do
		if ( v[j].cod > v[pos].cod)then
		pos:= j;
	item:= v[pos];	
	v[pos]:= v[i];
	v[i]:= item;
	end;
end;

procedure mostrarvector (v:vector;diml:integer);
var
i:integer;
begin
for i := 1 to diml do
	begin
	writeln (v[i].cod);
	writeln (v[i].dni);
	writeln ((v[i].valor):0:0);
	writeln ('----------------');
	end;
end;

procedure insercion (var v:vector;diml:integer);
var
i,j:integer;
actual:oficina;
begin
	for i := 2 to diml do 
	begin
		actual:=v[i];
		j:=i-1;
		while (j>0) and (v[j].cod > actual.cod)do
		begin
			v[j+1]:= v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;




var
diml:integer;
v:vector;
begin
diml:= 0;
CargarVector(v,diml);
mostrarvector (v,diml);
{ordenarvector (v,diml);
mostrarvector (v,diml);}
insercion(v,diml);
mostrarvector (v,diml);



end.
