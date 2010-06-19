
<%@ page import="de.uni_koeln.hki.thaller.Confession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'confession.label', default: 'Confession')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'confession.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'confession.title.label', default: 'Title')}" />
                        
                            <th><g:message code="confession.person.label" default="Person" /></th>
                   	    
                            <g:sortableColumn property="start" title="${message(code: 'confession.start.label', default: 'Start')}" />
                        
                            <g:sortableColumn property="end" title="${message(code: 'confession.end.label', default: 'End')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${confessionInstanceList}" status="i" var="confessionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${confessionInstance.id}">${fieldValue(bean: confessionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: confessionInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: confessionInstance, field: "person")}</td>
                        
                            <td><g:formatDate date="${confessionInstance.start}" /></td>
                        
                            <td><g:formatDate date="${confessionInstance.end}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${confessionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
