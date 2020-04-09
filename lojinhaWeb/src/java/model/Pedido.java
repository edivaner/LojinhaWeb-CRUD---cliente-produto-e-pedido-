/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 *
 * @author edivaner
 */

@Entity
@NamedQuery(name="Pedido.findAll", query="SELECT p FROM Pedido p")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String data;
    private String status;
    private Cliente cliente;
    
    
    @OneToMany (cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    private List<Item> itens;

    
    public Pedido(String data, String status, List<Item> itens, Cliente cliente) {
        this.data = data;
        this.status = status;
        this.itens = itens;
        this.cliente = cliente;
    }

    
    public Pedido() {
    }

    
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    
    public String getData() {
        return data;
    }

    
    public void setData(String data) {
        this.data = data;
    }

    
    public String getStatus() {
        return status;
    }

    
    public void setStatus(String status) {
        this.status = status;
    }

    
    public List<Item> getItens() {
        return itens;
    }

    
    public void setItens(List<Item> itens) {
        this.itens = itens;
    }

    
    public String getCliente() {
        return cliente.getNome();
    }

    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    
    @Override
    public String toString() {
        return "ID : " + id +
                "</br> Data : " + data + 
                "</br> Status : " + status +
                "</br> Cliente : " + cliente.getNome() +
                "</br> Itens : " + itens ;
    }
    
    
    public float calcularTotal(List<Item> itens){
        float total=0;
        
        for(Item i: itens){
            total = total + i.getPreco()*i.getQuant();
        }
        return total;
    }
}
