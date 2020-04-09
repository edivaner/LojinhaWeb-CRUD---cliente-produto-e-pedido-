/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author edivaner
 */

@Entity
@NamedQueries({
    @NamedQuery(name="Produto.findAll", query="SELECT p FROM Produto p"),
    @NamedQuery(name="Produto.findNome", query="SELECT c FROM Produto c where c.descricao like :nome")
})
public class Produto {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String descricao;
    private float preco;
    private int quant;

    
    public Produto(String descricao, float preco, int quant) {
        this.descricao = descricao;
        this.preco = preco;
        this.quant = quant;
    }

    
    public Produto() {
    }

    
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    
    public String getDescricao() {
        return descricao;
    }

    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
    public float getPreco() {
        return preco;
    }

  
    public void setPreco(float preco) {
        this.preco = preco;
    }

    
    public int getQuant() {
        return quant;
    }

    
    public void setQuant(int quant) {
        this.quant = quant;
    }
}
