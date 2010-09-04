

<%@ page import="de.uni_koeln.hki.thaller.Relation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relation.label', default: 'Relation')}" />
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
            <g:hasErrors bean="${relationInstance}">
            <div class="errors">
                <g:renderErrors bean="${relationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${relationInstance?.id}" />
                <g:hiddenField name="version" value="${relationInstance?.version}" />
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
                                  <label for="startRelation"><g:message code="relation.startRelation.label" default="Start Relation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'startRelation', 'errors')}">
                                    <g:textField name="startRelation" value="${relationInstance?.startRelation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endRelation"><g:message code="relation.endRelation.label" default="End Relation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationInstance, field: 'endRelation', 'errors')}">
                                    <g:textField name="endRelation" value="${relationInstance?.endRelation}" />
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
