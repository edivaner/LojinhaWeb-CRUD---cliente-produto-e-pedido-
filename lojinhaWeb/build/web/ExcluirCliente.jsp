
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>



<%
    ClienteDAO dao = new ClienteDAO();
    dao.excluir(Integer.parseInt(request.getParameter("id")));               
%>



<html>
    <!--Copiar e colar nas outras tela de exclusão-->
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de cliente.</title>
    </head>
    
    <body styler="align-text=center;">
        O cliente foi excluido com sucesso. <a href="ListarClientes.jsp">Clique aqui para voltar a tela de Listagem.</a>
    </body>
    
    
</html>
