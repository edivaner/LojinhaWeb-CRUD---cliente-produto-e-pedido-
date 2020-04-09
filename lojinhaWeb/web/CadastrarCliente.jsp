
<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.dao.InterfaceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="model.Item"%>
<%@page import="java.util.List"%>


<html 
    
    
    <head>
        <title> Cadastro de clientes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
    </head>

    
    <body>
        
        
        
        <ul>
            
            <li><a href="index.html">Página inicial</a><br><hr></li>
            
            <li>
                <a href="javascript:void(0)">Menu de pedidos</a>
                <div>
                    <a href="LancarPedido.jsp">Fazer lançamento de pedidos</a><br>
                    <a href="ListarPedidos.jsp">Fazer listagem de pedidos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            <li>
                <a href="javascript:void(0)">Menu de produtos</a>
                <div>
                    <a href="CadastrarProduto.jsp">Fazer cadastro de produtos</a><br>
                    <a href="ListarProdutos.jsp">Fazer listagem de produtos</a>
                </div>
                <br><br><br>
            </li>
            
            
            
            <li>
                <a href="javascript:void(0)">Menu clientes</a>
                <div>
                    <a href="CadastrarCliente.jsp">Fazer cadastro de cliente</a><br>
                    <a href="ListarClientes.jsp">Fazer cadastro de clientes</a>     
                </div>
                <br><br><br>
            </li>  
            
            
        </ul> 
        
        
        <br><br>
        
        
            
            <legend>Cadastre um cliente:</legend>
            
            
            <form action="cadastrarcliente" method="post">
                <input type="text" name="nome" placeholder="Nome">
                <input type="text" name="email" placeholder="Email">
                <input type="text" name="telefone" placeholder="Telefone">
                <br><br><input class="submitcadastro" type="submit" value="Salvar">
            </form>
            
            
        

    </body>
</html>
