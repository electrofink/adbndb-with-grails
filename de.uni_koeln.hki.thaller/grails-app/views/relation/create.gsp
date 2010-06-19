
<%@ page import="de.uni_koeln.hki.thaller.Relation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relation.label', default: 'Relation')}" />
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
            <g:hasErrors bean="${relationInstance}">
            <div class="errors">
                <g:renderErrors bean="${relationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relatedPerson"><g:message code="relation.relatedPerson.label" default="Related Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'relatedPerson', 'errors')}">
                                    <g:select name="relatedPerson.id" from="${de.uni_koeln.hki.thaller.Person.list()}" optionKey="id" value="${relationInstance?.relatedPerson?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="directRelation"><g:message code="relation.directRelation.label" default="Direct Relation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'directRelation', 'errors')}">
                                    <g:checkBox name="directRelation" value="${relationInstance?.directRelation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person"><g:message code="relation.person.label" default="Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'person', 'errors')}">
                                    <g:select name="person.id" from="${de.uni_koeln.hki.thaller.Person.list()}" optionKey="id" value="${relationInstance?.person?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="start"><g:message code="relation.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'start', 'errors')}">
                                    <g:datePicker name="start" precision="day" value="${relationInstance?.start}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="end"><g:message code="relation.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'end', 'errors')}">
                                    <g:datePicker name="end" precision="day" value="${relationInstance?.end}"  />
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
