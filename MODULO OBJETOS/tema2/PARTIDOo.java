/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;
public class PARTIDOo {
    public static void main (String[]args){
        Partido [] vec = new Partido [20];
        int diml =0;
        System.out.println("INGRESE NOMBRE DEL EQUIPO visitante");
        String nombreVisitante =Lector.leerString();
        while (!nombreVisitante.equals("ZZZ") && (diml <20)){
            System.out.println("Ingrese cantidad de goles");
            int golesVisitante = Lector.leerInt();
            System.out.println("NOMRBE DEL local");
            String nombreLocal= Lector.leerString();
            System.out.println("CANTIDAD DE GOLES");
            int golesLocal = Lector.leerInt();
            vec[diml]=new Partido(nombreLocal,nombreVisitante,golesLocal,golesVisitante);
            diml++;
             System.out.println("INGRSE NOMBRE DEL EQUIPO VISITANTE");
             nombreVisitante=Lector.leerString();
        }
    int i;
    int ganoRiver= 0;
    int golesBoca = 0;
    for (i=0;i<diml;i++){
     System.out.println(vec[i].getLocal()+"[" +vec[i].getGolesLocal()+"] |VS| "+vec[i].getVisitante()+"[ "+vec[i].getGolesVisitante()+"]");
     if (vec[i].getGanador().equals("RIVER"))
         ganoRiver++;
     if (vec[i].getVisitante().equals("BOCA")){
         golesBoca+=vec[i].getGolesVisitante();
     }
    }
    System.out.println("RIVER GANO =" + ganoRiver);
    System.out.println("BOCA METIO" + golesBoca);
    }
}

    
 