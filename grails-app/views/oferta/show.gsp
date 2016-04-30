
<%@ page import="subasta.Oferta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oferta.label', default: 'Oferta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-oferta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-oferta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list oferta">
			
				<g:if test="${ofertaInstance?.precio_oferta}">
				<li class="fieldcontain">
					<span id="precio_oferta-label" class="property-label"><g:message code="oferta.precio_oferta.label" default="Preciooferta" /></span>
					
						<span class="property-value" aria-labelledby="precio_oferta-label"><g:fieldValue bean="${ofertaInstance}" field="precio_oferta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ofertaInstance?.ganador}">
				<li class="fieldcontain">
					<span id="ganador-label" class="property-label"><g:message code="oferta.ganador.label" default="Ganador" /></span>
					
						<span class="property-value" aria-labelledby="ganador-label"><g:formatBoolean boolean="${ofertaInstance?.ganador}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ofertaInstance?.subasta}">
				<li class="fieldcontain">
					<span id="subasta-label" class="property-label"><g:message code="oferta.subasta.label" default="Subasta" /></span>
					
						<span class="property-value" aria-labelledby="subasta-label"><g:link controller="subasta" action="show" id="${ofertaInstance?.subasta?.id}">${ofertaInstance?.subasta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ofertaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="oferta.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${ofertaInstance?.usuario?.id}">${ofertaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ofertaInstance?.id}" />
					<g:link class="edit" action="edit" id="${ofertaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
