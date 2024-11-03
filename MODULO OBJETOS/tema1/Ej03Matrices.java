/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej03Matrices {
    public static void main(String[] args) { 
        //Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
       int [][] matriz = new int [5][5];
       int i,j;
       
       for (i=0;i<5;i++)
           for (j=0;j<5;j++)
               matriz [i][j] = GeneradorAleatorio.generarInt(31);
               
              
        //Paso 4. mostrar el contenido de la matriz en consola
         for (i=0;i<5;i++){
             System.out.println("|");
             for (j=0;j<5;j++)
                  System.out.print("|" + matriz[i][j]);
         }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int fila = 1;
        int suma =0;
        for (j=0;j<5;j++){
            suma = suma+matriz[fila][j];
        }
        System.out.println("------");
        System.out.println("la suma de los elementos de la fila 1 es = " + suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
          int [] v = new int [5];
          
          for (j=0;j<5;j++){
              int sumacolumnas=0;
              for (i=0;i<5;i++){
                  sumacolumnas = sumacolumnas+matriz[i][j];
              }
              v[j] = sumacolumnas;
              
             }
          for (i=0;i<5;i++)
              System.out.println("En la columa" + i + "la suma es = " + v[i]);
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int valor = Lector.leerInt();
        boolean ok = false;
        int f = 0;
        int c = 0;
          for (i=0;i<5;i++){
              for (j=0;j<5;j++){
                 if (matriz[i][j] == valor){
                   f = i;
                   c = j;
                   ok = true;
                           }
              }
          }
        if (ok = false)
             System.out.println("no se encontro el elemento");
         else
            System.out.println("El elemento estaba en = " +"(" +  f +"," + c + ")");
}
}

    