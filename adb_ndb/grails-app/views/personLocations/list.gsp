
<%@ page import="de.uni_koeln.hs.PersonLocations" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personLocations.label', default: 'PersonLocations')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'personLocations.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'personLocations.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'personLocations.endDate.label', default: 'End Date')}" />
                        
                            <th><g:message code="personLocations.location.label" default="Location" /></th>
                        
                            <th><g:message code="personLocations.person.label" default="Person" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personLocationsInstanceList}" status="i" var="personLocationsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personLocationsInstance.id}">${fieldValue(bean: personLocationsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personLocationsInstance, field: "startDate")}</td>
                        
                            <td>${fieldValue(bean: personLocationsInstance, field: "endDate")}</td>
                        
                            <td>${fieldValue(bean: personLocationsInstance, field: "location")}</td>
                        
                            <td>${fieldValue(bean: personLocationsInstance, field: "person")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personLocationsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
