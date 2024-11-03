
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector; // paso 1

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double[]vector= new double [15]; //2 y 3
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        double promedio = 0;
        int cantJugadores = 0;
        int i ;
        int cantmayores = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i= 0;i<15;i++){
            vector[i] = Lector.leerDouble();
            cantJugadores++;
            promedio =promedio + vector[i];
            }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio =  promedio / 15.0;
        System.out.println ("el promedio es = " + promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i<15;i++){
             if (vector[i] >promedio)
                cantmayores++;
          }
       System.out.println(cantmayores);
        //Paso 9: Informar la cantidad.
    }
}







//EL SEÑOR