/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.Cliente;
import model.Pedido;
import util.JpaUtil;

/**
 *
 * @author edivaner
 */
public class ClienteDAO implements InterfaceDAO{
    @Override
    public boolean incluir(Object o) throws Exception {
        boolean retorno = false;
        EntityManager em = new JpaUtil().getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(o);
            em.getTransaction().commit();
            retorno = true;
        } finally {
            em.close();
        }
        return retorno;
    }

    
    @Override
    public boolean editar(Object o) throws Exception {
        boolean retorno = false;
        EntityManager em = new JpaUtil().getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(o);
            em.getTransaction().commit();
            retorno = true;
        } finally {
            em.close();
        }
        return retorno;
    }

    
    @Override
    public boolean excluir(Integer id) throws Exception {
        boolean retorno = false;
        EntityManager em = new JpaUtil().getEntityManager();
        try {
            Cliente c = em.find(Cliente.class, id);
            em.getTransaction().begin();
            em.remove(c);
            em.getTransaction().commit();
            retorno = true;
        } finally {
            em.close();
        }
        return retorno;
    }

    
    /**
     *
     * @param id
     * @return
     */
    @Override
    public Cliente pesquisarPorId(Integer id) {
        EntityManager em = new JpaUtil().getEntityManager();
        Cliente c = null;
        try {
            c = em.find(Cliente.class, id);
        } finally {
            em.close();
        }
        return c;
    }

    
    @Override
    public List<Object> listar() throws Exception {
        List<Object> lista = null;
        EntityManager em = new JpaUtil().getEntityManager();
        try {
            lista = em.createQuery("from CLiente c").getResultList();
        } finally {
            em.close();
        }
        return lista;
    }
    

    
    @Override
    public List<Object> listar2() throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Cliente.findAll");
        List<Object> clientes = query.getResultList();
        return clientes;
    }
    
    
    
    public List<Cliente> listarPorNome(String nome) throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        TypedQuery<Cliente> query = em.createNamedQuery("Cliente.findNome", Cliente.class);
        return query.setParameter("nome", '%' + nome + '%').getResultList();
    }
    
    
    
    public List<Cliente> listar3() throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Cliente.findAll");
        List<Cliente> clientes = query.getResultList();
        return clientes;
    }
}
