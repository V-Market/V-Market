<%@ page import="v.market.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'trademark', 'error')} required">
	<label for="trademark">
		<g:message code="product.trademark.label" default="Trademark" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="trademark" required="" value="${productInstance?.trademark}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'prize', 'error')} required">
	<label for="prize">
		<g:message code="product.prize.label" default="Prize" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prize" value="${fieldValue(bean: productInstance, field: 'prize')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'shops', 'error')} required">
	<label for="shops">
		<g:message code="product.shops.label" default="Shops" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shops" required="" value="${productInstance?.shops}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'imageByte', 'error')} required">
	<label for="imageByte">
		<g:message code="product.urlImageProduct.label" default="imageByte" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="imageByte" required="" value="${productInstance?.imageByte}"/>

</div>

