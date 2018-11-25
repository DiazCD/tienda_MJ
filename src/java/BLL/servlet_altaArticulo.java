/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import POJO.Articulo;
import POJO.Categoria;
import POJO.Subcategoria;
import POJO.Vendedor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

/**
 *
 * @author migue
 */
public class servlet_altaArticulo extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
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
            HttpSession session = request.getSession(true);
            
            boolean correcto = false;
            String idCategoriaArt = request.getParameter("categoriaArt");
            String idSubcategoriaArt = request.getParameter("subcategoriaArt");
            Articulo art = new Articulo();
            Categoria categoria = new Operaciones(SessionBuilder).getCategoria(idCategoriaArt);
            Subcategoria subcategoria = new Operaciones(SessionBuilder).getSubcategoria(idSubcategoriaArt);

            art.setNombreArt(request.getParameter("nombreArt"));
            art.setDescripcionArt(request.getParameter("descripcionArt"));
            art.setCategoria(categoria);
            art.setSubcategoria(subcategoria);
            art.setImporteArt(Float.parseFloat(request.getParameter("importeArt")));
            art.setCantidadMaxArt(Integer.parseInt(request.getParameter("cantidadArt")));
            art.setVendedor((Vendedor)session.getAttribute("vendedor"));
            art.setImagenArt(request.getParameter("imgArt"));

            // dar de alta el articulo
            if (new Operaciones(SessionBuilder).altaArticulo(art)) {

                session.setAttribute("correcto", correcto);
                response.sendRedirect("./VISTAS/vista_altaArticulo.jsp");
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
