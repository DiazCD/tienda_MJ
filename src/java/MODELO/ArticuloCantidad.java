/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import POJO.Articulo;

/**
 *
 * @author Julian
 */
public class ArticuloCantidad {

    private Articulo articulo;
    private int cantidad;

    public ArticuloCantidad() {
    }

    public ArticuloCantidad(Articulo articulo, int cantidad) {
        this.articulo = articulo;
        this.cantidad = cantidad;
    }

    public Articulo getArticulo() {
        return articulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
