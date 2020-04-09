

<%@page import="model.dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>



<%
    ProdutoDAO dao = new ProdutoDAO();
    dao.excluir(Integer.parseInt(request.getParameter("id")));   
%>



<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclução de produto</title>
    </head>
    
    <body>
        o produto foi excluido com sucesso. <a href="ListarProdutos.jsp">Clique aqui para voltar a tela de listagem.</a>
    </body>
    
</html>
