<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
   
    <%@include file="componentes/head.jsp" %>

    <body>
        <!-- CABE�ALHO -->
        <%@include file="componentes/cabecalho.jsp" %>

        <div class="content">
            <section>
                <div class="container-fluid">
                    <!--Banner-->
                    <div class="row py-0 px-0">
                        <div class="col-6 px-0">
                            <img src="img/Slider/slide2.png" class="img-fluid" alt="Imagem responsiva">
                        </div>
                        <div class="col-6 px-0">
                            <img src="img/Slider/slide3.png" class="img-fluid" alt="Imagem responsiva">
                        </div>
                    </div>
                    <!--Titulo-->
                    <div class="row pt-5 pb-0 px-3">
                        <div class="col">
                            <span class="h4">Ofertas da semana</span>
                            <hr class="bg-dark">
                        </div>
                    </div>
                    <!--Produtos recomendados-->
                    <div class="row pt-3 pb-3 px-3">
                        <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                            <div class="card border-warning">
                                <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                                <div class="card-body">
                                    <a href="produto.jsp">
                                        <h5 class="card-title">Produto</h5>
                                    </a>
                                    <p class="card-text">Descri��o</p>
                                    <p class="card-text">Pre�o</p>
                                    <a href="#" class="btn btn-primary"><i class="fas fa-heart"></i></a>
                                    <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section>
        </div>

        <!-- RODAP� -->
        <%@include file="componentes/rodape.jsp" %>

    </body>

</html>