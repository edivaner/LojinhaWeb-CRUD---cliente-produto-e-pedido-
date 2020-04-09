/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import model.dao.ProdutoDAO;

/**
 *
 * @author edivaner
 */

@WebServlet(name = "editarproduto", urlPatterns = {"/editarproduto"})
public class editarproduto extends HttpServlet {

    
   
      
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        ProdutoDAO dao = new ProdutoDAO();
        Produto p = new Produto();
        p = dao.pesquisarPorId(Integer.parseInt(request.getParameter("id")));
        p.setDescricao(request.getParameter("nome"));
        p.setPreco(Float.parseFloat(request.getParameter("preco")));
        p.setQuant(Integer.parseInt(request.getParameter("quantidade")));
        
        try {
            dao.editar(p);
        } catch (Exception ex) {
            Logger.getLogger(editarproduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cadastrarcliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("Os dados do produto foram atualizados com sucesso. <a href=\"ListarProdutos.jsp\">Clique aqui para ir a listagem.</a>");
            out.println("</body>");
            out.println("</html>");
        }
        
       
    }

    
    
   
}

