/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javax.print.attribute.Size2DSyntax.MM;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.Item;
import model.Pedido;
import model.Produto;
import model.dao.ClienteDAO;
import model.dao.InterfaceDAO;
import model.dao.PedidoDAO;
import model.dao.ProdutoDAO;

/**
 *
 * @author edivaner
 */


@WebServlet(name = "lancarpedido", urlPatterns = {"/lancarpedido"})
public class lancarpedido extends HttpServlet {

    
    private String getDateTime() {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        return dateFormat.format(date);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InterfaceDAO dao = new ClienteDAO();
        InterfaceDAO dao2 = new ProdutoDAO();

        Cliente cliente = (Cliente) dao.pesquisarPorId(Integer.parseInt(request.getParameter("idCliente")));
        Produto produto = (Produto) dao2.pesquisarPorId(Integer.parseInt(request.getParameter("idProduto")));

        String data = getDateTime();

        Item i = new Item(produto.getId(),
                Integer.parseInt(request.getParameter("quantidade")),
                produto.getPreco());

        List<Item> itens = new ArrayList();
        itens.add(i);

        Pedido pedido = new Pedido(data, "aberto", itens, cliente);

        
        try {
            InterfaceDAO dao3 = new PedidoDAO();
            dao.incluir(pedido);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        int qAnterior = produto.getQuant();
        produto.setQuant(produto.getQuant() - Integer.parseInt(request.getParameter("quantidade")));
        try {
            dao.editar(produto);
        } catch (Exception ex) {
            Logger.getLogger(lancarpedido.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        String info = pedido.toString();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"pagina.css\" media=\"screen\"/>\n");
            out.println("<head>");
            out.println("<title>Servlet cadastrarcliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<legend>Nota fiscal</legend>");
            out.println("<br>");
            out.println(info);
            out.println("</br></br><a href=\"index.html\">Clique para voltar a pagina inicial</a>");
            out.println("");
            out.println("</body>");
            out.println("</html>");
        }

    }

}
