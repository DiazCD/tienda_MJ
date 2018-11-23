package POJO;
// Generated 23-nov-2018 0:57:45 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Subcategoria generated by hbm2java
 */
public class Subcategoria  implements java.io.Serializable {


     private Integer id;
     private Categoria categoria;
     private String nombreSubcat;
     private String descripcionSubcat;
     private Set articulos = new HashSet(0);

    public Subcategoria() {
    }

	
    public Subcategoria(String nombreSubcat, String descripcionSubcat) {
        this.nombreSubcat = nombreSubcat;
        this.descripcionSubcat = descripcionSubcat;
    }
    public Subcategoria(Categoria categoria, String nombreSubcat, String descripcionSubcat, Set articulos) {
       this.categoria = categoria;
       this.nombreSubcat = nombreSubcat;
       this.descripcionSubcat = descripcionSubcat;
       this.articulos = articulos;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public String getNombreSubcat() {
        return this.nombreSubcat;
    }
    
    public void setNombreSubcat(String nombreSubcat) {
        this.nombreSubcat = nombreSubcat;
    }
    public String getDescripcionSubcat() {
        return this.descripcionSubcat;
    }
    
    public void setDescripcionSubcat(String descripcionSubcat) {
        this.descripcionSubcat = descripcionSubcat;
    }
    public Set getArticulos() {
        return this.articulos;
    }
    
    public void setArticulos(Set articulos) {
        this.articulos = articulos;
    }




}


