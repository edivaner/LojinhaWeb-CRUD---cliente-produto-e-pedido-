

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.dao.InterfaceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="model.Item"%>
<%@page import="java.util.List"%>



<html
     <%
         ProdutoDAO dao = new ProdutoDAO();
         Produto p = new Produto();
         p = dao.pesquisarPorId(Integer.parseInt(request.getParameter("id")));   
     %>
    
     
     
    <head>
        <title> Editar Produto</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
    </head>

    
    
    <body>
        
        
        
        <ul>
            <li><a href="index.html">Página Inicial</a><br><hr></li>
            
            <li>
                <a href="javascript:void(0)">Menu dos pedidos</a>
                <div>
                    <a href="LancarPedido.jsp">Fazer lançamento dos pedidos</a><br>
                    <a href="ListarPedidos.jsp">Fazer listagem dos pedidos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            
            <li>
                <a href="javascript:void(0)">Menu dos produtos</a>
                <div>
                    <a href="CadastrarProduto.jsp">Fazer cadastro dos produtos</a><br>
                    <a href="ListarProdutos.jsp">Fazer listagem dos produtos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            <li>
                <a href="javascript:void(0)">Menu dos clientes</a>
                <div>
                    <a href="CadastrarCliente.jsp">Fazer cadastro dos clientes</a><br>
                    <a href="ListarClientes.jsp">Fazer cadastro dos clientes</a>     
                </div>
                <br><br><br>
            </li>   
            
        </ul> 
        
        <br><br>
        <hr>
            
            <legend>Edição dos produtos já cadastrados:</legend>
            
            <form action="editarproduto" method="post">
               <p><input type="text" name="id" value="<%=p.getId()%>" readonly></p>
               <p><input type="text" name="nome" placeholder="Descrição" value="<%=p.getDescricao()%>"></p>
               <p><input type="text" name="preco" placeholder="Preço" value="<%=p.getPreco()%>"> </p>
               <p><input type="text" name="quantidade" placeholder="Quantidade" value="<%=p.getQuant()%>"></p> 
               <input type="submit" class="submit" value="Salvar">
            </form>           
        

    </body>
</html>
