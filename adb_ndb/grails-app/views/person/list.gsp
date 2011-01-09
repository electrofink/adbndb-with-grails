<%@ page import="de.uni_koeln.hs.Person" %>
<%@ page import="util.DateUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
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
                        
                            <g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="dateOfBirth" title="${message(code: 'person.dateOfBirth.label', default: 'Geboren')}" />
                        
                            <g:sortableColumn property="dateOfDeath" title="${message(code: 'person.dateOfDeath.label', default: 'Gestorben')}" />
                        
                            <g:sortableColumn property="bio" title="${message(code: 'person.bio.label', default: 'Biographie')}" />
                        
                            <%--<g:sortableColumn property="gender" title="${message(code: 'person.gender.label', default: 'Gender')}" />--%>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${personInstance.names}</g:link></td>
                        	
                        	<g:if test="${personInstance?.dateOfBirth != null}">
                           		<g:set  var="dateBirth" value="${DateUtil.getStringFromDate(personInstance?.dateOfBirth)}" scope="page" />
                           		<td valign="top" class="value">${dateBirth}</td>
                           	</g:if><g:else>
                           		<td valign="top" class="value">unbekannt</td>
                           	</g:else>
                        	
                        	<g:if test="${personInstance?.dateOfDeath != null}">
                           		<g:set  var="dateDeath" value="${DateUtil.getStringFromDate(personInstance?.dateOfDeath)}" scope="page" />
                           		<td valign="top" class="value">${dateDeath}</td>
                           	</g:if><g:else>
                           		<td valign="top" class="value">unbekannt</td>
                           	</g:else>
                        
                            <td>${personInstance.shortBio()}</td>
                        
							<%-- <td><g:formatBoolean boolean="${personInstance.gender}" /></td>--%>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
