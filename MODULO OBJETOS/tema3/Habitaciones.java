/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Condo
 */
public class Habitaciones {
    private double costoNoche;
    private boolean estado;
    private Cliente cli;
    public Habitaciones() {
        this.costoNoche =GeneradorAleatorio.generarDouble(8000-2000+1)+2000;
        estado = true;
    }

    public Habitaciones(Cliente cli) {
        this.costoNoche = GeneradorAleatorio.generarDouble(8000-2000+1)+2000;
        this.estado = false;
        this.cli = cli;
    }
    
    

    public double getCostoNoche() {
        return costoNoche;
    }

    private void setCostoNoche(double costoNoche) {
        this.costoNoche = GeneradorAleatorio.generarDouble(8000-2000+1)+2000;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }
    public boolean getEstado (){
        return this.estado;
    }
    public String mostrarEstado (){
        if (this.estado ==false)
            return "OCUPADO";
            else
            return "liBRE";              
    }
    
    public void agregarCliente (Cliente cli){
        this.estado = false; 
        this.cli = cli;
    }
    public void aumentarPrecio (Double precio){
        this.costoNoche = this.costoNoche+precio;
    }
    }
    
