<%-- 
    Document   : ExcluirPedido
    Created on : 04/02/2020, 14:20:45
    Author     : edivaner
--%>

<%@page import="model.dao.PedidoDAO"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>



<%
    PedidoDAO dao = new PedidoDAO();
    dao.excluir(Integer.parseInt(request.getParameter("id")));
%>



<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de pedido.</title>
    </head>
    
    <body>
        o pedido foi excluido com sucesso. <a href="ListarPedidos.jsp">Clique aqui para voltar a tela de listagem.</a>
    </body>
    
    
</html>
