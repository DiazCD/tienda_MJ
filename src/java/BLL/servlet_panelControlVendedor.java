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
import POJO.Usuario;
import POJO.Vendedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author migue
 */
public class servlet_panelControlVendedor extends HttpServlet {

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
            try {
                HttpSession session = request.getSession(true);

                Vendedor vendedor = (Vendedor) session.getAttribute("vendedorLogueado");
                Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");

                // si se logea un vendedor
                if (vendedor.getId() != null) {
                    ArrayList<Articulo> arrayArticulos = (ArrayList) new Operaciones(SessionBuilder).getArticulosVend(vendedor);

                    // recorrer la lista y hacer load a la categoria y a la subcategoria        
                    Session sesion = SessionBuilder.openSession();

                    for (int i = 0; i < arrayArticulos.size(); i++) {
                        Categoria categoria = (Categoria) sesion.load(Categoria.class, arrayArticulos.get(i).getCategoria().getId());
                        arrayArticulos.get(i).setCategoria(categoria);

                        Subcategoria subcategoria = (Subcategoria) sesion.load(Subcategoria.class, arrayArticulos.get(i).getSubcategoria().getId());
                        arrayArticulos.get(i).setSubcategoria(subcategoria);
                    }

                    session.setAttribute("arrayArticulos", arrayArticulos);
                    response.sendRedirect("./VISTAS/vista_panelControlVendedor.jsp");
                
                    // si se logea un usuario
                } else if (usuario.getId() != null){
                    response.sendRedirect("./servlet_listadoPedidosVivos?estado=0");
                }
                
            } catch (IOException ex) {
                out.write("<html>");
                out.write("<p>" + ex + "</p>");
                out.write("</html>");
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
