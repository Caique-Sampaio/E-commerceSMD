<%-- 
    Document   : gerenciarCompras
    Created on : 22/10/2019, 15:49:18
    Author     : Iago Gomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include file="../componentes/head.jsp" %>
    </head>

    <body>
        <header>
            <%@include file="../componentes/cabecalhoAdmin.jsp" %>
        </header>

        <div class="content">

            <section>

                <div class="container-fluid">

                    <div class="row py-3 px-3">
                        <%@include file="../componentes/navMenuAdmin.jsp" %>
                        
                        
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
<!--                            Se ocorrer algum erro mostra mensagem  -->
                            <c:if test="${not empty feedbackNegativoListagem}" >
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <p class="text-danger">${ feedbackNegativoListagem }</p>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            
                            <!-- Histórico de compras -->
                            <div class="card card-cascade narrower d-none" id="collapse-historico">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Histórico de compras</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircompras">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dthistorico">
                                        <thead class="thead-light">
                                            <tr>
                                                
                                                <th scope="col">Data</th>
                                                <th scope="col">Cliente</th>
                                                
                                                <th scope="col">Produto(s)</th>
                                                <th scope="col">Quantidade(s)</th>
                                                <th scope="col">Valor da compra</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="compra" items="${gerenciaCompraTipoList}">
                                                <tr>

                                                    <td class="align-middle text-center">${ compra.data_compra }</td>
                                                    <td class="align-middle text-center">${ compra.cliente}</td>
                                                    <!-- <fmt:formatNumber value = "${produto.preco}" type = "currency"/> -->
                                                    
                                                    <td class="align-middle text-center">
                                                        <c:forEach var="produto" items="${compra.produtosList}">
                                                            ${produto} <br/>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        <c:forEach var="quantidade" items="${compra.quantidadeList}">
                                                            ${quantidade} <br/>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        ${compra.valorTotal}
                                                    </td>
                                                    
                                                </tr>
                                            </c:forEach>
                                            

                                        </tbody>
                                    </table>
                                </div>


                            </div>
                            <!-- Remover compras -->
                            <div class="modal fade" id="excluircompras" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover compra</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover essa(s) compra(s) do cliente?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
        <%@include file="../componentes/rodape.jsp" %>

    </body>

</html>

