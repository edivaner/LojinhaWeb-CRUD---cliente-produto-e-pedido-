/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import model.Cliente;
import model.Pedido;
import model.Produto;
import util.JpaUtil;

/**
 *
 * @author edivaner
 */
public class ProdutoDAO implements InterfaceDAO{
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
            Produto p = em.find(Produto.class, id);
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
    public Produto pesquisarPorId(Integer id) {
        EntityManager em = new JpaUtil().getEntityManager();
        Produto p = null;
        try {
            p = em.find(Produto.class, id);
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
            lista = em.createQuery("from Produto p").getResultList();
        } finally {
            em.close();
        }
        return lista;
    }
    
      public List<Produto> listarPorNome(String nome) throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        TypedQuery<Produto> query = em.createNamedQuery("Produto.findNome", Produto.class);
        return query.setParameter("nome", '%' + nome + '%').getResultList();
    }

      
    @Override
    public List<Object> listar2() throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Produto.findAll");
        List<Object> produto = query.getResultList();
        return produto;
    }
   
    
    
    public List<Produto> listar3() throws Exception {
        EntityManager em = new JpaUtil().getEntityManager();
        Query query = em.createNamedQuery("Produto.findAll");
        List<Produto> produto = query.getResultList();
        return produto;
    }
}
