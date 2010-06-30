

<%@ page import="de.uni_koeln.hki.thaller.Confession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'confession.label', default: 'Confession')}" />
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
            <g:hasErrors bean="${confessionInstance}">
            <div class="errors">
                <g:renderErrors bean="${confessionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${confessionInstance?.id}" />
                <g:hiddenField name="version" value="${confessionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="start"><g:message code="confession.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'start', 'errors')}">
                                    <g:textField name="start" value="${confessionInstance?.start}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="end"><g:message code="confession.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'end', 'errors')}">
                                    <g:textField name="end" value="${confessionInstance?.end}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="person"><g:message code="confession.person.label" default="Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'person', 'errors')}">
                                    <g:select name="person.id" from="${de.uni_koeln.hki.thaller.Person.list()}" optionKey="id" value="${confessionInstance?.person?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="confession.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${confessionInstance?.title}" />
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
