/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.*;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author migue
 */
public class Operaciones {
    
    public ArrayList<Articulo> getArticulosUsr (Usuario usr) {
        ArrayList arrayArticulos = new ArrayList();
        
        return arrayArticulos;
    }
    
    public void registrarUsuario(SessionFactory _SessionBuilder, Direccion direccion) {
        Session sesion = _SessionBuilder.openSession();
        Transaction Tx = null;
        try {
            Tx = sesion.beginTransaction();
            //Se guarda en la tabla
            sesion.saveOrUpdate(direccion);
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
            sesion.close();
        }
    }
}
