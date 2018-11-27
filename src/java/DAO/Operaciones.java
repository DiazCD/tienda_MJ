/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Usuario;
import POJO.Subcategoria;
import POJO.Direccion;
import POJO.Vendedor;
import POJO.Categoria;
import POJO.*;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author migue
 */
public class Operaciones {

    private Session session = null;
    private SessionFactory SessionBuilder;

    /**
     * Contructor vacio;
     */
    public Operaciones() {

    }

    /**
     * Contructor con parámetros
     * @param SessionBuilder 
     */
    public Operaciones(SessionFactory SessionBuilder) {
        session = SessionBuilder.openSession();
        this.SessionBuilder = SessionBuilder;
    }

    /**
     * Método de registro
     * @param direccion 
     */
    public void registrarUsuario(Direccion direccion) {
        Transaction Tx = null;
        try {
            Tx = session.beginTransaction();

            session.saveOrUpdate(direccion);

            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                //Si hay excepcion, se deshacen todas las operaciones que se habian hecho
                Tx.rollback();
            }
            //Se lanza la propia excepcion para que lo recoja el controlador
            throw HE;
        } finally {
            //La sesion se cierra pase lo que pase
            session.close();
        }
    }

    /**
     * Método de login de usuario
     * @param nif
     * @param pass
     * @return Usuario
     */
    public Usuario loginUsuario(String nif, String pass) {
        String hql = "FROM Usuario WHERE nif_usr=:dniUsr AND pass_usr=:passUsr";
        Query q = session.createQuery(hql);
        q.setParameter("dniUsr", nif);
        q.setParameter("passUsr", pass);

        Usuario usr = new Usuario();

        List listUsuario = q.list();
        if (!listUsuario.isEmpty()) {
            usr = (Usuario) listUsuario.get(0);
        }
        session.close();

        return usr;
    }

    /**
     * Método de login de vendedor
     * @param nif
     * @param pass
     * @return Vendedor
     */
    public Vendedor loginVendedor(String nif, String pass) {
        String hql = "FROM Vendedor WHERE nif_vend=:dniVend AND pass_vend=:passVend";
        Query q = session.createQuery(hql);
        q.setParameter("dniVend", nif);
        q.setParameter("passVend", pass);

        Vendedor vend = new Vendedor();

        List listVendedor = q.list();
        if (!listVendedor.isEmpty()) {
            vend = (Vendedor) listVendedor.get(0);
        }
        session.close();

        return vend;
    }

    /**
     * Método que carga todos los artículos
     * @return List Articulo
     */
    public List<Articulo> getArticulosCatalogo() {
        String hql = "FROM Articulo";
        Query q = session.createQuery(hql);

        List listaArticulos = q.list();
        session.close();

        return listaArticulos;
    }

    /**
     * Método que carga todos los articulos de un vendedor
     * @param vend
     * @return List Articulos
     */
    public List<Articulo> getArticulosVend(Vendedor vend) {

        String hql = "FROM Articulo WHERE id_vendedor_art=:idVendedor";
        Query q = session.createQuery(hql);
        q.setParameter("idVendedor", vend.getId());

        List<Articulo> listArticulos = q.list();

        session.close();

        return listArticulos;
    }

    /**
     * Método que carga todas las categorias
     * @return Categoria
     */
    public List<Categoria> getCategorias() {

        String hql = "FROM Categoria";
        Query q = session.createQuery(hql);

        List listCategorias = q.list();
        session.close();

        return listCategorias;
    }

    /**
     * Método que carga una categoria a partir de su id
     * @param id
     * @return Categoria
     */
    public Categoria getCategoria(String id) {

        String hql = "FROM Categoria WHERE id=:idCategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idCategoria", id);

        List<Categoria> listCategorias = q.list();
        session.close();

        return listCategorias.get(0);
    }
    
    /**
     * Método que carga una subcategoria a partir de su id
     * @param id
     * @return Subcategoria
     */
    public Subcategoria getSubcategoria(String id) {

        String hql = "FROM Subcategoria WHERE id=:idSubcategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idSubcategoria", id);

        List<Subcategoria> listSubcategorias = q.list();
        session.close();

        return listSubcategorias.get(0);
    }

    /**
     * Método que caga las subcategorias de una categoria
     * @param categoria
     * @return List Subcategoria
     */
    public List<Subcategoria> getSubcategorias(Categoria categoria) {

        String hql = "FROM Subcategoria WHERE id_categoria=:idCategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idCategoria", categoria.getId());

        List<Subcategoria> listSubcategorias = q.list();
        session.close();

        return listSubcategorias;
    }
    
    /**
     * Método que carga todas las subcategorias
     * @return List Subcategoria
     */
    public List<Subcategoria> getSubCategorias() {

        String hql = "FROM Subcategoria";
        Query q = session.createQuery(hql);

        List listSubCategorias = q.list();
        session.close();

        return listSubCategorias;
    }

    /**
     * Método que da de alta una categoria
     * @param categoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean altaCategoria(Categoria categoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.save(categoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que borra una categoria
     * @param categoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean borrarCategoria(Categoria categoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion

            // Extramos las subcategorias
            List<Subcategoria> listSubcategorias = new Operaciones(SessionBuilder).getSubcategorias(categoria);

            for (int i = 0; i < listSubcategorias.size(); i++) {

                Subcategoria subcategoria = new Operaciones(SessionBuilder).getSubcategoria(String.valueOf(listSubcategorias.get(i).getId()));
                session.delete(subcategoria);
            }

            session.delete(categoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que actualiza los datos de una categoria
     * @param categoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean actualizarCategoria(Categoria categoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.update(categoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que actualiza los datos de una subcategoria
     * @param Subcategoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean actualizarSubcategoria(Subcategoria Subcategoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.update(Subcategoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que da de alta una subcategoria
     * @param subcategoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean altaSubcategoria(Subcategoria subcategoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.save(subcategoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que borra una subcategoría
     * @param subcategoria
     * @return boolean
     * @throws HibernateException 
     */
    public boolean borrarSubcategoria(Subcategoria subcategoria) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion

            session.delete(subcategoria); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {
            if (tran != null) {
                tran.rollback();
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que da de alta un articulo
     * @param articulo
     * @return boolean
     */
    public boolean altaArticulo(Articulo articulo) {

        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.save(articulo); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que nos devuelve los articulos de una categoria
     * @param categoria
     * @return List de articulos
     */
    public List<Articulo> getArticulosCategoria(Categoria categoria) {

        String hql = "FROM Articulo WHERE id_categoria_art=:idCategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idCategoria", categoria.getId());

        List<Articulo> listArticulos = q.list();

        session.close();

        return listArticulos;
    }

    /**
     * Método que nos devuelve los articulos de una subcategoria
     * @param subcategoria
     * @return List de articulos
     */
    public List<Articulo> getArticulosSubcategoria(Subcategoria subcategoria) {

        String hql = "FROM Articulo WHERE id_subcategoria_art=:idSubcategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idSubcategoria", subcategoria.getId());

        List<Articulo> listArticulos = q.list();

        session.close();

        return listArticulos;
    }

    /**
     * Se obtiene el obj completo a partir de su id.
     * @param id
     * @return Articulo
     */
    public Articulo getArticulo(String id) {

        String hql = "FROM Articulo WHERE id=:idArticulo";
        Query q = session.createQuery(hql);
        q.setParameter("idArticulo", id);

        List<Articulo> listArticulos = q.list();
        session.close();

        return listArticulos.get(0);
    }

    /**
     * Método que borrar un articulo
     * @param articulo
     * @return boolean
     * @throws HibernateException 
     */
    public boolean borrarArticulo(Articulo articulo) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion

            session.delete(articulo); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {
            if (tran != null) {
                tran.rollback();
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que actualiza el articulo
     * @param articulo
     * @return boolean
     * @throws HibernateException
     */
    public boolean actualizarArticulo(Articulo articulo) throws HibernateException {
        Transaction tran = null;

        try {
            tran = session.beginTransaction(); // asociamos la transaccion a la sesion
            session.update(articulo); // le pasamos el obj a hibernate
            tran.commit(); // Ejecutamos la transaccion
            return true;

        } catch (HibernateException HE) {

            if (tran != null) {
                tran.rollback(); // Si da error volver atras
                return false;
            }
            throw HE;

        } finally {
            session.close();
        }
    }

    /**
     * Método que comprueba la direccion
     * @param direccion
     * @return Direccion
     */
    public Direccion comprobarDireccion(Direccion direccion) {
        String hql = "FROM Direccion WHERE id_usuario=:idUsuaio AND direccion=:dir AND poblacion=:pob AND pais=:pa";
        Query q = session.createQuery(hql);
        q.setParameter("idUsuaio", direccion.getUsuario().getId());
        q.setParameter("dir", direccion.getDireccion());
        q.setParameter("pob", direccion.getPoblacion());
        q.setParameter("pa", direccion.getPais());

        List<Direccion> listaDireccion = q.list();

        if (listaDireccion.isEmpty()) {
            Transaction Tx = null;
            try {
                Tx = session.beginTransaction();

                session.saveOrUpdate(direccion);

                Tx.commit();
            } catch (HibernateException HE) {
                HE.printStackTrace();
                if (Tx != null) {
                    //Si hay excepcion, se deshacen todas las operaciones que se habian hecho
                    Tx.rollback();
                }
                //Se lanza la propia excepcion para que lo recoja el controlador
                throw HE;
            }
            Query q2 = session.createQuery(hql);
            q2.setParameter("idUsuaio", direccion.getUsuario().getId());
            q2.setParameter("dir", direccion.getDireccion());
            q2.setParameter("pob", direccion.getPoblacion());
            q2.setParameter("pa", direccion.getPais());

            List<Direccion> listaDireccion2 = q2.list();
            //La sesion se cierra pase lo que pase
            session.close();
            return listaDireccion2.get(0);

        } else {
            return listaDireccion.get(0);
        }
    }

    /**
     * Método que comprueba si la tarjeta es correcta
     * @param tarjeta
     * @return Tarjeta
     */
    public Tarjeta comprobarTarjeta(Tarjeta tarjeta) {
        String hql = "FROM Tarjeta WHERE numero_tarj=:numero AND id_usuario_tarj=:idUsuario";
        Query q = session.createQuery(hql);
        q.setParameter("numero", tarjeta.getNumeroTarj());
        q.setParameter("idUsuario", tarjeta.getUsuario().getId());

        List<Tarjeta> listaTarjeta = q.list();

        if (listaTarjeta.isEmpty()) {
            Transaction Tx = null;
            try {
                Tx = session.beginTransaction();

                session.saveOrUpdate(tarjeta);

                Tx.commit();
            } catch (HibernateException HE) {
                HE.printStackTrace();
                if (Tx != null) {
                    //Si hay excepcion, se deshacen todas las operaciones que se habian hecho
                    Tx.rollback();
                }
                //Se lanza la propia excepcion para que lo recoja el controlador
                throw HE;
            }
            Query q2 = session.createQuery(hql);
            q2.setParameter("numero", tarjeta.getNumeroTarj());
            q2.setParameter("idUsuario", tarjeta.getUsuario().getId());

            List<Tarjeta> listaTarjeta2 = q2.list();
            //La sesion se cierra pase lo que pase
            session.close();
            return listaTarjeta2.get(0);

        } else {
            return listaTarjeta.get(0);
        }
    }

    /**
     * Método que registra un pedido
     * @param pedido 
     */
    public void registrarPedido(Pedido pedido) {
        Transaction Tx = null;
        try {
            Tx = session.beginTransaction();

            session.saveOrUpdate(pedido);

            Tx.commit();
        } catch (HibernateException HE) {
            HE.printStackTrace();
            if (Tx != null) {
                //Si hay excepcion, se deshacen todas las operaciones que se habian hecho
                Tx.rollback();
            }
            //Se lanza la propia excepcion para que lo recoja el controlador
            throw HE;
        } finally {
            //La sesion se cierra pase lo que pase
            session.close();
        }
    }
    
    /**
     * Método que carga los pedido no completados, completado = 0
     * @param usuario
     * @return List Pedido
     */
    public List<Pedido> getPedidosVivos (Usuario usuario) {
        String hql = "FROM Pedido WHERE id_usuario_ped=:idUsuario AND completado = '0'";
        Query q = session.createQuery(hql);
        q.setParameter("idUsuario", usuario.getId());

        List<Pedido> listPedidosVivos = q.list();

        session.close();

        return listPedidosVivos;
    }
    
    /**
     * Método que carga los pedido completados, completado = 1
     * @param usuario
     * @return List Pedido
     */
    public List<Pedido> getPedidosHistorico (Usuario usuario) {
        String hql = "FROM Pedido WHERE id_usuario_ped=:idUsuario AND completado = '1'";
        Query q = session.createQuery(hql);
        q.setParameter("idUsuario", usuario.getId());

        List<Pedido> listPedidosVivos = q.list();

        session.close();

        return listPedidosVivos;
    }
    
    /**
     * Método que carga las líneas de un pedido
     * @param pedido
     * @return List PedidoLin
     */
    public List<PedidoLin> getPedidoLin (Pedido pedido) {
        String hql = "FROM PedidoLin WHERE id_pedido=:idPedido";
        Query q = session.createQuery(hql);
        q.setParameter("idPedido", pedido.getId());

        List<PedidoLin> listPedidosLin = q.list();

        session.close();

        return listPedidosLin;
    }   
}
