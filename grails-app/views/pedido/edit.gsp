

<%@ page import="snack.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pedidoInstance?.id}" />
                <g:hiddenField name="version" value="${pedidoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="pedido.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="128" value="${pedidoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estatus"><g:message code="pedido.estatus.label" default="Estatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'estatus', 'errors')}">
                                    <g:select name="estatus" from="${pedidoInstance.constraints.estatus.inList}" value="${pedidoInstance?.estatus}" valueMessagePrefix="pedido.estatus"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
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
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="create" action="nuevaOrden" value="Nueva orden" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
