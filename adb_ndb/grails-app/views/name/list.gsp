
<%@ page import="de.uni_koeln.hs.Name" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'name.label', default: 'Name')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'name.id.label', default: 'Id')}" />
                        
                            <th><g:message code="name.person.label" default="Person" /></th>
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'name.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'name.lastName.label', default: 'Last Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nameInstanceList}" status="i" var="nameInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nameInstance.id}">${fieldValue(bean: nameInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: nameInstance, field: "person")}</td>
                        
                            <td>${fieldValue(bean: nameInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: nameInstance, field: "lastName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nameInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
