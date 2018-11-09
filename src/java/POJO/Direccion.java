package POJO;
// Generated 09-nov-2018 9:00:13 by Hibernate Tools 4.3.1



/**
 * Direccion generated by hbm2java
 */
public class Direccion  implements java.io.Serializable {


     private Integer id;
     private Usuario usuario;
     private String calle;
     private String pais;
     private String poblacion;

    public Direccion() {
    }

    public Direccion(Usuario usuario, String calle, String pais, String poblacion) {
       this.usuario = usuario;
       this.calle = calle;
       this.pais = pais;
       this.poblacion = poblacion;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getCalle() {
        return this.calle;
    }
    
    public void setCalle(String calle) {
        this.calle = calle;
    }
    public String getPais() {
        return this.pais;
    }
    
    public void setPais(String pais) {
        this.pais = pais;
    }
    public String getPoblacion() {
        return this.poblacion;
    }
    
    public void setPoblacion(String poblacion) {
        this.poblacion = poblacion;
    }




}


