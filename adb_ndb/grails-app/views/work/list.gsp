
<%@ page import="de.uni_koeln.hs.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'work.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="workTitle" title="${message(code: 'work.workTitle.label', default: 'Work Title')}" />
                        
                            <g:sortableColumn property="subtitle" title="${message(code: 'work.subtitle.label', default: 'Subtitle')}" />
                        
                            <g:sortableColumn property="releaseDate" title="${message(code: 'work.releaseDate.label', default: 'Release Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workInstanceList}" status="i" var="workInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workInstance.id}">${fieldValue(bean: workInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: workInstance, field: "workTitle")}</td>
                        
                            <td>${fieldValue(bean: workInstance, field: "subtitle")}</td>
                        
                            <td>${fieldValue(bean: workInstance, field: "releaseDate")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${workInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
