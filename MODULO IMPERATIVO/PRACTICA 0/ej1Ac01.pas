program NumAleatorio;
const
dimf = 50;
type
vec = array [1..dimf] of integer;

procedure cargarvector (a,b:integer; var v:vec;var diml:integer);
var
ale:integer;
begin
	ale:= random (b-a+1)+a; 
		while ( ale <> 0)and (diml <dimf) do
		begin
		diml:= diml+1;
		ale:=random(b-a+1)+a;
		end;
end;


var
A,B:integer;
v:vec;
diml:integer;
begin
	diml:=0;
	randomize;
	writeln ('ingrese a');readln (a);
	writeln('ingrese b '); readln (b);
	cargarvector (a,b,v,diml);
end.
