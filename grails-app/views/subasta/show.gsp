
<%@ page import="subasta.Subasta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subasta.label', default: 'Subasta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subasta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subasta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subasta">
			
				<g:if test="${subastaInstance?.duracion_minutos}">
				<li class="fieldcontain">
					<span id="duracion_minutos-label" class="property-label"><g:message code="subasta.duracion_minutos.label" default="Duracionminutos" /></span>
					
						<span class="property-value" aria-labelledby="duracion_minutos-label"><g:fieldValue bean="${subastaInstance}" field="duracion_minutos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.precio_ganador}">
				<li class="fieldcontain">
					<span id="precio_ganador-label" class="property-label"><g:message code="subasta.precio_ganador.label" default="Precioganador" /></span>
					
						<span class="property-value" aria-labelledby="precio_ganador-label"><g:fieldValue bean="${subastaInstance}" field="precio_ganador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="subasta.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:formatBoolean boolean="${subastaInstance?.estado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.descripcion_subasta}">
				<li class="fieldcontain">
					<span id="descripcion_subasta-label" class="property-label"><g:message code="subasta.descripcion_subasta.label" default="Descripcionsubasta" /></span>
					
						<span class="property-value" aria-labelledby="descripcion_subasta-label"><g:fieldValue bean="${subastaInstance}" field="descripcion_subasta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.fecha_creacion}">
				<li class="fieldcontain">
					<span id="fecha_creacion-label" class="property-label"><g:message code="subasta.fecha_creacion.label" default="Fechacreacion" /></span>
					
						<span class="property-value" aria-labelledby="fecha_creacion-label"><g:formatDate date="${subastaInstance?.fecha_creacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.oferta}">
				<li class="fieldcontain">
					<span id="oferta-label" class="property-label"><g:message code="subasta.oferta.label" default="Oferta" /></span>
					
						<g:each in="${subastaInstance.oferta}" var="o">
						<span class="property-value" aria-labelledby="oferta-label"><g:link controller="oferta" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subastaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="subasta.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${subastaInstance?.usuario?.id}">${subastaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subastaInstance?.id}" />
					<g:link class="edit" action="edit" id="${subastaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
