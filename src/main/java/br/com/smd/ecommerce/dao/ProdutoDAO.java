/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;
import br.com.smd.ecommerce.modelo.Categoria;
import br.com.smd.ecommerce.modelo.Produto;
import br.com.smd.ecommerce.modelo.ProdutoCategoria;
import br.com.smd.ecommerce.modelo.ProdutoCategoriaId;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.TypedQuery;

/**
 *
 * @author Caique
 */
public class ProdutoDAO {

    public Produto salvarProduto(Produto p, List<Long> listaCategorias ) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {

            manager.getTransaction().begin();
            
                for (Long c : listaCategorias) {

                    Categoria categoria = (Categoria) manager.find(Categoria.class, c);
                    ProdutoCategoria pc = new ProdutoCategoria();

                    pc.setProduto(p);
                    pc.setCategoria(categoria);
                    p.getListaCategorias().add(pc);
                    categoria.getListaProdutos().add(pc);
                    //PC possui o CASCADE MERGE
                    manager.persist(pc);
                }

            manager.getTransaction().commit();

        } catch (Exception ex) {
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }

        return p;
    }

    public List<Produto> mostrarProdutos() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = null;
        try {

            listaProduto = (List<Produto>) manager.createQuery("FROM TB_PRODUTO p order by p.produto_id desc").getResultList();

        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: " + e);
        } finally {
            manager.close();
        }
        return listaProduto;
    }
    public List<Produto> mostrarProdutosEstoque0() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = null;
        try {

            listaProduto = (List<Produto>) manager.createQuery("FROM TB_PRODUTO p WHERE quantidade = 0 order by p.descricao asc").getResultList();

        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: " + e);
        } finally {
            manager.close();
        }
        return listaProduto;
    }
    
    public List<Produto> mostrarProdutosPorCategoria(Long categoriaId) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = null;
        try {
      
        TypedQuery<Produto> query = manager.createQuery(
                "Select p from TB_PRODUTO as p "
                + "join fetch p.listaCategorias lc "
                + "where lc.categoria.categoria_id = :idT", Produto.class )
                .setParameter("idT", categoriaId);
        
        listaProduto = query.getResultList();
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas de produtos para a página: " + e);
            System.out.println("e.get message"+e.getMessage());
        } finally {
            manager.close();
        }
        return listaProduto;
    }
    
    

    public boolean atualizarProduto(Produto p, List<Long>novasCategoriasList ) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean alterou = false;
        try {
            
            manager.getTransaction().begin();
            //Produto a atualizar
            Produto newp = (Produto) manager.find( Produto.class,p.getProduto_id());
            
            newp.setDescricao(p.getDescricao());
            newp.setPreco(p.getPreco());
            newp.setQuantidade(p.getQuantidade());
            
            //Cria os relacionamentos que não existem
            for (Long id : novasCategoriasList) {
                atualizaCategoriaDoProduto(manager, id, p);
            }
            
            if (newp.getProduto_id() != null) {
                //Atualiza
                manager.merge(newp);
            }
            
            manager.getTransaction().commit();
            alterou = true;
            
        } catch (Exception ex) {

            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return alterou;
    }
    
    public void atualizaCategoriaDoProduto(EntityManager manager, Long cid, Produto p){
        
        ProdutoCategoriaId pcId = new ProdutoCategoriaId(p.getProduto_id(), cid);
        ProdutoCategoria find = manager.find(ProdutoCategoria.class, pcId);
        
        //Se não existe esta relação no banco...
        if (find == null){
            
            Categoria c = manager.find(Categoria.class, cid);
            
            //Cria um novo relacionamento entre o produto e categoria
            ProdutoCategoria pc = new ProdutoCategoria(p, c);
            //Salva o relacionamento
            manager.persist(pc);
            
        } else {
            //Se não é nulo o relacionamento existe;
        }
        
        
    }

    public boolean deletarProduto(Produto p) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean deletou = false;
        try {
            manager.getTransaction().begin();
            
                p = manager.find(Produto.class,p.getProduto_id());
                p.getListaCategorias().size();
                p.getListaCategorias().clear();
              
                manager.remove(p);
                manager.getTransaction().commit();
            deletou = true;
        } catch (Exception ex) {
            System.err.println("Erro ao deletar produto: "+ ex);
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return deletou;
    }
    
    public boolean removerCategoriasDoProduto (long produtoId){
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean removeuTodas = false;
        Produto p = new Produto();
        
        try {
            
            manager.getTransaction().begin();

                p = manager.find(Produto.class, produtoId);
                //Retira o relacionamento de produto e de categoria
                 
                for (ProdutoCategoria pc : p.getListaCategorias()) {
                    pc.getCategoria().getListaProdutos().remove(pc);
                }
                p.getListaCategorias().clear();
                manager.merge(p);
 
            manager.getTransaction().commit();

            removeuTodas = true;

        } catch (Exception e) {
            
            manager.getTransaction().rollback();
            System.out.println("Deu erro ao deletar todas as categorias: "+ e);
            
        } finally{
            manager.close();
        }
        return removeuTodas;
    }

    public Produto salvarFoto(Long produto_id, String caminhoFoto) {
        
        EntityManager manager = new FabricaDeConexao().getConexao();
        Produto p = null;
        try {
            manager.getTransaction().begin();
            p = manager.find(Produto.class, produto_id);
            p.setFoto(caminhoFoto);
            //p.getProdutoEmCompras();
            manager.merge(p);
            manager.getTransaction().commit();

        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao atualizar a foto: " + e);
        } finally {
            manager.close();
        }
        return p;
    }

    public Produto encontrarProdutoPorId(Long id) {
        
        EntityManager manager = new FabricaDeConexao().getConexao();
        Produto p = null;
        
        try {
            
            p = manager.find(Produto.class, id);
             
        } catch (Exception e) {
            
            manager.getTransaction().rollback();
            System.out.println("Ocorreu um erro ao buscar um produto: "+ e);
            
        } finally {
            manager.close();
        }
        
        return p;
    }

    public boolean atualizaQuantidade(Long idProduto, Integer quantidadeDaCompra) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean atualizou = false;
        try {
            manager.getTransaction().begin();
            
                Produto p = (Produto)manager.find(Produto.class, idProduto);
                p.setQuantidade(p.getQuantidade()-quantidadeDaCompra);
                manager.merge(p);
                
            manager.getTransaction().commit();
            atualizou = true;
                
        } catch (Exception e) {
            manager.getTransaction().rollback();
        }finally {
            manager.close();
        }
        
        return atualizou;
    }

    public List<Produto> listarProdutosEmFalta() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = new ArrayList<>();
        try {
            
            manager.getTransaction().begin();
           
                TypedQuery<Produto> query = manager.createQuery(
                     "Select p from TB_PRODUTO as p "
                     + "where p.quantidade <= 10", Produto.class );

                listaProduto = query.getResultList();
                
            manager.getTransaction().commit();
           
        } catch (Exception e) {
            
            System.out.println("Erro"+ e);
            manager.getTransaction().rollback();
            
        } finally {
            manager.close();
        }
        
        return listaProduto;
    }

}
