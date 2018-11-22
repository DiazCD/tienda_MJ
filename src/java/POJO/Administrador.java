package POJO;

// Generated 22-nov-2018 20:28:48 by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Administrador generated by hbm2java
 */
public class Administrador  implements java.io.Serializable {


     private Integer id;
     private String nifAdmin;
     private String passAdmin;
     private String nombreAdmin;
     private String apellidosAdmin;
     private String emailAdmin;
     private Date fechaAltaAdmin;

    public Administrador() {
    }

    public Administrador(String nifAdmin, String passAdmin, String nombreAdmin, String apellidosAdmin, String emailAdmin, Date fechaAltaAdmin) {
       this.nifAdmin = nifAdmin;
       this.passAdmin = passAdmin;
       this.nombreAdmin = nombreAdmin;
       this.apellidosAdmin = apellidosAdmin;
       this.emailAdmin = emailAdmin;
       this.fechaAltaAdmin = fechaAltaAdmin;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNifAdmin() {
        return this.nifAdmin;
    }
    
    public void setNifAdmin(String nifAdmin) {
        this.nifAdmin = nifAdmin;
    }
    public String getPassAdmin() {
        return this.passAdmin;
    }
    
    public void setPassAdmin(String passAdmin) {
        this.passAdmin = passAdmin;
    }
    public String getNombreAdmin() {
        return this.nombreAdmin;
    }
    
    public void setNombreAdmin(String nombreAdmin) {
        this.nombreAdmin = nombreAdmin;
    }
    public String getApellidosAdmin() {
        return this.apellidosAdmin;
    }
    
    public void setApellidosAdmin(String apellidosAdmin) {
        this.apellidosAdmin = apellidosAdmin;
    }
    public String getEmailAdmin() {
        return this.emailAdmin;
    }
    
    public void setEmailAdmin(String emailAdmin) {
        this.emailAdmin = emailAdmin;
    }
    public Date getFechaAltaAdmin() {
        return this.fechaAltaAdmin;
    }
    
    public void setFechaAltaAdmin(Date fechaAltaAdmin) {
        this.fechaAltaAdmin = fechaAltaAdmin;
    }




}


