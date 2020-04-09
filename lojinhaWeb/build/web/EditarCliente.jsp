

<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.dao.InterfaceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="model.Item"%>
<%@page import="java.util.List"%>


<html
     <%
         ClienteDAO dao = new ClienteDAO();
         Cliente c = new Cliente();
         c = dao.pesquisarPorId(Integer.parseInt(request.getParameter("id")));
     %>
    
    
    <head>
        <title> Edição de cliente </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
    </head>

    
    <body>
        
        
        
        <ul>
            
            <li><a href="index.html">Página inicial</a></li>
            
            <li>
                <a href="javascript:void(0)" >Menu dos pedidos</a>
                <div>
                    <a href="LancarPedido.jsp">Fazer lançamento de pedidos</a><br>
                    <a href="ListarPedidos.jsp">Fazer listagem de pedidos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            
            <li>
                <a href="javascript:void(0)">Menu dos produtos</a>
                <div>
                    <a href="CadastrarProduto.jsp">Fazer cadastro de produtos</a><br>
                    <a href="ListarProdutos.jsp">Fazer listagem de produtos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            
            <li>
                <a href="javascript:void(0)">Menu dos clientes</a>
                <div>
                    <a href="CadastrarCliente.jsp">Fazer cadastro de clientes</a><br>
                    <a href="ListarClientes.jsp">Fazer listagem de clientes</a>     
                </div>
                <br><br><br>
            </li> 
            
            
        </ul> 
        
        <br><br>
       
            
            <legend>Edição de cliente já existente:</legend>
            
            <!--Retorna o valor do bd-->
            <form action="editarcliente" method="post">
               <p><input type="text" name="id" value="<%=c.getId()%>" readonly></p>
               <p><input type="text" name="nome" placeholder="Nome" value="<%=c.getNome()%>"></p>
               <p><input type="text" name="email" placeholder="Email" value="<%=c.getEmail()%>"> </p>
               <p><input type="text" name="telefone" placeholder="Telefone" value="<%=c.getTelefone()%>"></p> 
               <input type="submit" class="submit" value="Salvar">
            </form>
                        

    </body>
</html>