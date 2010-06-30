

<%@ page import="de.uni_koeln.hki.thaller.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
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
            <g:hasErrors bean="${workInstance}">
            <div class="errors">
                <g:renderErrors bean="${workInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${workInstance?.id}" />
                <g:hiddenField name="version" value="${workInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releaseDate"><g:message code="work.releaseDate.label" default="Release Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'releaseDate', 'errors')}">
                                    <g:textField name="releaseDate" value="${workInstance?.releaseDate}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="persons"><g:message code="work.persons.label" default="Persons" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'persons', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subtitle"><g:message code="work.subtitle.label" default="Subtitle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'subtitle', 'errors')}">
                                    <g:textField name="subtitle" value="${workInstance?.subtitle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="work.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${workInstance?.title}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
