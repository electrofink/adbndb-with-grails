<%@ page import="de.uni_koeln.hs.Name" %>
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
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
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
            <div class="complexDialog">
				<g:form method="post">
					<g:hiddenField name="id" value="${nameInstance?.id}" />
                	<g:hiddenField name="version" value="${nameInstance?.version}" />
                 	<g:hiddenField name="person.id" value="${nameInstance?.person?.id}"  />
					<fieldset>
						<legend>Namen bearbeiten</legend>
							<div>
								<label for="firstName"><g:message code="name.firstName.label" default="Vorname" /></label>
								<g:textField class="value ${hasErrors(bean: nameInstance, field: 'firstName', 'errors')}" name="firstName" value="${nameInstance?.firstName}" />
							</div>
							<div>
								<label for="lastName"><g:message code="name.lastName.label" default="Nachname" /></label>
								<g:textField class="value ${hasErrors(bean: nameInstance, field: 'lastName', 'errors')}" name="lastName" value="${nameInstance?.lastName}" />
							</div>
							<div>
								<label for="other"><g:message code="name.other.label" default="Anderer" /></label>
								<g:textField class="value ${hasErrors(bean: nameInstance, field: 'other', 'errors')}" name="other" value="${nameInstance?.other}" />
							</div>
					</fieldset>
					<div class="buttons">
                    	<span class="button"><g:actionSubmit class="update" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    	<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                	</div>
				</g:form>
			</div>
		</div>
    </body>
</html>
