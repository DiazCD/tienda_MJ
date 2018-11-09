package POJO;
// Generated 09-nov-2018 9:00:13 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private Integer id;
     private String nombreCat;
     private String descripcionCat;
     private Set subcategorias = new HashSet(0);
     private Set articulos = new HashSet(0);

    public Categoria() {
    }

	
    public Categoria(String nombreCat, String descripcionCat) {
        this.nombreCat = nombreCat;
        this.descripcionCat = descripcionCat;
    }
    public Categoria(String nombreCat, String descripcionCat, Set subcategorias, Set articulos) {
       this.nombreCat = nombreCat;
       this.descripcionCat = descripcionCat;
       this.subcategorias = subcategorias;
       this.articulos = articulos;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNombreCat() {
        return this.nombreCat;
    }
    
    public void setNombreCat(String nombreCat) {
        this.nombreCat = nombreCat;
    }
    public String getDescripcionCat() {
        return this.descripcionCat;
    }
    
    public void setDescripcionCat(String descripcionCat) {
        this.descripcionCat = descripcionCat;
    }
    public Set getSubcategorias() {
        return this.subcategorias;
    }
    
    public void setSubcategorias(Set subcategorias) {
        this.subcategorias = subcategorias;
    }
    public Set getArticulos() {
        return this.articulos;
    }
    
    public void setArticulos(Set articulos) {
        this.articulos = articulos;
    }




}


