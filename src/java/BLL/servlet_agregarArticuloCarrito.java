/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import POJO.Articulo;
import MODELO.ArticuloCantidad;
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

/**
 *
 * @author Julian
 */
@WebServlet(name = "servlet_agregarArticuloCarrito", urlPatterns = {"/servlet_agregarArticuloCarrito"})
public class servlet_agregarArticuloCarrito extends HttpServlet {

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
            int idArticulo = Integer.parseInt(request.getParameter("add"));

            HttpSession ArraySession = request.getSession(true);
            List<Articulo> listaArticulos = (List) ArraySession.getAttribute("listaArticulosCatalogo");
            List<ArticuloCantidad> carrito = (List) ArraySession.getAttribute("carrito");

            Iterator iter = listaArticulos.iterator();
            while (iter.hasNext()) {
                Articulo articulo = (Articulo) iter.next();
                if (articulo.getId() == idArticulo) {
                    if (carrito.isEmpty()) {
                        ArticuloCantidad articuloCarrito = new ArticuloCantidad(articulo, 1);
                        carrito.add(articuloCarrito);
                    } else {
                        boolean existe = false;
                        Iterator iter2 = carrito.iterator();
                        while (iter2.hasNext()) {
                            ArticuloCantidad art = (ArticuloCantidad) iter2.next();
                            if (art.getArticulo().getId() == articulo.getId()) {
                                art.setCantidad(art.getCantidad() + 1);
                                existe = true;
                            }
                        }
                        if (!existe) {
                            ArticuloCantidad articuloCarrito = new ArticuloCantidad(articulo, 1);
                            carrito.add(articuloCarrito);
                        }
                    }
                }
            }

            ArraySession.setAttribute("carrito", carrito);

            //out.print(carrito);
            response.sendRedirect("VISTAS/vista_catalogo.jsp");

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
