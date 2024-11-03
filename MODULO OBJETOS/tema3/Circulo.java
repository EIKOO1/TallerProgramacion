/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Condo
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
   
    public double getRadio (){
        return radio;
    }
    public void setRadio (double unRadio){
        this.radio = unRadio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    public double calcularPerimetro(){
        return (2*(Math.PI))*radio;
    }
    public double CalcularArea(){
        return (Math.PI)*radio*radio;
    }
}
