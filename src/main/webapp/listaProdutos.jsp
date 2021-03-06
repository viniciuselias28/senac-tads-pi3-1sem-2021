<%-- 
    Document   : listaProdutos
    Created on : 07/05/2021, 19:53:43
    Author     : Beto
--%>

<%@page import="java.util.List"%>
<%@page import="entidade.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Produto</title>
        <link rel="stylesheet" href="assets/css/listaProdutos.css"/>
         <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="icon" type="imagem/png" href="assets/img/pinterest_profile_image.png" />
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                crossorigin="anonymous"></script>

        <script type="text/javascript">
            function mostraTelaConfirmacao(id) {
                console.log("id", id);
                $("#idProduto").val(id);

                var modalConfirmacao = $("#modalConfirmacao");
                modalConfirmacao.show();
            }

            function fecharTelaConfirmacao() {
                $("#modalConfirmacao").hide();
            }

            function deletarProduto() {
                var id = $("#idProduto").val();
                fecharTelaConfirmacao();
                console.log("id", id);
                  $.ajax("RemoverProdutoServlet?id=" + id).done(function () {
                         location.reload();
                      })
                      .fail(function () {
                        console.log("error");
						$("#alerta").css("display", "block");
						setTimeout(function() {
						   $("#alerta").css("display", "none"); 
						}, 1000);
                      });
                      
            }
        </script>
    </head>
    <body>
       
         <c:import url="nav.jsp"/>
          
        <h1>Produtos:</h1>
        
        <table class="table table-dark table-striped">
            <th>ID</th>
            <th>Nome</th>
            <th>Data de Fabricação</th>
            <th>Data de Vencimento</th>
            <th>Preço</th>
            <th>Alterar</th>
            <th>Excluir</th>
            
            <c:forEach items="${listaProdutos}" var="produto">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.nome}</td>
                    <td>${produto.dataFabricacao}</td>
                    <td>${produto.dataVencimento}</td>
                     <td>${produto.preco}</td>
                    
                    <td><a href="AtualizarProdutoServlet?id=${produto.id}">Alterar</a></td>
                    <td><button type="button" class="btn btn-link" onclick="mostraTelaConfirmacao('${produto.id}')">Excluir</button></td>
                </tr>        
            </c:forEach>
        </table>
        <!-- Modal -->
        <div class="modal" id="modalConfirmacao">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirma Exclusão</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <p>Confirmar exclusão do Produto?</p>
                  <input type="hidden" id="idProduto"/>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="fecharTelaConfirmacao()">Cancelar</button>
                  <button type="button" class="btn btn-primary" onclick="deletarProduto()">Confirmar</button>
              </div>
            </div>
          </div>
        </div>  
      
         <c:import url="footer.jsp"/>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    </body>
</html>
