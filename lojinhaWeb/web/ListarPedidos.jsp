<%-- 
    Document   : ListarPedidos
    Created on : 04/02/2020, 17:14:08
    Author     : edivaner
--%>

<%@page import="model.Pedido"%>
<%@page import="model.dao.PedidoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>





<html>


    <%
        
        
        
        PedidoDAO dao = new PedidoDAO();
        List<Pedido> lista = dao.listar3();
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem dos pedidos cadastrados</title>
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
        <h3>Listando os pedidos cadastrados</h3>
        <table border="1" class="t1">
            <tr>  <!--Linha do título, por isso th-->
                <th>Id</th>
                <th>Cliente</th>
                <th>Data e hora</th>
                <th>Status do pedido</th>
                <th>Itens</th>
                <th>Total a pagar</th>
                <th>Prática</th>
            </tr>
            
            

            <%
                for (Pedido p : lista) {
            %>

            
            
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getCliente()%></td>
                <td><%=p.getData()%></td>
                <td><%=p.getStatus()%></td>
                <td><%=p.getItens()%></td>
                <td><%=p.calcularTotal(p.getItens())%></td>
                <td><a href="CancelarPedido.jsp?id=<%=p.getId()%>"> Cancelar Pedido</a><br>
                    <a href="ExcluirPedido.jsp?id=<%=p.getId()%>">Excluir</a>
                </td>
            </tr>

            
            
            <%
                }
            %>
            
            
            
        </table>


    </body>
</html>
