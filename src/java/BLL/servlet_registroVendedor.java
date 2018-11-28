/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import POJO.Vendedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

/**
 *
 * @author Julian
 */
@WebServlet(name = "servlet_registroVendedor", urlPatterns = {"/servlet_registroVendedor"})
public class servlet_registroVendedor extends HttpServlet {

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
            String nombreVendedor = request.getParameter("nombreRegistro");
            String nifVendedor = request.getParameter("nifRegistro");
            String paisVendedor = request.getParameter("paisRegistro");
            String poblacionVendedor = request.getParameter("poblacionRegistro");
            String direccionVendedor = request.getParameter("direccionRegistro");
            String correoVendedor = request.getParameter("correoRegistro");
            String claveVendedor = request.getParameter("claveRegistro");
            Date fechaAltaUsuario = new Date();

            Operaciones op = new Operaciones(SessionBuilder);

            Vendedor nuevoVendedor = new Vendedor(nifVendedor, claveVendedor, nombreVendedor, paisVendedor, poblacionVendedor, direccionVendedor, correoVendedor, fechaAltaUsuario);

            op = new Operaciones(SessionBuilder);
            Boolean registrado = op.registrarVendedor(nuevoVendedor);

            if (registrado) {
                HttpSession ArraySesion = request.getSession(true);
                ArraySesion.setAttribute("vendedorLogueado", nuevoVendedor);

                response.sendRedirect("VISTAS/vista_home.jsp");
            } else {
                response.sendRedirect("VISTAS/vista_noRegistrado.jsp");
            }
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
