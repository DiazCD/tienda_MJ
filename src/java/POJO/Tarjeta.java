package POJO;
<<<<<<< HEAD
// Generated 19-nov-2018 23:50:58 by Hibernate Tools 4.3.1
=======
// Generated 21-nov-2018 18:39:09 by Hibernate Tools 4.3.1
>>>>>>> Julian



/**
 * Tarjeta generated by hbm2java
 */
public class Tarjeta  implements java.io.Serializable {


     private Integer id;
     private Usuario usuario;
     private int numeroTarj;

    public Tarjeta() {
    }

    public Tarjeta(Usuario usuario, int numeroTarj) {
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
    public int getNumeroTarj() {
        return this.numeroTarj;
    }
    
    public void setNumeroTarj(int numeroTarj) {
        this.numeroTarj = numeroTarj;
    }




}


