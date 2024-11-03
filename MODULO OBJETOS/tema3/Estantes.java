/*
A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?

 */
package tema3;

public class Estantes { 
    private int diml=0;
    private Libro[]vec ;

    public Estantes() { 
       this.vec=  new Libro [20];         
    }
    
    public int getDiml(){
        return this.diml;
    }
    public boolean lleno (){
      return diml<20; 
    }
    public void agregarLibro (Libro l){
        if (lleno()){
            vec[diml]=l;
            System.out.println("LO AGREGE PAPI mira");
            System.out.println (vec[diml].getTitulo());
        diml++;
        }
        else
            System.out.println("El estante esta lleno");
        }
    public Libro BuscarLibro(String nombre){
        int i=0;
       while ((i<diml)&&(!(vec[i].getTitulo().equals(nombre))))
           i++;
       
       if ((i < diml)&&(vec[i].getTitulo().equals(nombre)))
           return vec[i];
       else
           return null;
                   }

    public String MostrarLibro(){
        int i;
        
        for (i=0;i<diml;i++){
            System.out.println("EL LIBRO TITULO " +vec[i].getTitulo());   
        }
          return "Ya esta la lista" ;
    }
    }


    
    
    

