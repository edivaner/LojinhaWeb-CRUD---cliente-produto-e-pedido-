<%-- 
    Document   : LancarPedido
    Created on : 04/02/2020, 14:17:15
    Author     : edivaner
--%>

<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> lista = dao.listar3();

        ProdutoDAO dao2 = new ProdutoDAO();
        List<Produto> lista2 = dao2.listar3();

        if (request.getParameter("txtfiltrocliente") != null) {
            String pesquisa = request.getParameter("txtfiltrocliente");
            lista = dao.listarPorNome(pesquisa);
        }
        if (request.getParameter("txtfiltroproduto") != null) {
            String pesquisa = request.getParameter("txtfiltroproduto");
            lista2 = dao2.listarPorNome(pesquisa);
        }

    %>

    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lançamento dos pedidos</title>
    </head>
    
    
    
    <body>

        <ul>
            
            <li><a href="index.html">Página inicial</a><br><hr></li>

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
                    <a href="ListarClientes.jsp">Fazer listagem dos clientes</a>     
                </div>
                <br><br><br>
            </li>           
        </ul> 
        
        
        <hr>


       

            <legend>Fazer pedido(Digite ID do produto e do cliente...)</legend>

            
            
            <form action="lancarpedido" method="post">
                <input type="text" name="idCliente" placeholder="ID cliente">
                <input type="text" name="idProduto" placeholder="ID produto">
                <input type="text" name="quantidade" placeholder="Quantidade produto" value="1">
                <br><br><input class="submitcadastro" type="submit" value="Salvar">
            </form>


        
        <hr>
        

            <h3>Veja o ID dos clientes cadastrados:</h3>

            <div class="listagem">
                <form method="post" action="LancarPedido.jsp"> 
                    <input type="text" name="txtfiltrocliente" placeholder="nome cliente">
                    <input type="submit" class="submit" value="Pesquisar">
                </form><br><br>
            </div>

            <table border="1" class="t1">
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Tel</th>
                </tr>

                <%                   
                    for (Cliente c : lista) {
                %>

                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                </tr>

                <%
                    }
                %>
                
            </table>
                
                <hr>


            <h3>Veja o ID dos produtos cadastrados:</h3>

            <div class="listagem">
                <form method="post" action="LancarPedido.jsp"> 
                    <input type="text" name="txtfiltroproduto" placeholder="nome produto">
                    <input type="submit" class="submit" value="Pesquisar">
                </form><br><br>
            </div>

            
            
            <table border="1" class="t1">
                <tr>
                    <th>Id</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                </tr>

                
                
                <%
                    for (Produto p : lista2) {

                %>

                
                
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getDescricao()%></td>
                    <td><%=p.getPreco()%></td>
                </tr>

                
                
                <%
                    }
                %>
                
                
            </table>

                
                
    </body>
</html>
