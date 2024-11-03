{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}
program tres;
const
dimf = 20;

type
indice =  1..dimf;
vector = array[1..dimf] of integer;

procedure cargarvector (var v:vector;dimf:integer);
var
ale:integer;
begin
ale:= random (1550- 300+1)+300;
	if (dimf > 0 )then
		begin
			v[dimf]:= ale;
			cargarvector (v,dimf-1);
		end;
end;
procedure mostrarvector (v:vector;dimf:integer);

begin
	if (dimf > 0 )then
	begin
		writeln (v[dimf]);
		mostrarvector(v,dimf-1);
	end;
end;
procedure ordenarvector (var v:vector);
var
i,j,actual:integer;
begin
	for i := 2 to dimf do
		begin
			actual:=v[i];
			j:= i-1;
			while (j > 0 ) and (v[j] > actual)do
			begin
				v[j+1]:= v[j];
				j:=j-1;
			end;
			v[j+1]:= actual;
		end;
end;

Procedure busquedaDicotomica (v: vector;var ini,fin: indice; dato:integer; var pos: indice);
var
medio:integer;
begin
pos:=-1;
ini:= 1;
fin:=dimf;
medio:= (ini +fin) div 2;
while (ini <= fin) and (dato <> v[medio])do
	begin
		if (dato < v[medio])then
			fin := medio-1
		else
			ini:=medio+1;
	medio:= (ini+fin) div 2;
	end;
if (ini <= fin) and (dato = v[medio])then
	pos:= medio;
end;
var
v:vector;
pos,ini,fin:indice;
dato:integer;

begin
	randomize;
	cargarvector (v,dimf);
	mostrarvector (v,dimf);
	ordenarvector (v);
	writeln ('-----------vector ordenado-----------');
	mostrarvector (v,dimf);
	writeln ('ingrese el valor que desea buscar');readln (dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	writeln (pos);
end.

