
<%@ page import="snack.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pedido.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'pedido.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="estatus" title="${message(code: 'pedido.estatus.label', default: 'Estatus')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'pedido.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'pedido.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pedidoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: pedidoInstance, field: "estatus")}</td>
                        
                            <td><g:formatDate date="${pedidoInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${pedidoInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pedidoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
