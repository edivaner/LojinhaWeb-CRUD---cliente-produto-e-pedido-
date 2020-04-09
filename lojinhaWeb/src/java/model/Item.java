/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

/**
 *
 * @author edivaner
 */

@Entity
@NamedQuery(name="Item.findAll", query="SELECT i FROM Item i")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private int idProduto;
    private int quant;
    private float preco;
    private List<Item> itens;

    public Item(int idProduto, int quant, float preco) {
        this.idProduto = idProduto;
        this.quant = quant;
        this.preco = preco;
    }

    
    public Item() {
    }

    
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    
    public int getIdProduto() {
        return idProduto;
    }

    
    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    
    public int getQuant() {
        return quant;
    }

    
    public void setQuant(int quant) {
        this.quant = quant;
    }

    
    public float getPreco() {
        return preco;
    }

    
    public void setPreco(float preco) {
        this.preco = preco;
    }

    
    @Override
    public String toString() {
        return "Item{" + "idProduto=" + idProduto + ", quant=" + quant + ", preco=" + preco + '}';
    }
}
