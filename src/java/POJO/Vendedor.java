package POJO;
// Generated 21-nov-2018 19:12:57 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Vendedor generated by hbm2java
 */
public class Vendedor  implements java.io.Serializable {


     private Integer id;
     private String nifVend;
     private String passVend;
     private String nombreVend;
     private String apellidosVend;
     private String emailVend;
     private Date fechaAltaVend;
     private Set articulos = new HashSet(0);

    public Vendedor() {
    }

	
    public Vendedor(String nifVend, String passVend, String nombreVend, String apellidosVend, String emailVend, Date fechaAltaVend) {
        this.nifVend = nifVend;
        this.passVend = passVend;
        this.nombreVend = nombreVend;
        this.apellidosVend = apellidosVend;
        this.emailVend = emailVend;
        this.fechaAltaVend = fechaAltaVend;
    }
    public Vendedor(String nifVend, String passVend, String nombreVend, String apellidosVend, String emailVend, Date fechaAltaVend, Set articulos) {
       this.nifVend = nifVend;
       this.passVend = passVend;
       this.nombreVend = nombreVend;
       this.apellidosVend = apellidosVend;
       this.emailVend = emailVend;
       this.fechaAltaVend = fechaAltaVend;
       this.articulos = articulos;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNifVend() {
        return this.nifVend;
    }
    
    public void setNifVend(String nifVend) {
        this.nifVend = nifVend;
    }
    public String getPassVend() {
        return this.passVend;
    }
    
    public void setPassVend(String passVend) {
        this.passVend = passVend;
    }
    public String getNombreVend() {
        return this.nombreVend;
    }
    
    public void setNombreVend(String nombreVend) {
        this.nombreVend = nombreVend;
    }
    public String getApellidosVend() {
        return this.apellidosVend;
    }
    
    public void setApellidosVend(String apellidosVend) {
        this.apellidosVend = apellidosVend;
    }
    public String getEmailVend() {
        return this.emailVend;
    }
    
    public void setEmailVend(String emailVend) {
        this.emailVend = emailVend;
    }
    public Date getFechaAltaVend() {
        return this.fechaAltaVend;
    }
    
    public void setFechaAltaVend(Date fechaAltaVend) {
        this.fechaAltaVend = fechaAltaVend;
    }
    public Set getArticulos() {
        return this.articulos;
    }
    
    public void setArticulos(Set articulos) {
        this.articulos = articulos;
    }




}


