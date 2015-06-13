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
            <img  src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" width='260' height="200"/>
        </a>
    </div>
    <br>
    <div class="h_line"></div>
    <div>
        <p class="text-center" style="color: #006dba">
            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
        </p>

        <p class="text-center" style="color: #000000">
            <span class="property-value" aria-labelledby="trademark-label"><g:fieldValue bean="${productInstance}" field="trademark"/></span>
        </p>

        <p class="text-center" style="color: #3e8f3e">
            <span class="property-value" aria-labelledby="prize-label"><g:fieldValue bean="${productInstance}" field="prize"/></span> COP
        </p>
    </div>
<%--</g:form>--%>
