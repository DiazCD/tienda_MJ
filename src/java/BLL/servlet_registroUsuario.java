/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import POJO.Direccion;
import POJO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Julian
 */
@WebServlet(name = "servlet_registroUsuario", urlPatterns = {"/servlet_registroUsuario"})
public class servlet_registroUsuario extends HttpServlet {

    //Conectar con la sesion
    private SessionFactory SessionBuilder;

    //El init hace que la primera vez que se ejecute el servlet se inicia la conexion para siempre
    /**
     *
     */
    public void init() {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String nombreUsuario = request.getParameter("nombreRegistro");
            String apellidosUsuario = request.getParameter("apellidosRegistro");
            String dniUsuario = request.getParameter("dniRegistro");
            String poblacionUsuario = request.getParameter("poblacionRegistro");
            String paisUsuario = request.getParameter("paisRegistro");
            String direccionUsuario = request.getParameter("direccionRegistro");
            String correoUsuario = request.getParameter("correoRegistro");
            String claveUsuario = request.getParameter("claveRegistro");
            Date fechaAltaUsuario = new Date();

            Usuario nuevoUsuario = new Usuario(dniUsuario, claveUsuario, nombreUsuario, apellidosUsuario, correoUsuario, fechaAltaUsuario);
            Direccion nuevaDireccion = new Direccion(nuevoUsuario, direccionUsuario, poblacionUsuario, paisUsuario);

            Session sesion = SessionBuilder.openSession();
            Operaciones op = new Operaciones();
            op.registrarUsuario(SessionBuilder, nuevaDireccion);

            response.sendRedirect("VISTAS/vista_home.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
