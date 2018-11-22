package POJO;
// Generated 22-nov-2018 21:51:59 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Comentario generated by hbm2java
 */
public class Comentario  implements java.io.Serializable {


     private Integer id;
     private Articulo articulo;
     private Usuario usuario;
     private String descripcionCom;
     private int valoracionCom;
     private Date fechaAltaCom;

    public Comentario() {
    }

    public Comentario(Articulo articulo, Usuario usuario, String descripcionCom, int valoracionCom, Date fechaAltaCom) {
       this.articulo = articulo;
       this.usuario = usuario;
       this.descripcionCom = descripcionCom;
       this.valoracionCom = valoracionCom;
       this.fechaAltaCom = fechaAltaCom;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Articulo getArticulo() {
        return this.articulo;
    }
    
    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getDescripcionCom() {
        return this.descripcionCom;
    }
    
    public void setDescripcionCom(String descripcionCom) {
        this.descripcionCom = descripcionCom;
    }
    public int getValoracionCom() {
        return this.valoracionCom;
    }
    
    public void setValoracionCom(int valoracionCom) {
        this.valoracionCom = valoracionCom;
    }
    public Date getFechaAltaCom() {
        return this.fechaAltaCom;
    }
    
    public void setFechaAltaCom(Date fechaAltaCom) {
        this.fechaAltaCom = fechaAltaCom;
    }




}


