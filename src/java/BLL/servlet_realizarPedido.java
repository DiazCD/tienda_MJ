/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DAO.NewHibernateUtil;
import DAO.Operaciones;
import MODELO.ArticuloCantidad;
import POJO.Direccion;
import POJO.Pedido;
import POJO.PedidoLin;
import POJO.Tarjeta;
import POJO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
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
@WebServlet(name = "servlet_realizarPedido", urlPatterns = {"/servlet_realizarPedido"})
public class servlet_realizarPedido extends HttpServlet {

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
            String calle = request.getParameter("direccion");
            String poblacion = request.getParameter("poblacion");
            String pais = request.getParameter("pais");

            String nTarjeta = request.getParameter("nTarjeta");
            int mes = Integer.parseInt(request.getParameter("mes"));
            int anno = Integer.parseInt(request.getParameter("anno"));

            HttpSession ArraySession = request.getSession();
            Usuario usuario = (Usuario) ArraySession.getAttribute("usuarioLogueado");
            List<ArticuloCantidad> carrito = (List) ArraySession.getAttribute("carrito");

            Direccion direccion = new Direccion(usuario, calle, poblacion, pais);
            Tarjeta tarjeta = new Tarjeta(usuario, nTarjeta, mes, anno);

            Session sesion = SessionBuilder.openSession();
            
            Operaciones op = new Operaciones(SessionBuilder);
            direccion = op.comprobarDireccion(direccion);
            op = new Operaciones(SessionBuilder);
            tarjeta = op.comprobarTarjeta(tarjeta);

            Pedido pedido = new Pedido(direccion, tarjeta, usuario, new Date(), 0, 0);
            Set setPedidoLin = new HashSet(0);
            PedidoLin pedidoLin = new PedidoLin();

            Iterator iter = carrito.iterator();
            while (iter.hasNext()) {
                ArticuloCantidad articulo = (ArticuloCantidad) iter.next();
                pedidoLin = new PedidoLin(articulo.getArticulo(), pedido, articulo.getCantidad(), articulo.getCantidad() * articulo.getArticulo().getImporteArt());
                setPedidoLin.add(pedidoLin);
            }
            pedido.setPedidoLins(setPedidoLin);
            
            op = new Operaciones(SessionBuilder);
            op.registrarPedido(pedido);
            
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
