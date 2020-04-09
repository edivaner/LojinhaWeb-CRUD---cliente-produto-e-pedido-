/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.Pedido;
import model.Produto;
import model.Cliente;


/**
 *
 * @author edivaner
 */
public interface InterfaceDAO {
    
    public abstract boolean incluir(Object o) throws Exception;

    public abstract boolean editar(Object o) throws Exception;

    public abstract boolean excluir(Integer id) throws Exception;

    public abstract Object pesquisarPorId(Integer id);
    

    public abstract List<Object> listar() throws Exception;
    
    
    public abstract List<Object> listar2() throws Exception;
}
