
<%@ page import="de.uni_koeln.hs.Relation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relation.label', default: 'Relation')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'relation.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="directRelation" title="${message(code: 'relation.directRelation.label', default: 'Direct Relation')}" />
                        
                            <th><g:message code="relation.person.label" default="Person" /></th>
                        
                            <th><g:message code="relation.relatedPerson.label" default="Related Person" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${relationInstanceList}" status="i" var="relationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${relationInstance.id}">${fieldValue(bean: relationInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${relationInstance.directRelation}" /></td>
                        
                            <td>${fieldValue(bean: relationInstance, field: "person")}</td>
                        
                            <td>${fieldValue(bean: relationInstance, field: "relatedPerson")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${relationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
