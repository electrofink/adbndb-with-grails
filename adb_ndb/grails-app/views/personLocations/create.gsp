

<%@ page import="de.uni_koeln.hs.PersonLocations"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'personLocations.label', default: 'PersonLocations')}" />
<title><g:message code="default.create.label"
	args="[entityName]" /></title>
</head>
<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
        </div>
<div class="body">
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if> <g:hasErrors bean="${personLocationsInstance}">
	<div class="errors"><g:renderErrors
		bean="${personLocationsInstance}" as="list" /></div>
</g:hasErrors> <g:form action="save">
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="startDate"><g:message
					code="personLocations.startDate.label" default="Start Date" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personLocationsInstance, field: 'startDate', 'errors')}">
				<g:textField name="startDate"
					value="${personLocationsInstance?.startDate}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="endDate"><g:message
					code="personLocations.endDate.label" default="End Date" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personLocationsInstance, field: 'endDate', 'errors')}">
				<g:textField name="endDate"
					value="${personLocationsInstance?.endDate}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="location"><g:message
					code="personLocations.location.label" default="Location" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personLocationsInstance, field: 'location', 'errors')}">
				<g:select name="location.id"
					from="${de.uni_koeln.hs.Location.list()}" optionKey="id"
					value="${personLocationsInstance?.location?.id}" />
					<g:link controller="location" action="create"
					params="['personLocations.id': personLocationsInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}
				</g:link></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="person"><g:message
					code="personLocations.person.label" default="Person" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personLocationsInstance, field: 'person', 'errors')}">
				<g:select name="person.id" from="${de.uni_koeln.hs.Person.list()}"
					optionKey="id" value="${personLocationsInstance?.person?.id}" />
				</td>
			</tr>

		</tbody>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:submitButton
		name="create" class="save"
		value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	</div>
</g:form></div>
</body>
</html>
