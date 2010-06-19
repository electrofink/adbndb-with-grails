
<%@ page import="de.uni_koeln.hki.thaller.Name" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'name.label', default: 'Name')}" />
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
            <g:hasErrors bean="${nameInstance}">
            <div class="errors">
                <g:renderErrors bean="${nameInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${nameInstance?.id}" />
                <g:hiddenField name="version" value="${nameInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstNames"><g:message code="name.firstNames.label" default="First Names" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nameInstance, field: 'firstNames', 'errors')}">
                                    <g:textField name="firstNames" value="${nameInstance?.firstNames}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="name.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nameInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${nameInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthName"><g:message code="name.birthName.label" default="Birth Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nameInstance, field: 'birthName', 'errors')}">
                                    <g:textField name="birthName" value="${nameInstance?.birthName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="person"><g:message code="name.person.label" default="Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nameInstance, field: 'person', 'errors')}">
                                    <g:select name="person.id" from="${de.uni_koeln.hki.thaller.Person.list()}" optionKey="id" value="${nameInstance?.person?.id}"  />
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
