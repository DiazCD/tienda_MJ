/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.*;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author migue
 */
public class Operaciones {

    Session session = null;
    
    public Operaciones(SessionFactory SessionBuilder) {
       session = SessionBuilder.openSession();
    }
    
    public List<Articulo> getArticulosVend (Vendedor vend) {
        
        String hql = "FROM Articulo";// where id_vendedor_art =:vVendedor";
        Query q = session.createQuery(hql);
        //q.setParameter("vVendedor", 1);

        List listArticulos = q.list();    
        session.close();
        
        return listArticulos;
    }
}
