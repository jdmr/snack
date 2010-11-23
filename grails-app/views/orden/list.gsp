
<%@ page import="snack.Orden" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'orden.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cantidad" title="${message(code: 'orden.cantidad.label', default: 'Cantidad')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'orden.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'orden.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <th><g:message code="orden.pedido.label" default="Pedido" /></th>
                        
                            <th><g:message code="orden.producto.label" default="Producto" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ordenInstanceList}" status="i" var="ordenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ordenInstance.id}">${fieldValue(bean: ordenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ordenInstance, field: "cantidad")}</td>
                        
                            <td><g:formatDate date="${ordenInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${ordenInstance.lastUpdated}" /></td>
                        
                            <td>${fieldValue(bean: ordenInstance, field: "pedido")}</td>
                        
                            <td>${fieldValue(bean: ordenInstance, field: "producto")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ordenInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
