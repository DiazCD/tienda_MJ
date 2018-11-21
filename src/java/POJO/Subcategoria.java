package POJO;
// Generated 21-nov-2018 18:39:09 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Subcategoria generated by hbm2java
 */
public class Subcategoria  implements java.io.Serializable {


     private Integer id;
     private String descripcionSubcat;
     private String nombreSubcat;
     private Set articulos = new HashSet(0);

    public Subcategoria() {
    }

	
    public Subcategoria(String descripcionSubcat, String nombreSubcat) {
        this.descripcionSubcat = descripcionSubcat;
        this.nombreSubcat = nombreSubcat;
    }
    public Subcategoria(String descripcionSubcat, String nombreSubcat, Set articulos) {
       this.descripcionSubcat = descripcionSubcat;
       this.nombreSubcat = nombreSubcat;
       this.articulos = articulos;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getDescripcionSubcat() {
        return this.descripcionSubcat;
    }
    
    public void setDescripcionSubcat(String descripcionSubcat) {
        this.descripcionSubcat = descripcionSubcat;
    }
    public String getNombreSubcat() {
        return this.nombreSubcat;
    }
    
    public void setNombreSubcat(String nombreSubcat) {
        this.nombreSubcat = nombreSubcat;
    }
    public Set getArticulos() {
        return this.articulos;
    }
    
    public void setArticulos(Set articulos) {
        this.articulos = articulos;
    }




}


