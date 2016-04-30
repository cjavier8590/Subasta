
<%@ page import="subasta.Subasta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subasta.label', default: 'Subasta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subasta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subasta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="duracion_minutos" title="${message(code: 'subasta.duracion_minutos.label', default: 'Duracionminutos')}" />
					
						<g:sortableColumn property="precio_ganador" title="${message(code: 'subasta.precio_ganador.label', default: 'Precioganador')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'subasta.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="descripcion_subasta" title="${message(code: 'subasta.descripcion_subasta.label', default: 'Descripcionsubasta')}" />
					
						<g:sortableColumn property="fecha_creacion" title="${message(code: 'subasta.fecha_creacion.label', default: 'Fechacreacion')}" />
					
						<th><g:message code="subasta.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subastaInstanceList}" status="i" var="subastaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subastaInstance.id}">${fieldValue(bean: subastaInstance, field: "duracion_minutos")}</g:link></td>
					
						<td>${fieldValue(bean: subastaInstance, field: "precio_ganador")}</td>
					
						<td><g:formatBoolean boolean="${subastaInstance.estado}" /></td>
					
						<td>${fieldValue(bean: subastaInstance, field: "descripcion_subasta")}</td>
					
						<td><g:formatDate date="${subastaInstance.fecha_creacion}" /></td>
					
						<td>${fieldValue(bean: subastaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subastaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
