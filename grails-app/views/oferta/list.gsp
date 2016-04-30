
<%@ page import="subasta.Oferta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oferta.label', default: 'Oferta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-oferta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-oferta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="precio_oferta" title="${message(code: 'oferta.precio_oferta.label', default: 'Preciooferta')}" />
					
						<g:sortableColumn property="ganador" title="${message(code: 'oferta.ganador.label', default: 'Ganador')}" />
					
						<th><g:message code="oferta.subasta.label" default="Subasta" /></th>
					
						<th><g:message code="oferta.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ofertaInstanceList}" status="i" var="ofertaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ofertaInstance.id}">${fieldValue(bean: ofertaInstance, field: "precio_oferta")}</g:link></td>
					
						<td><g:formatBoolean boolean="${ofertaInstance.ganador}" /></td>
					
						<td>${fieldValue(bean: ofertaInstance, field: "subasta")}</td>
					
						<td>${fieldValue(bean: ofertaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ofertaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
