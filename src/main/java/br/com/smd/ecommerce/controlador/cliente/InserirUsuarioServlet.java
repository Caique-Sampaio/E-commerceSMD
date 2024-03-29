/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.cliente;

import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
@WebServlet("/novoUsuario")
public class InserirUsuarioServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        UsuarioDAO usuarioDAO;
        usuarioDAO = new UsuarioDAO();
        
       try {
           
           String n = request.getParameter("nome");
           String e = request.getParameter("endereco");
           String em = request.getParameter("email");
           String l = request.getParameter("login");
           String s = request.getParameter("senha");
           String cs = request.getParameter("confirmaSenha");  
           
 
           // Usuario e senha não podem ser vazios
           if (l.isEmpty() || s.isEmpty() ) {
               System.out.println("Campos não podem ser cadastrados vazios");
               request.setAttribute("erroView", "Preencha os campos obrigatórios");
               request.getRequestDispatcher("login.jsp").forward(request, response);
               return;
            }
           
            //Não pode criar um novo usuário com login ou email já cadastrados no banco
            if ( (usuarioDAO.consultarPorEmail(em)!= null) || (usuarioDAO.consultarPorLogin(l)!=null) ){
                System.out.println("login ou email já estão em uso");
                request.setAttribute("erroView", "Login ou email já está(ão) em uso");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
           
           //Se as senhas digitadas são iguais...
           if (s.equals(cs)){
                //Crie um novo usuário
                Usuario u = new Usuario();
                u.setNome(n);
                u.setEndereco(e);
                u.setLogin(l);
                u.setSenha(s);
                u.setEmail(em);
                
                //Tente salva-lo no banco
                boolean salvo = usuarioDAO.salvar(u);
                
                //Encriptar senha
                //String encriptSenha = BCrypt.withDefaults().hashToString(12, s.toCharArray());
                //System.out.println("encript senha: "+ encriptSenha);
                
               if (salvo){
                   
                   System.out.println("Novo usuário criado com sucesso!"+ u.toString());
                   request.setAttribute("novoUsMsg", "Cadastro realizado com sucesso!");
                   request.getRequestDispatcher("login.jsp").forward(request, response);
                   
                } else {
                   
                    System.out.println("Ocorreu um erro ao salvar novo usuário:  " + e);
                    response.sendRedirect("erro.jsp");  
                }
                
            } else {
           
               request.setAttribute("erroView", "Senhas incompatíveis");
               request.getRequestDispatcher("login.jsp").forward(request, response);
               
            }
           
        } catch(IOException e){
           
           System.out.println("Houve exceção ao tentar criar novo usuário" + e);
           response.sendRedirect("erro.jsp");      
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
