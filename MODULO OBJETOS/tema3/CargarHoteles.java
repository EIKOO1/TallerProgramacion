/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Condo
 */
public class CargarHoteles {
    public static void main (String []args){
        GeneradorAleatorio.iniciar();
         Hotel hotel1 =new Hotel();   
         System.out.println("INGRESE LA HABITACION A LA QUE DESEA HOSPEDARSE");
         int pieza = Lector.leerInt()-1;
         System.out.println("NOMBRE DEL CLIENTE ");
         String nombre = Lector.leerString();
         System.out.println("INGRESE DNI");
         int dni = Lector.leerInt();
         System.out.println("ingrese edad");
         int edad = Lector.leerInt();
         Cliente cli = new Cliente(nombre,dni,edad);
         Habitaciones h =new Habitaciones(cli);
         hotel1.cargarCliente(pieza, cli);
         hotel1.toString();
         
         
         
         
         
    }
}
