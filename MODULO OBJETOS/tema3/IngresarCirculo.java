/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author Condo
 */
public class IngresarCirculo {
    public static void main (String [ ] args){
        System.out.println("Ingrese radio del circulo");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese color de relleno");
        String colorR = Lector.leerString();
        System.out.println("Ingrese color de linea");
        String colorL = Lector.leerString();
        Circulo c = new Circulo(radio,colorR,colorL);
        System.out.println(c.calcularPerimetro());
        System.out.println(c.CalcularArea());
    }
    
}
