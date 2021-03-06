/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import POJO.Articulo;
import POJO.Comentario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Julian
 */
@WebServlet(name = "servlet_masInformacion", urlPatterns = {"/servlet_masInformacion"})
public class servlet_masInformacion extends HttpServlet {

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
            String stringIdArticulo = request.getParameter("inf");
            int idArticulo;

            HttpSession ArraySession = request.getSession();
            if (stringIdArticulo == null) {
                Articulo art = (Articulo) ArraySession.getAttribute("articuloInfo");
                idArticulo = art.getId();
            } else {
                idArticulo = Integer.parseInt(stringIdArticulo);
            }
            List<Articulo> listaArticulos = (List) ArraySession.getAttribute("listaArticulosCatalogo");

            Articulo articulo = new Articulo();

            Session session = SessionBuilder.openSession();
            Iterator iter = listaArticulos.iterator();
            while (iter.hasNext()) {
                Articulo art = (Articulo) iter.next();

                if (art.getId() == idArticulo) {
                    articulo = (Articulo) session.load(Articulo.class, art.getId());
                }
            }
            Operaciones op = new Operaciones(SessionBuilder);
            List<Comentario> listaComentarios = op.listaComentarios(articulo);
            
            ArraySession.setAttribute("articuloInfo", articulo);
            ArraySession.setAttribute("comentariosInfo", listaComentarios);

            response.sendRedirect("VISTAS/vista_masInformacion.jsp");
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
