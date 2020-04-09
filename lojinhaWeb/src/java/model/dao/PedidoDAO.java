/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import model.Pedido;
import util.JpaUtil;

/**
 *
 * @author edivaner
 */
public class PedidoDAO implements InterfaceDAO{
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
            Pedido p = em.find(Pedido.class, id);
            em.getTransaction().begin();
            em.remove(p);
            em.getTransaction().commit();
            retorno = true;
        } finally {
            em.close();
        }
        return retorno;
    }

    
    @Override
    public Pedido pesquisarPorId(Integer id) {
        EntityManager em = new JpaUtil().getEntityManager();
        Pedido p = null;
        try {
            p = em.find(Pedido.class, id);
        } finally {
            em.close();
        }
        return p;
    }

    
    @Override
    public List<Object> listar() throws Exception {
        List<Object> lista = null;
        EntityManager em = new JpaUtil().getEntityManager();
        try {
            lista = em.createQuery("from Pedido p").getResultList();
        } finally {
            em.close();
        }
        return lista;
    }

    
    @Override
    public List<Object> listar2() {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Pedido.findAll");
        List<Object> pedidos = query.getResultList();
        return pedidos;
    }
    
    
    public List<Pedido> listar3() {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Pedido.findAll");
        List<Pedido> pedidos = query.getResultList();
        return pedidos;
    }
}
