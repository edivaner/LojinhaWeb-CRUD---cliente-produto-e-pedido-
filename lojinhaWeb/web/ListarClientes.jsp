
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<html>
    
    
    
    
    
    <%
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> lista = dao.listar3();
        
        if (request.getParameter("txtfiltro") != null) {
            String pesquisa = request.getParameter("txtfiltro");
            lista = dao.listarPorNome(pesquisa);
        }              
    %>
    
    
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem dos clientes cadastrados</title>
    </head>
    
    
    
    
    <body>                
        
        <ul>
            
            
            <li><a href="index.html">Página inicial</a><br><hr></li>
            
            
            <li>
                <a href="javascript:void(0)">Menu dos pedidos</a>
                <div>
                    <a href="LancarPedido.jsp">Fazer cadastro de pedidos</a><br>
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
                    <a href="CadastrarCliente.jsp">Fazer cadastrar clientes</a><br>
                    <a href="ListarClientes.jsp">Fazer listagem de clientes</a>     
                </div>
                <br><br><br>
            </li> 
            
            
        </ul> 
        
        
        
        
        <h3>Listando os clientes cadastrados</h3>
        
        
        <div class="listagem">
        <form method="post" action="ListarClientes.jsp"> 
                <input type="text" name="txtfiltro" placeholder="nome cliente">
                <input type="submit" class="submit" value="Pesquisar">
         </form><br><br><br>
        </div>
        
        
        
        
        <table border="1" class="t1">
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Tel</th>
                    <th>Prática</th>
                </tr>
                
                
                <%
                    for(Cliente c : lista){                   
                %>
                
                
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td><a href="EditarCliente.jsp?id=<%=c.getId()%>">Editar</a>
                        <a href="ExcluirCliente.jsp?id=<%=c.getId()%>">Excluir</a>
                    </td>
                </tr>
                
                
                
                
                <%
                    }
                %>
                
                
                
        </table>
 
                
    </body>
</html>
