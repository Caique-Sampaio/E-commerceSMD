/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;
import br.com.smd.ecommerce.modelo.Categoria;
import java.util.List;

/**
 *
 * @author Caique
 */
public class CategoriaDAO {

    public void salvarCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            manager.getTransaction().begin();
            manager.persist(c);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }

    public List<Categoria> mostrarCategorias() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Categoria> listaCategoria = null;
        
        try {
            
            listaCategoria = (List<Categoria>)manager.createQuery("FROM TB_CATEGORIA c order by c.categoria_id desc").getResultList();
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: "+ e);
        }finally{
            manager.close();
        }
        return listaCategoria;
    }

    public boolean atualizarCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean alterou = false;
        try {
            System.out.println("id da categoria: "+ c.getCategoria_id());
            manager.getTransaction().begin();
            Categoria newc = (Categoria) manager.find(Categoria.class, c.getCategoria_id());
            newc.setDescricao(c.getDescricao());
            
            if (newc.getCategoria_id() != null) {
                
                manager.merge(newc);
            }
            System.out.println("New C: "+newc);
            manager.getTransaction().commit();
            alterou = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return alterou;
    }

    public boolean removerCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean deletou = false;
        try {
            Categoria toDel = manager.find(Categoria.class, c.getCategoria_id());
            manager.getTransaction().begin();
            manager.remove(toDel);
            manager.getTransaction().commit();
            deletou = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return deletou;
    }
    
    public Categoria selecionarPorId(Long id){
        EntityManager manager = new FabricaDeConexao().getConexao();
        Categoria result = null;
        
        try {
            
            result = (Categoria) manager.find(Categoria.class, id);
            
        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao recuperar uma categoria: "+ e);
        
        }
        return result;
    }

}
