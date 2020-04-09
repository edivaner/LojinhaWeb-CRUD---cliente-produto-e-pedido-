
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>


    
    <%
        ProdutoDAO dao = new ProdutoDAO();
        List<Produto> lista = dao.listar3();

        
        
        /*
            para fazer a busca, isto verifica.
        */
        if (request.getParameter("txtfiltro") != null) {
            String pesquisa = request.getParameter("txtfiltro");
            lista = dao.listarPorNome(pesquisa);
        }

    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem dos produtos cadastrados</title>
    </head>
    <body>

        <ul>
            
            
            <li><a href="index.html">Página inicial</a><br><hr>
            </li>

            <li>
                <a href="javascript:void(0)">Menu de pedidos</a>
                <div>
                    <a href="LancarPedido.jsp">Fazer lançamento dos pedido</a><br>
                    <a href="ListarPedidos.jsp">Fazer listagem dos pedidos</a>
                    <br><br><br>
                </div>
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
                    <a href="ListarClientes.jsp">Fazer listagem dos clientess</a>     
                </div>
                <br><br><br>
            </li> 
            
            
            
        </ul> 
        
        

        <div class="listagem">
            <h3>Listando todos os produtos cadastrado</h3>

            <form method="post" action="ListarProdutos.jsp"> 
                <input type="text" name="txtfiltro" placeholder="Produto">
                <input type="submit" class="submit" value="Pesquisar">
            </form><br><br>
        </div> 
        
        
        <table border="1" class="t1">
            <tr>
                <th>Id</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Qtd</th>
                <th>Prática</th>
            </tr>

            
            
            <%   
                for (Produto p : lista) {
            %>

            
            
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getDescricao()%></td>
                <td><%=p.getPreco()%></td>
                <td><%=p.getQuant()%></td>
                <td><a href="EditarProduto.jsp?id=<%=p.getId()%>">Editar</a>
                    <a href="ExcluirProduto.jsp?id=<%=p.getId()%>">Excluir</a>
                </td>
            </tr>

            
            
            <%
                }
            %>
            
            
            
        </table>
    </body>
    
    
    
</html>
