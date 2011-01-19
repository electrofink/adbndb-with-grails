

<%@ page import="de.uni_koeln.hs.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
<%--            <h1><g:message code="default.create.label" args="[entityName]" /></h1>--%>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${workInstance}">
            <div class="errors">
                <g:renderErrors bean="${workInstance}" as="list" />
            </div>
            </g:hasErrors>
	            <div class="complexDialog">
					<g:form action="save">
	                 	<g:hiddenField name="person.id" value="${nameInstance?.person?.id}"  />
						<fieldset>
							<legend>Werk anlegen</legend>
								<div>
									<label for="workTitle"><g:message code="work.workTitle.label" default="Werkname" /></label>
									<g:textField class="value ${hasErrors(bean: workInstance, field: 'workTitle', 'errors')}" name="workTitle" value="${workInstance?.workTitle}" />
								</div>
								<div>
									<label for="subtitle"><g:message code="work.subtitle.label" default="Untertitel" /></label>
									 <g:textField class="value ${hasErrors(bean: workInstance, field: 'subtitle', 'errors')}" name="subtitle" value="${workInstance?.subtitle}" />
								</div>
								<div>
									<label for="releaseDateAsString"><g:message code="work.releaseDateAsString.label" default="Ver&ouml;ffentlichung" /></label>
									<g:textField class="value ${hasErrors(bean: workInstance, field: 'releaseDateAsString', 'errors')}" name="releaseDateAsString" value="${workInstance?.releaseDateAsString}" />
								</div>
						</fieldset>
						<div class="buttons">
	                    	<span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	                	</div>
					</g:form>
				</div>
        </div>
    </body>
</html>
