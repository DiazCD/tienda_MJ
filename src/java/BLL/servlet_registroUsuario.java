/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.EncriptarAES;
import POJO.Direccion;
import POJO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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

            HttpSession ArraySession = request.getSession(true);
            String nombreUsuario = request.getParameter("nombreRegistro");
            String apellidosUsuario = request.getParameter("apellidosRegistro");
            String dniUsuario = request.getParameter("dniRegistro");
            String poblacionUsuario = request.getParameter("poblacionRegistro");
            String paisUsuario = request.getParameter("paisRegistro");
            String direccionUsuario = request.getParameter("direccionRegistro");
            String correoUsuario = request.getParameter("correoRegistro");
            String claveUsuario = request.getParameter("claveRegistro");

            String clave = "92AE31A79FEEB2A3"; // 16 caracteres
            try {
                claveUsuario = EncriptarAES.encrypt(clave, claveUsuario);
            } catch (Exception ex) {
                ArraySession.setAttribute("error", "No se ha podido encriptar la clave de usuario");
                response.sendRedirect("./VISTAS/vista_error.jsp");
            }

            int diaNacimientoUsuario = Integer.parseInt(request.getParameter("diaNacimientoRegistro"));
            int mesNacimientoUsuario = Integer.parseInt(request.getParameter("mesNacimientoRegistro"));
            int annoNacimientoUsuario = Integer.parseInt(request.getParameter("annoNacimientoRegistro"));
            Date fechaAltaUsuario = new Date();
            Date fechaNacUsuario = new Date(annoNacimientoUsuario, mesNacimientoUsuario, diaNacimientoUsuario);

            Operaciones op = new Operaciones(SessionBuilder);

            if (op.validarDNI(dniUsuario)) {
                Usuario nuevoUsuario = new Usuario(dniUsuario, claveUsuario, nombreUsuario, apellidosUsuario, correoUsuario, fechaAltaUsuario, fechaNacUsuario);

                Direccion nuevaDireccion = new Direccion(nuevoUsuario, direccionUsuario, poblacionUsuario, paisUsuario);

                Boolean registrado = op.registrarUsuario(nuevaDireccion);

                if (registrado) {
                    ArraySession = request.getSession(true);
                    ArraySession.setAttribute("usuarioLogueado", nuevoUsuario);

                    response.sendRedirect("VISTAS/vista_home.jsp");
                } else {
                    response.sendRedirect("VISTAS/vista_noRegistrado.jsp");
                }

            } else {
                response.sendRedirect("VISTAS/vista_errorDni.jsp");
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
