/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

public class Hotel{
     private Habitaciones [] h;
     private int dimf = 15;

    public  Hotel(){
        h = new Habitaciones[dimf];
        int i;
        for (i=0;i<dimf;i++)      
            h[i]= new Habitaciones();
       
    }        
    public void cargarCliente(int num,Cliente cli){
        h[num]= new Habitaciones(cli);
    }
    
    public String toString (){
        int i ;
        for (i=0;i<dimf;i++){
            System.out.println("HABITACION= "+ (i+1) + "COSTO: "+ h[i].getCostoNoche()+"  "+ h[i].mostrarEstado()); 
            if (h[i].getEstado()==false){
                Cliente c = h[i].getCli();
                c.String();
            }
            System.out.println(" ");
        }
         return "termine";
}
}
    

