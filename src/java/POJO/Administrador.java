package POJO;
// Generated 07-nov-2018 18:37:41 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Administrador generated by hbm2java
 */
public class Administrador  implements java.io.Serializable {


     private Integer id;
     private String nifAdmin;
     private String passAdmin;
     private String nombreAdmin;
     private String apellido1Admin;
     private String apellido2Admin;
     private String emailAdmin;
     private Date fechaAltaAdmin;

    public Administrador() {
    }

    public Administrador(String nifAdmin, String passAdmin, String nombreAdmin, String apellido1Admin, String apellido2Admin, String emailAdmin, Date fechaAltaAdmin) {
       this.nifAdmin = nifAdmin;
       this.passAdmin = passAdmin;
       this.nombreAdmin = nombreAdmin;
       this.apellido1Admin = apellido1Admin;
       this.apellido2Admin = apellido2Admin;
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
    public String getApellido1Admin() {
        return this.apellido1Admin;
    }
    
    public void setApellido1Admin(String apellido1Admin) {
        this.apellido1Admin = apellido1Admin;
    }
    public String getApellido2Admin() {
        return this.apellido2Admin;
    }
    
    public void setApellido2Admin(String apellido2Admin) {
        this.apellido2Admin = apellido2Admin;
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


