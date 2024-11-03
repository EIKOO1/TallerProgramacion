/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
   
     
    public static void main(String[] args) {
        Autor a =new Autor ("jabibi","hola","La plata");
       // Libro libro1= new  Libro( "Java: A Beginner's Guide",   
         //                        "Mcgraw-Hill", 2014,a, "978-0071809252", 21.72);
        Autor b = new Autor("john horton","no se","MarDelPlata");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing",b, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Autor c = libro2.getPrimerAutor();
        Libro libro3= new Libro(); 
        System.out.println(c.ToString());
        c= libro1.getPrimerAutor();
        System.out.println(c.ToString());
    }
    
}
  */
}