
{implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el cero.}


program vectores;
const
dimf = 50;

type

vector=array [1..dimf] of integer;

procedure Cargarvector (min,max:integer; var diml:integer;var v:vector);
var
ale:integer;
begin
	diml:= 0;
	ale:= random(max-min+1)+min;
	while (ale <> 0) and (diml < dimf)do		//inciso a
		begin
			diml:= diml+1;
			v[diml]:= ale;
			ale:= random(max-min+1)+min;
		end;
end;

procedure ImprimirVector (v:vector;diml:integer);
var
i:integer;
begin
 for i := 1 to diml do						//si quisiera mostrar en inverso invierto downto
	writeln (v[i]);				
end;

var
min,max,diml:integer;
v:vector;
begin
	randomize;
	writeln ('Ingrese un valor minimo');readln (min);
	writeln ('ingrese un valor maximo');readln (max);
	CargarVector(min,max,diml,v);
	ImprimirVector(v,diml);
end.
