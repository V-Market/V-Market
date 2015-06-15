<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 04/06/2015
  Time: 6:19 PM
--%>


<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card card-container-register" style="color: #000000">
    <a href="">
        <img class="img-thumbnail center-block" src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" width='150'/>
    </a>
    <hr style="background-color: #000000;height: 1px">
    <div class="text-center">
        <p><strong><g:fieldValue bean="${productInstance}" field="name"/></strong></p>
        <p><g:fieldValue bean="${productInstance}" field="trademark"/> </p>
        <p><strong>$ </strong><g:fieldValue bean="${productInstance}" field="price"/> </p>
    </div>
    <input class="product-rate" data-readonly="true" value="<g:fieldValue bean="${productInstance}" field="rating"/>">
    <br>
    <g:form>
        <g:hiddenField name="id" value="${productInstance.id}"/>
        <g:if test="${session.carrito.products.find{it.id==productInstance.id} == null}">
            <g:actionSubmit action="addProductToCarrito" class="btn btn-success" value="Agregar Producto"><span class="glyphicon glyphicon-cart-tick"></span></g:actionSubmit>
        </g:if>
        <g:else>
            <g:actionSubmit action="removeProductFromCarrito" class="btn btn-danger" value="Eliminar Producto"><span class="glyphicon glyphicon-cart-tick"></span></g:actionSubmit>
        </g:else>
    </g:form>
</div>


