

<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.dao.InterfaceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="model.Item"%>
<%@page import="java.util.List"%>

<html

    

    <head>
        <title> Cadastro de Produtos </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
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
                <div >
                    <a href="CadastrarProduto.jsp">Fazer cadastro dos produto</a><br>
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

        
        <br><br>           
            <legend>Cadastre um produto:</legend>
            
            
            
            <form action="cadastrarproduto" method="post">
                <input type="text" name="nome" placeholder="Descrição do produto">
                <input type="text" name="preco" placeholder="Preço">
                <input type="text" name="quantidade" placeholder="Quantidade">
                <br><br><input class="submitcadastro" type="submit" value="Salvar">
            </form>                                         

    </body>
</html>