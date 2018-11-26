package POJO;
// Generated 26-nov-2018 23:23:39 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Pedido generated by hbm2java
 */
public class Pedido  implements java.io.Serializable {


     private Integer id;
     private Direccion direccion;
     private Tarjeta tarjeta;
     private Usuario usuario;
     private Date fechaPed;
     private float importeTotal;
     private Set pedidoLins = new HashSet(0);

    public Pedido() {
    }

	
    public Pedido(Direccion direccion, Tarjeta tarjeta, Usuario usuario, Date fechaPed, float importeTotal) {
        this.direccion = direccion;
        this.tarjeta = tarjeta;
        this.usuario = usuario;
        this.fechaPed = fechaPed;
        this.importeTotal = importeTotal;
    }
    public Pedido(Direccion direccion, Tarjeta tarjeta, Usuario usuario, Date fechaPed, float importeTotal, Set pedidoLins) {
       this.direccion = direccion;
       this.tarjeta = tarjeta;
       this.usuario = usuario;
       this.fechaPed = fechaPed;
       this.importeTotal = importeTotal;
       this.pedidoLins = pedidoLins;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Direccion getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }
    public Tarjeta getTarjeta() {
        return this.tarjeta;
    }
    
    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Date getFechaPed() {
        return this.fechaPed;
    }
    
    public void setFechaPed(Date fechaPed) {
        this.fechaPed = fechaPed;
    }
    public float getImporteTotal() {
        return this.importeTotal;
    }
    
    public void setImporteTotal(float importeTotal) {
        this.importeTotal = importeTotal;
    }
    public Set getPedidoLins() {
        return this.pedidoLins;
    }
    
    public void setPedidoLins(Set pedidoLins) {
        this.pedidoLins = pedidoLins;
    }




}


