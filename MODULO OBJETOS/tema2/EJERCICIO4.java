/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

 import PaqueteLectura.GeneradorAleatorio ;
import PaqueteLectura.Lector;

public class EJERCICIO4{
public static void main (String[]args){
    Persona [][] per = new Persona[5][8];
    Persona lPersona = new Persona();
    int cupo=0;
    lPersona = new Persona();
    String nombre;
    int edad,dni;
    System.out.println("INGRESE UN NOMBRE");
    nombre= Lector.leerString();
       
    int [] vec = new int [5];
    int i;
    for (i=0;i<5;i++)
        vec[i]=0;
    while ((!nombre.equals("ZZZ"))&&(cupo <40)){
            System.out.println("INGRESE DNI");
            dni = Lector.leerInt();
            System.out.println("INGRESE EDAD");
            edad=  Lector.leerInt();
            System.out.println("INGRESE EL DIA EN EL QUE SE QUIERE PRESENTAR");
            int dia = Lector.leerInt()-1;
            if (vec[dia]<8){
                per[dia][vec[dia]]= new Persona(nombre,dni,edad);
                vec[dia]++;
                cupo++;}
            else
                System.out.println("NO HAY CUPOS ESTE DIA");                 
            System.out.println("INGRESE UN NOMBRE");
            nombre= Lector.leerString();      
    }
           
                       
    int j;
   /* for (i=0;i<5;i++){
        for (j=0;j<8;j++){
            if (per[i][j] != null)
                System.out.println("En el dia : " +(i+1)+"se registro :  "+per[i][j].getNombre()+"  TURNO  :"+(j+1));   
        }*/
    for (i=0;i<5;i++){
        System.out.println("---------");
        for (j=0;j<8;j++){
                
                System.out.print("|"+per[i][j]);
           
        }
        }
    }
}

