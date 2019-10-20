<%@page import="br.com.smd.ecommerce.modelo.Administrador"%>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@page import="br.com.smd.ecommerce.modelo.Categoria"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/w/bs4/jq-3.3.1/jszip-2.5.0/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-html5-1.5.6/b-print-1.5.6/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.css" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/mdb.min.css">
        <!--CSS -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Admin</title>
    </head>

    <body>
        <header>
            <div class="container-fluid mb-3">
                <!-- Navbar principal -->
                <div class="row shadow justify-content-start">
                    <div class="col-12">
                        <!--Navbar -->
                        <nav class="mb-1 navbar navbar-light shadow-none">
                            <!-- Menu -->
                            <button class="navbar-toggler order-sm-1 order-md-1 d-lg-none" id="menuresponsivo" type="button"
                                    data-toggle="collapse" data-target="#navbarSupportedContent"
                                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <!-- Logo -->
                            <a class="navbar-brand mr-auto mr-md-0 order-sm-2 order-md-2 order-lg-1" href="admin.jsp">
                                <img src="img/logocor.png" alt="Transparent MDB Logo" id="animated-img1">
                            </a>
                            <!-- Conteúdo do menu -->
                            <div class="collapse navbar-collapse order-sm-4 order-md-5 py-3" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <h5>Nossos produtos</h5>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="categoria.jsp">Smartphones
                                            <span class="sr-only">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="categoria.jsp">Notebooks</a>
                                    </li>
                                    <li class="nav-item border-bottom border-lg-0 mb-3">
                                        <a class="nav-link" href="categoria.jsp">PCs</a>
                                    </li>
                                    <!-- Itens que somem no tamanho sm-->
                                    <li class="nav-item d-sm-none">
                                        <h5>Conta</h5>
                                    </li>

                                    <%-- S� mostra sair se o usu�rio estiver logado --%>

                                    <%
                                        if (session.getAttribute("usuario") != null) {
                                    %> 
                                    <li class="nav-item d-sm-none">
                                        <a class="nav-link" href="#">Minha conta</a>
                                    </li>
                                    <%
                                        };
                                    %>
                                    <li class="nav-item d-sm-none">
                                        <a class="nav-link" href="favoritos.jsp">Meus favoritos</a>
                                    </li>
                                    <li class="nav-item d-sm-none">
                                        <a class="nav-link" href="carrinho.jsp">Meu carrinho</a>
                                    </li>
                                    <li class="nav-item border-bottom border-lg-0 mb-3 d-sm-none">
                                        <a class="nav-link" href="/logout">Sair</a>
                                    </li>
                                </ul>
                                <form class="d-md-none form-row">
                                    <div class="input-group md-form my-0">
                                        <input type="search" class="form-control" placeholder="Pesquisar"
                                               aria-label="Pesquisar" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn-sm btn-dark" type="button" id="inputGroupFileAddon">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Conta -->
                            <ul class="navbar-nav nav-flex-icons d-none d-sm-inline-flex order-sm-3 order-md-4 order-lg-4">
                                <li class="nav-item dropdown mx-1 mx-lg-2">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>

                                    </a>
                                    <div class="dropdown-menu dropdown-menu-left dropdown-default"
                                         aria-labelledby="navbarDropdownMenuLink-333">

                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logout">Sair</a>
                                    </div>

                                <li>
                                    <div>
                                        <%
                                            String msg = (String) request.getAttribute("msg");
                                            Administrador adm = (Administrador) session.getAttribute("usuario");
                                            if (adm != null) {
                                        %>
                                        <small>   Bem vindo <br> </small> 
                                        <small>   <%=  adm.getLogin()%> </small> 
                                        <%  }%>
                                    </div>
                                </li>
                                </li>
                            </ul>


                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <div class="content">
            <section>
                <div class="container-fluid">
                    <div class="row py-3 px-3">
                        <div class="col-lg-3 col-md-4 col-sm-3 col-12 p-3 mx-auto order-2 order-sm-1">
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-dadosadmin">Meus
                                dados</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-cadastros">Gerenciar
                                cadastros</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-compras">Gerenciar
                                compras</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-produtos">Gerenciar
                                produtos</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-categorias">Gerenciar
                                categorias</button>
                            <div class="dropdown">
                                <button type="button" class="btn btn-outline-dark btn-block mx-0 dropdown-toggle"
                                        role="button" data-display="static" id="dropdownMenuLink" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                    Gerar
                                    relatório
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio1">Total de compras por cliente</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio2">Produtos em falta no estoque</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio3">Total de valor recebido</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio4">Exportar relatório</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                            <!-- Meus Dados  -->
                            <div class="card card-cascade narrower d-none" id="collapse-dadosadmin">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Meus dados</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarconta">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluirconta">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>
                                <form class="py-3 mx-4">
                                    <div class="form-group">
                                        <label for="exampleInputNome1">Nome Completo</label>
                                        <input type="nome" class="form-control" id="exampleInputNome1"
                                               placeholder="Nome do cliente">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Endereço de email</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1"
                                               aria-describedby="emailHelp" placeholder="Email do cliente">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputLogin1">Login</label>
                                        <input type="login" class="form-control" id="exampleInputLogin1"
                                               placeholder="Login do cliente">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Senha</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1"
                                               placeholder="Senha do cliente">
                                    </div>

                                </form>

                            </div>
                            <!-- Alterar conta -->
                            <div class="modal fade" id="alterarconta" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar meus dados</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe um novo nome completo</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                            <label for="textInput">Informe um novo email</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                            <label for="textInput">Informe um novo login</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                            <label for="textInput">Informe uma nova senha</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                            <label for="textInput">Repita a nova senha</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover conta -->
                            <div class="modal fade" id="excluirconta" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Excluir conta</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja excluir sua conta?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Gerenciar clientes -->
                            <div class="card card-cascade narrower d-none" id="collapse-cadastros">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Clientes</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircadastros">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtcadastros">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Login</th>
                                                <th scope="col">Senha</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                            </div>
                            <!-- Remover compras -->
                            <div class="modal fade" id="excluircadastros" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover cliente(s)</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover esse(s) clientes(s)?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                                <th></th>
                                                <th scope="col">Data</th>
                                                <th scope="col">Cliente</th>
                                                <th scope="col">Preço</th>
                                                <th scope="col">Produto(s)</th>
                                                <th scope="col">Quantidade(s)</th>
                                                <th scope="col">Valor da compra</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

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
                            <!-- Listar produtos -->
                            <div class="card card-cascade narrower d-none" id="collapse-produtos">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos no estoque</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserirprod">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarprod">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluirprod">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtprodutos">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Foto</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Preço</th>
                                                <th scope="col">Quantidade</th>
                                                <th scope="col">Categoria(s)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celulare</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG4</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- Inserir novo produto -->
                            <div class="modal fade" id="inserirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Inserir produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">

                                            <label for="textInput">Adicione uma imagem ao
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                    <label class="custom-file-label" for="inputGroupFile02"
                                                           aria-describedby="inputGroupFileAddon02"></label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text"
                                                          id="inputGroupFileAddon02">Carregar</span>
                                                </div>
                                            </div>

                                            <label for="textInput">Informe um preço</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Quantia">
                                            </div>

                                            <label for="customRange3">Quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                    <option value="1">Um</option>
                                                    <option value="2">Dois</option>
                                                    <option value="3">Três</option>
                                                    <option value="4">Quatro</option>
                                                    <option value="5">Cinco</option>
                                                    <option value="6">Seis</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Alterar produto -->
                            <div class="modal fade" id="alterarprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma nova descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">

                                            <label for="textInput">Atualize a imagem do
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                    <label class="custom-file-label" for="inputGroupFile02"
                                                           aria-describedby="inputGroupFileAddon02"></label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text"
                                                          id="inputGroupFileAddon02">Carregar</span>
                                                </div>
                                            </div>

                                            <label for="textInput">Informe um novo preço</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Quantia">
                                            </div>

                                            <label for="customRange3">Informe a nova quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) nova(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                    <option value="1">Um</option>
                                                    <option value="2">Dois</option>
                                                    <option value="3">Três</option>
                                                    <option value="4">Quatro</option>
                                                    <option value="5">Cinco</option>
                                                    <option value="6">Seis</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover produto -->
                            <div class="modal fade" id="excluirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover esse(s) produto(s) do estoque?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Listar categorias -->
                            <div class="card card-cascade narrower d-none" id="collapse-categorias">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Categorias</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserircat">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarcat">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircat">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>

                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtcategorias">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Descri��o</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="categoria" items="${listacategorias}">
                                                <tr>
                                                    <td></td>
                                                    <td><c:out value="${categoria.descricao}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- Inserir nova categoria -->
                            <form action="inserircategoria" method="post">
                                <div class="modal fade" id="inserircat" tabindex="-1" role="dialog"
                                     aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Inserir categoria</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <label for="textInput">Informe uma descrição</label>
                                                <input name="descricao" type="text" id="textInput" class="form-control mb-4">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-dark">Salvar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- Alterar categoria -->
                            <div class="modal fade" id="alterarcat" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar categoria</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma nova descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover categoria -->
                            <div class="modal fade" id="excluircat" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover essa(s) categoria(s)?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Gerar relatório 1 -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio1">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Total de compras por cliente e por período</a>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio1">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Cliente</th>
                                                <th scope="col">Compras</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>


                            </div>
                            <!-- Gerar relatório 2 -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio2">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos faltando em estoque</a>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio2">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Preço</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>


                            </div>
                            <!-- Gerar relatório 3 -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio3">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Total de valor recebido por dia</a>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio3">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Data</th>
                                                <th scope="col">Valor total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer>
            <div class="container-fluid fixed-bottom">
                <div class="row align-items-center justify-content-center">
                    <div class="col bg-primary">
                        <p class="text-center text-light my-1">2019 © Todos os direitos reservados.</p>
                    </div>
                </div>
            </div>
        </footer>


        <!-- jQuery primeiro, depois Popper.js -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <!-- Bootstrap JS  -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript"
        src="https://cdn.datatables.net/w/bs4/jq-3.3.1/jszip-2.5.0/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-html5-1.5.6/b-print-1.5.6/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.js"></script>
        <!-- MDBootstrap -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Javascript-->
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>