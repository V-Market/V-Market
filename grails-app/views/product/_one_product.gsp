<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 04/06/2015
  Time: 6:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%--<g:form role="form">--%>
    <div class="center">
        <a href="">
            <img src="${createLink(controller:"product", action:"showProductImage", id:"${productInstance.id}")}" class=" img-rounded center-block" alt="Product image" width=auto height="150" />
        </a>
    </div>
    <br>
    <div class="h_line"></div>
    <div>
        <g:form>
        <p class="text-center" style="color: #006dba">
            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
        </p>

        <p class="text-center" style="color: #000000">
            <span class="property-value" aria-labelledby="trademark-label"><g:fieldValue bean="${productInstance}" field="trademark"/></span>
        </p>

        <p class="text-center" style="color: #3e8f3e">
            <span class="property-value" aria-labelledby="prize-label"><g:fieldValue bean="${productInstance}" field="prize"/></span> COP
        </p>
        <div class="text-center">
        <g:hiddenField name="id" value="${productInstance.id}"/>
                <g:if test="${session.carrito.products.find{it.id==productInstance.id} == null}">
                    <g:actionSubmit action="addProductToCarrito" class="btn btn-success" value="Agregar Producto"><span class="glyphicon glyphicon-cart-tick"></span></g:actionSubmit>
                </g:if>
                <g:else>
                    <g:actionSubmit action="removeProductFromCarrito" class="btn btn-danger" value="Eliminar Producto"><span class="glyphicon glyphicon-cart-tick"></span></g:actionSubmit>
                </g:else>
        </g:form>
        </div>
    </div>

<%--</g:form>--%>
