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
import java.util.ArrayList;
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

    public Operaciones() {

    }

    public Operaciones(SessionFactory SessionBuilder) {
        session = SessionBuilder.openSession();
        this.SessionBuilder = SessionBuilder;
    }

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

    public List<Articulo> getArticulosCatalogo() {
        String hql = "FROM Articulo";
        Query q = session.createQuery(hql);

        List listaArticulos = q.list();
        session.close();

        return listaArticulos;
    }

    public List<Articulo> getArticulosVend(Vendedor vend) {

        String hql = "FROM Articulo WHERE id_vendedor_art=:idVendedor";
        Query q = session.createQuery(hql);
        q.setParameter("idVendedor", vend.getId());

        List<Articulo> listArticulos = q.list();

        session.close();

        return listArticulos;
    }

    public List<Categoria> getCategorias() {

        String hql = "FROM Categoria";
        Query q = session.createQuery(hql);

        List listCategorias = q.list();
        session.close();

        return listCategorias;
    }

    public Categoria getCategoria(String id) {

        String hql = "FROM Categoria WHERE id=:idCategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idCategoria", id);

        List<Categoria> listCategorias = q.list();
        session.close();

        return listCategorias.get(0);
    }

    public Subcategoria getSubcategoria(String id) {

        String hql = "FROM Subcategoria WHERE id=:idSubcategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idSubcategoria", id);

        List<Subcategoria> listSubcategorias = q.list();
        session.close();

        return listSubcategorias.get(0);
    }

    public List<Subcategoria> getSubcategorias(Categoria categoria) {

        String hql = "FROM Subcategoria WHERE id_categoria=:idCategoria";
        Query q = session.createQuery(hql);
        q.setParameter("idCategoria", categoria.getId());

        List<Subcategoria> listSubcategorias = q.list();
        session.close();

        return listSubcategorias;
    }

    public List<Categoria> getSubCategorias() {

        String hql = "FROM Subcategoria";
        Query q = session.createQuery(hql);

        List listSubCategorias = q.list();
        session.close();

        return listSubCategorias;
    }

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
     *
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
     *
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
     *
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
     *
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
}
