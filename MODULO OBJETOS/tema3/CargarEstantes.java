/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;
import tema3.Estantes;
import tema3.Libro;


/**
 *
 * @author Condo
 */
public class CargarEstantes {
    public static void main (String []args){
        Estantes e =  new Estantes();//genero estante vacio
    String titulo = Lector.leerString();
    while (!titulo.equals("ZZZ")&&(e.lleno())){
   Autor primerAutor;
   String nombre = Lector.leerString();
   String Biografia = Lector.leerString();
   String origen =  Lector.leerString();
   primerAutor =  new Autor (nombre,Biografia,origen);
   String editorial= Lector.leerString();
   int añoEdicion = Lector.leerInt();
   String ISBN = Lector.leerString();
   double precio = Lector.leerDouble();
   Libro l = new Libro (titulo,primerAutor,editorial,añoEdicion,ISBN,precio); 
   e.agregarLibro(l);
   System.out.println("INGRESE OTRO TITULO");
   titulo= Lector.leerString();    
    }
      System.out.println("INGRESE EL TITULO PARA BUSCAR");
     String titule = Lector.leerString();
     Libro li = e.BuscarLibro(titule);
     if (li != null)
          System.out.println(li.getTitulo());
          else
            System.out.println("NO ESTA ESE LIBRO EN ESTE ESTANTE");
     
   
     
      
      
    
    
    
   
}
}
