
<%@ page import="de.uni_koeln.hki.thaller.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
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
            <g:hasErrors bean="${locationInstance}">
            <div class="errors">
                <g:renderErrors bean="${locationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person"><g:message code="location.person.label" default="Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'person', 'errors')}">
                                    <g:select name="person.id" from="${de.uni_koeln.hki.thaller.Person.list()}" optionKey="id" value="${locationInstance?.person?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="start"><g:message code="location.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'start', 'errors')}">
                                    <g:datePicker name="start" precision="day" value="${locationInstance?.start}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="location.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${locationInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="location.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${locationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="location.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: locationInstance, field: 'longitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="location.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${fieldValue(bean: locationInstance, field: 'latitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="end"><g:message code="location.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'end', 'errors')}">
                                    <g:datePicker name="end" precision="day" value="${locationInstance?.end}"  />
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
