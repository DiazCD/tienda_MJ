package POJO;
// Generated 26-nov-2018 18:22:49 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Direccion generated by hbm2java
 */
public class Direccion  implements java.io.Serializable {


     private Integer id;
     private Usuario usuario;
     private String direccion;
     private String poblacion;
     private String pais;
     private Set pedidos = new HashSet(0);

    public Direccion() {
    }

	
    public Direccion(Usuario usuario, String direccion, String poblacion, String pais) {
        this.usuario = usuario;
        this.direccion = direccion;
        this.poblacion = poblacion;
        this.pais = pais;
    }
    public Direccion(Usuario usuario, String direccion, String poblacion, String pais, Set pedidos) {
       this.usuario = usuario;
       this.direccion = direccion;
       this.poblacion = poblacion;
       this.pais = pais;
       this.pedidos = pedidos;
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
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getPoblacion() {
        return this.poblacion;
    }
    
    public void setPoblacion(String poblacion) {
        this.poblacion = poblacion;
    }
    public String getPais() {
        return this.pais;
    }
    
    public void setPais(String pais) {
        this.pais = pais;
    }
    public Set getPedidos() {
        return this.pedidos;
    }
    
    public void setPedidos(Set pedidos) {
        this.pedidos = pedidos;
    }




}


