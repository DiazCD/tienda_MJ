package POJO;
// Generated 21-nov-2018 19:03:04 by Hibernate Tools 4.3.1



/**
 * PedidoLin generated by hbm2java
 */
public class PedidoLin  implements java.io.Serializable {


     private Integer id;
     private Articulo articulo;
     private int cantidadLin;
     private int importeLin;

    public PedidoLin() {
    }

    public PedidoLin(Articulo articulo, int cantidadLin, int importeLin) {
       this.articulo = articulo;
       this.cantidadLin = cantidadLin;
       this.importeLin = importeLin;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Articulo getArticulo() {
        return this.articulo;
    }
    
    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
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


