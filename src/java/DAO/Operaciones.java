/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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

    Session session = null;

    public Operaciones(SessionFactory SessionBuilder) {
        session = SessionBuilder.openSession();
    }

    public List<Articulo> getArticulosVend(Vendedor vend) {

        String hql = "FROM Articulo WHERE id_vendedor_art=:idVendedor";
        Query q = session.createQuery(hql);
        q.setParameter("idVendedor", vend.getId());

        List listArticulos = q.list();
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

}
