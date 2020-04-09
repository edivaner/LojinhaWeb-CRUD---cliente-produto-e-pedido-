

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Level"%>
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Item"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>

    
    
    <%
        PedidoDAO dao = new PedidoDAO();
        Pedido pedido = new Pedido();

        ProdutoDAO dao0 = new ProdutoDAO();
        Produto produto = new Produto();

        pedido = dao.pesquisarPorId(Integer.parseInt(request.getParameter("id")));
        pedido.setStatus("Cancelado");
        dao.editar(pedido);
        List<Item> lista = pedido.getItens();

        for (Item i : lista) {

            produto = dao0.pesquisarPorId(i.getIdProduto());
            int qAnterior = produto.getQuant();
            produto.setQuant(qAnterior + i.getQuant());

            try {
                dao0.editar(produto);
            } catch (Exception ex) {
                
            }
        }


    %>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelamento de pedido</title>
    </head>
    
    
    <body>
        Este pedido foi cancelado com sucesso. <a href="index.html"> Clique aqui para voltar a página inicial</a>
    </body>
    
    
</html>

