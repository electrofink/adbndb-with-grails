
<%@ page import="de.uni_koeln.hki.thaller.Confession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'confession.label', default: 'Confession')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${confessionInstance}">
            <div class="errors">
                <g:renderErrors bean="${confessionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="confession.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${confessionInstance?.title}" />
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
                                    <label for="start"><g:message code="confession.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'start', 'errors')}">
                                    <g:datePicker name="start" precision="day" value="${confessionInstance?.start}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="end"><g:message code="confession.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: confessionInstance, field: 'end', 'errors')}">
                                    <g:datePicker name="end" precision="day" value="${confessionInstance?.end}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
