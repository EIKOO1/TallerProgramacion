/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
import PaqueteLectura.Lector;

public class Ejercicio5 {
    
    public static void main (String[]args){
    int [][] matriz = new int [5][4];
    int i,j,calificacion;
    for (i=0;i<5;i++){
        j=0;
        System.out.println("Ingrese calificacion de atencion al cliente");
        matriz[i][j]=Lector.leerInt();
        System.out.println("Ingrese calidad ");
        j++;
        matriz[i][j]=Lector.leerInt();
        System.out.println("precio");
        j++;
        matriz[i][j]=Lector.leerInt();
        System.out.println("Ambiente");  
        j++;
        matriz[i][j]=Lector.leerInt();
        for (i=0;i<5;i++){
            for (j=0;j<4;j++){
                System.out.println ("Ingrese calificacion de categoria"+j);
                 matriz[i][j]=Lector.leerInt();
            }
        }
       }
    int suma;
    for (j=0;j<4;j++){
        suma = 0;
        for (i=0;i<5;i++){
            suma=+suma+matriz[i][j];
            }
    System.out.println("en la categoria" +j+ "La suma es =" + suma/5.0 );

        }
    for (i=0;i<5;i++){
        System.out.println(" CLIENTE NUMERO"+(i+1));
        for (j=0;j<4;j++)
            System.out.print("|"+matriz[i][j]);
        System.out.println( "-----------------  ");
    }
    }
           
    }
