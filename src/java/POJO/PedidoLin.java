package POJO;
// Generated 27-oct-2018 14:07:02 by Hibernate Tools 4.3.1



/**
 * PedidoLin generated by hbm2java
 */
public class PedidoLin  implements java.io.Serializable {


     private int id;
     private Articulo articulo;
     private Pedido pedido;
     private int cantidadLin;
     private int importeLin;

    public PedidoLin() {
    }

    public PedidoLin(Articulo articulo, Pedido pedido, int cantidadLin, int importeLin) {
       this.articulo = articulo;
       this.pedido = pedido;
       this.cantidadLin = cantidadLin;
       this.importeLin = importeLin;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Articulo getArticulo() {
        return this.articulo;
    }
    
    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }
    public Pedido getPedido() {
        return this.pedido;
    }
    
    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
    public int getCantidadLin() {
        return this.cantidadLin;
    }
    
    public void setCantidadLin(int cantidadLin) {
        this.cantidadLin = cantidadLin;
    }
    public int getImporteLin() {
        return this.importeLin;
    }
    
    public void setImporteLin(int importeLin) {
        this.importeLin = importeLin;
    }




}


