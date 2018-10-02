package POJO;
// Generated 02-oct-2018 22:36:10 by Hibernate Tools 4.3.1



/**
 * Pedido generated by hbm2java
 */
public class Pedido  implements java.io.Serializable {


     private int id;
     private Usuario usuario;
     private String descripcionPed;
     private Float importePed;
     private Float importeTotal;
     private PedidoLin pedidoLin;

    public Pedido() {
    }

	
    public Pedido(int id) {
        this.id = id;
    }
    public Pedido(int id, Usuario usuario, String descripcionPed, Float importePed, Float importeTotal, PedidoLin pedidoLin) {
       this.id = id;
       this.usuario = usuario;
       this.descripcionPed = descripcionPed;
       this.importePed = importePed;
       this.importeTotal = importeTotal;
       this.pedidoLin = pedidoLin;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getDescripcionPed() {
        return this.descripcionPed;
    }
    
    public void setDescripcionPed(String descripcionPed) {
        this.descripcionPed = descripcionPed;
    }
    public Float getImportePed() {
        return this.importePed;
    }
    
    public void setImportePed(Float importePed) {
        this.importePed = importePed;
    }
    public Float getImporteTotal() {
        return this.importeTotal;
    }
    
    public void setImporteTotal(Float importeTotal) {
        this.importeTotal = importeTotal;
    }
    public PedidoLin getPedidoLin() {
        return this.pedidoLin;
    }
    
    public void setPedidoLin(PedidoLin pedidoLin) {
        this.pedidoLin = pedidoLin;
    }




}


