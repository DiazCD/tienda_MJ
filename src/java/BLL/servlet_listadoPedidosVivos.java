/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import POJO.Direccion;
import POJO.Pedido;
import POJO.Usuario;
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
public class servlet_listadoPedidosVivos extends HttpServlet {

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

            HttpSession ArraySession = request.getSession(true);
            Session sesion = SessionBuilder.openSession();
            String estado = request.getParameter("estado");
            ArrayList<Pedido> arrayPedidos = new ArrayList<>();
            Usuario usuario = new Usuario();
            usuario.setId(8);

            if (estado.equals("0")) {
                arrayPedidos = (ArrayList) new Operaciones(SessionBuilder).getPedidosVivos(usuario);

            } else if (estado.equals("1")) {
                arrayPedidos = (ArrayList) new Operaciones(SessionBuilder).getPedidosHistorico(usuario);
            }

            // load para la direccion
            for (int i = 0; i < arrayPedidos.size(); i++) {
                Direccion direccion = (Direccion) sesion.load(Direccion.class, arrayPedidos.get(i).getDireccion().getId());
                arrayPedidos.get(i).setDireccion(direccion);
            }

            ArraySession.setAttribute("arrayPedidos", arrayPedidos);
            ArraySession.setAttribute("estado", estado);
            response.sendRedirect("./VISTAS/vista_listadoPedidosVivos.jsp");
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
