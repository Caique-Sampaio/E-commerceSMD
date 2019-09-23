package br.com.smd.ecommerce;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;

public class EcommerceSMDApplication {
    public static void main(String[] args) {
        // Execute esta fun��o para gerar o banco 
        EntityManager manager = new FabricaDeConexao().getConexao();
        manager.close();     
    }
}
