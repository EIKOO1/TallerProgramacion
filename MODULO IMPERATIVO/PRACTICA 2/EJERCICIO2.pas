{.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrar}

program dos;
type

lista = ^nodo;

nodo = record
	dato:integer;
	sig:lista;
	end;


procedure agregaradelante (var l:lista;ale:integer;var ult:lista);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:= ale;
	nuevo^.sig:=nil;
	if (l = nil)then
		begin
			l:=nuevo;
			ult:=nuevo;
		end
	else
		begin
			ult^.sig:=nuevo;
			ult:=nuevo;

		end;
end;

procedure cargarlista (var l:lista;var ult:lista);
var
ale:integer;
begin
	ale:= random (200 -100+1)+100;
		if (ale = 100) then
			agregaradelante (l,ale,ult)
		else
			begin				//inciso a
				agregaradelante(l,ale,ult);
				cargarlista(l,ult);
			end;
end;


procedure mostrarlistainverso(l:lista);
begin
	if (l <> nil)then
		begin
			mostrarlistainverso(l^.sig);		//inciso c
			writeln (l^.dato);
		end;
end;

procedure mostrarlista(l:lista);
begin
	if (l <> nil)then
		begin							//inciso B
			writeln(l^.dato);
			mostrarlista(l^.sig);
		end;
end;
procedure buscarmin (l:lista; var min:integer);
begin
	if (l <>nil)then
		begin
			if (l^.dato < min)then
				min:=l^.dato;				//incido D
		buscarmin(l^.sig,min);
		end;
end;


function buscarvalor (l:lista;v:integer):boolean;
var
ok:boolean;	
begin
	ok:= false;
	if (l <> nil) and ( ok <> true)then 
		begin
			if (l^.dato <> v)then
				ok:=true
			else
				buscarvalor (l^.sig,v);
		end;
	buscarvalor := ok;
end;



var
l:lista;
ult:lista;
min:integer;
valor:integer;
begin
	min:= 201;
	randomize;
	cargarlista (l,ult);
	writeln('--------ORDEN INVERSO------------');
	mostrarlistainverso (l);
	writeln ('--------ORDEN NORMAL-----------');
	mostrarlista(l);
	buscarmin(l,min);
	writeln ('EL MINIMO ES ', min);
	writeln ('Ingrese el valor que desea buscar'); readln (valor);
		if (buscarvalor (l,valor) =  true) then
			writeln ('esta en la lista')
		else
			writeln ('NO TA');
	
end.
