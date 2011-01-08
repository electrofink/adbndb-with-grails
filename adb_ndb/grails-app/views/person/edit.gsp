

<%@ page import="de.uni_koeln.hs.Person"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'person.label', default: 'Person')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="nav"><span class="menuButton"><a class="home"
	href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></span>
<span class="menuButton"><g:link class="list" action="list">
	<g:message code="default.list.label" args="[entityName]" />
</g:link></span> <span class="menuButton"><g:link class="create" action="create">
	<g:message code="default.new.label" args="[entityName]" />
</g:link></span></div>
<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
		${flash.message}
	</div>
</g:if> <g:hasErrors bean="${personInstance}">
	<div class="errors"><g:renderErrors bean="${personInstance}"
		as="list" /></div>
</g:hasErrors> <g:form method="post">
	<g:hiddenField name="id" value="${personInstance?.id}" />
	<g:hiddenField name="version" value="${personInstance?.version}" />
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="names"><g:message
					code="person.names.label" default="Namen" /></label></td>
				<g:if test="${!personInstance?.names?.isEmpty()}">
					<td valign="top"
						class="value ${hasErrors(bean: personInstance, field: 'names', 'errors')}">
					<ul>
						<g:each in="${personInstance?.names?}" var="n">
							<li><g:link controller="name" action="edit" id="${n.id}"
							params="['person.id': personInstance?.id]">	${n?.encodeAsHTML()}
							</g:link></li>
						</g:each>
					</ul>
					</td>
					<td valign="top"><g:link controller="name" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'name.label', default: '+ Name')])}
					</g:link></td>
				</g:if>
				<g:else>
					<td valign="top"><g:link controller="name" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'name.label', default: '+ Name')])}
					</g:link></td>
				</g:else>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="dateOfBirth"><g:message
					code="person.dateOfBirth.label" default="Geboren" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personInstance, field: 'dateOfBirth', 'errors')}">
				<g:textField name="dateOfBirth" value="${personInstance?.dateOfBirth}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="dateOfDeath"><g:message
					code="person.dateOfDeath.label" default="Gestorben" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personInstance, field: 'dateOfDeath', 'errors')}">
				<g:textField name="dateOfDeath" value="${personInstance?.dateOfDeath}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="gender"><g:message
					code="person.gender.label" default="Gender" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personInstance, field: 'gender', 'errors')}">
				<g:checkBox name="gender" value="${personInstance?.gender}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="bio"><g:message
					code="person.bio.label" default="Biographie" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: personInstance, field: 'bio', 'errors')}">
				<g:textArea name="bio" cols="40" rows="5"
					value="${personInstance?.bio}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="relations"><g:message
					code="person.relations.label" default="Relations" /></label></td>
				<g:if test="${!personInstance?.relations?.isEmpty()}">
					<td valign="top"
						class="value ${hasErrors(bean: personInstance, field: 'relations', 'errors')}">
					<ul>
						<g:each in="${personInstance?.relations?}" var="r">
							<li><g:link controller="relation" action="show" id="${r.id}">
								${r?.encodeAsHTML()}
							</g:link></li>
						</g:each>
					</ul>
					</td>
					<td valign="top"><g:link controller="relation" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'relation.label', default: '+ Relation')])}
					</g:link></td>
				</g:if>
				<g:else>
					<td valign="top"><g:link controller="relation" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'relation.label', default: '+ Relation')])}
					</g:link></td>
				</g:else>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="confessions"><g:message
					code="person.confessions.label" default="Konfessionen" /></label></td>

				<g:if test="${de.uni_koeln.hs.Confession.list().size() != 0}">
					<td valign="top"
						class="value ${hasErrors(bean: personInstance, field: 'confessions', 'errors')}">
					<g:select name="confessions"
						from="${de.uni_koeln.hs.Confession.list()}" multiple="yes"
						optionKey="id" size="5" value="${personInstance?.confessions*.id}" />
					</td>
					<td valign="top"><g:link controller="confession"
						action="create" params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'confession.label', default: '+ Konfession')])}
					</g:link></td>
				</g:if>
				<g:else>
					<td valign="top"><g:link controller="confession"
						action="create" params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'confession.label', default: '+ Konfession')])}
					</g:link></td>
				</g:else>

			</tr>

			<tr class="prop">
				<td valign="top" class="location"><label for="locations"><g:message
					code="person.locations.label" default="Orte" /></label></td>
				<g:if test="${!personInstance?.locations?.isEmpty()}">
					<td valign="top"
						class="value ${hasErrors(bean: personInstance, field: 'names', 'errors')}">
					<ul>
						<g:each in="${personInstance?.locations?}" var="l">
							<li><g:link controller="personLocations" action="edit"
								params="[person_id:personInstance?.id, location_id:l?.id]">
								${l?.encodeAsHTML()}
							</g:link></li>
						</g:each>
					</ul>
					</td>
					<td valign="top"><g:link controller="location" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'location.label', default: '+ Ort')])}
					</g:link></td>
				</g:if>
				<g:else>
					<td valign="top"><g:link controller="location" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'location.label', default: '+ Ort')])}
					</g:link></td>
				</g:else>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="works"><g:message
					code="person.works.label" default="Werke" /></label></td>
				<g:if test="${de.uni_koeln.hs.Work.list().size() != 0}">
					<td valign="top"
						class="value ${hasErrors(bean: personInstance, field: 'works', 'errors')}">
					<g:select name="works" from="${de.uni_koeln.hs.Work.list()}"
						multiple="yes" optionKey="id" size="5"
						value="${personInstance?.works*.id}" /></td>
					<td valign="top"><g:link controller="work" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'work.label', default: '+ Werk')])}
					</g:link></td>
				</g:if>
				<g:else>
					<td valign="top"><g:link controller="work" action="create"
						params="['person.id': personInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'work.label', default: '+ Werk')])}
					</g:link></td>
				</g:else>


			</tr>

		</tbody>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:actionSubmit
		class="save" action="update"
		value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
	<span class="button"><g:actionSubmit class="delete"
		action="delete"
		value="${message(code: 'default.button.delete.label', default: 'Delete')}"
		onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
	</div>
</g:form></div>
</body>
</html>
