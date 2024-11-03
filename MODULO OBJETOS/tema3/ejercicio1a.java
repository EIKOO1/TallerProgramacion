/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio1a {
    public static void main (String [] args){
         
        System.out.println("INGRESE LADO 1");
        double lado1=Lector.leerDouble();
        System.out.println("INGRESE LADO 2");
        double lado2=Lector.leerDouble();
        System.out.println("INGRESE LADO 3");
        double lado3 = Lector.leerDouble();
        System.out.println("INGRESE COLOR DE RELLENO");
        String relleno = Lector.leerString();
        System.out.println("INGRESE COLOR DE LINEA");
        String linea = Lector.leerString();
        triangulos t = new triangulos(lado1,lado2,lado3,relleno,linea);
        System.out.println("EL AREA ES = " + t.calcularArea());
        System.out.println("EL PERIMETRO ES = "+ t.calcularPerimetro());
  
    
}
}
