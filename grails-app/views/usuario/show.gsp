
<%@ page import="subasta.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.primer_nombre}">
				<li class="fieldcontain">
					<span id="primer_nombre-label" class="property-label"><g:message code="usuario.primer_nombre.label" default="Primernombre" /></span>
					
						<span class="property-value" aria-labelledby="primer_nombre-label"><g:fieldValue bean="${usuarioInstance}" field="primer_nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.segundo_nombre}">
				<li class="fieldcontain">
					<span id="segundo_nombre-label" class="property-label"><g:message code="usuario.segundo_nombre.label" default="Segundonombre" /></span>
					
						<span class="property-value" aria-labelledby="segundo_nombre-label"><g:fieldValue bean="${usuarioInstance}" field="segundo_nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.primer_apellido}">
				<li class="fieldcontain">
					<span id="primer_apellido-label" class="property-label"><g:message code="usuario.primer_apellido.label" default="Primerapellido" /></span>
					
						<span class="property-value" aria-labelledby="primer_apellido-label"><g:fieldValue bean="${usuarioInstance}" field="primer_apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.segundo_apellido}">
				<li class="fieldcontain">
					<span id="segundo_apellido-label" class="property-label"><g:message code="usuario.segundo_apellido.label" default="Segundoapellido" /></span>
					
						<span class="property-value" aria-labelledby="segundo_apellido-label"><g:fieldValue bean="${usuarioInstance}" field="segundo_apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.dpi}">
				<li class="fieldcontain">
					<span id="dpi-label" class="property-label"><g:message code="usuario.dpi.label" default="Dpi" /></span>
					
						<span class="property-value" aria-labelledby="dpi-label"><g:fieldValue bean="${usuarioInstance}" field="dpi"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="usuario.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${usuarioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="usuario.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${usuarioInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="usuario.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${usuarioInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.contrasenna}">
				<li class="fieldcontain">
					<span id="contrasenna-label" class="property-label"><g:message code="usuario.contrasenna.label" default="Contrasenna" /></span>
					
						<span class="property-value" aria-labelledby="contrasenna-label"><g:fieldValue bean="${usuarioInstance}" field="contrasenna"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fecha_nacimiento}">
				<li class="fieldcontain">
					<span id="fecha_nacimiento-label" class="property-label"><g:message code="usuario.fecha_nacimiento.label" default="Fechanacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fecha_nacimiento-label"><g:formatDate date="${usuarioInstance?.fecha_nacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="usuario.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${usuarioInstance?.municipio?.id}">${usuarioInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.nombre_usuario}">
				<li class="fieldcontain">
					<span id="nombre_usuario-label" class="property-label"><g:message code="usuario.nombre_usuario.label" default="Nombreusuario" /></span>
					
						<span class="property-value" aria-labelledby="nombre_usuario-label"><g:fieldValue bean="${usuarioInstance}" field="nombre_usuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.oferta}">
				<li class="fieldcontain">
					<span id="oferta-label" class="property-label"><g:message code="usuario.oferta.label" default="Oferta" /></span>
					
						<g:each in="${usuarioInstance.oferta}" var="o">
						<span class="property-value" aria-labelledby="oferta-label"><g:link controller="oferta" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.subasta}">
				<li class="fieldcontain">
					<span id="subasta-label" class="property-label"><g:message code="usuario.subasta.label" default="Subasta" /></span>
					
						<g:each in="${usuarioInstance.subasta}" var="s">
						<span class="property-value" aria-labelledby="subasta-label"><g:link controller="subasta" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.tipo_usuario}">
				<li class="fieldcontain">
					<span id="tipo_usuario-label" class="property-label"><g:message code="usuario.tipo_usuario.label" default="Tipousuario" /></span>
					
						<span class="property-value" aria-labelledby="tipo_usuario-label"><g:link controller="tipo_Usuario" action="show" id="${usuarioInstance?.tipo_usuario?.id}">${usuarioInstance?.tipo_usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
