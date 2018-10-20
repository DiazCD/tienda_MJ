package POJO;
// Generated 20-oct-2018 19:50:39 by Hibernate Tools 4.3.1



/**
 * Tarjeta generated by hbm2java
 */
public class Tarjeta  implements java.io.Serializable {


     private Integer id;
     private Usuario usuario;
     private Integer numeroTarj;

    public Tarjeta() {
    }

	
    public Tarjeta(Usuario usuario) {
        this.usuario = usuario;
    }
    public Tarjeta(Usuario usuario, Integer numeroTarj) {
       this.usuario = usuario;
       this.numeroTarj = numeroTarj;
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
    public Integer getNumeroTarj() {
        return this.numeroTarj;
    }
    
    public void setNumeroTarj(Integer numeroTarj) {
        this.numeroTarj = numeroTarj;
    }




}


