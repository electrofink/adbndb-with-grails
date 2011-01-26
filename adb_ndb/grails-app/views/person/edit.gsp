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
	<div class="nav">
   		<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    	<span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
     	<span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
	</div>
<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
		${flash.message}
	</div>
</g:if> <g:hasErrors bean="${personInstance}">
	<div class="errors"><g:renderErrors bean="${personInstance}"
		as="list" /></div>
</g:hasErrors> 
	<div class="complexDialog2">
				<g:form method="post">
					<g:hiddenField name="id" value="${personInstance?.id}" />
					<g:hiddenField name="version" value="${personInstance?.version}" />
                 	<g:hiddenField name="person.id" value="${nameInstance?.person?.id}"  />
					<fieldset>
						<legend>Name(n)</legend>
						<div id="columnOne">
							<label for="names"><g:message code="person.names.label" default="Namen" /></label>
						</div>
						<g:if test="${!personInstance?.names?.isEmpty()}">
								<div id="columnTwo">
									<ul>
										<g:each in="${personInstance?.names?}" var="n">
											<li>
												<g:link controller="name" action="edit" id="${n.id}" params="['person.id': personInstance?.id]">
													${n?.encodeAsHTML()}
												</g:link>
											</li>
										</g:each>
									</ul>
								</div>
								<div id="columnThree">
									<g:link controller="name" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'name.label', default: '+ Name')])}
									</g:link>
								</div>
							</g:if>
							<g:else>
								<div>
									<g:link controller="name" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'name.label', default: '+ Name')])}
									</g:link>
								</div>
							</g:else>
					</fieldset>
					<fieldset>
						<legend>Lebensdaten</legend>
							<div id="columnOne">
								<label for="dateOfBirthString"><g:message code="person.dateOfBirthString.label" default="Geboren" /></label>
							</div>
							<div>
								<g:textField class="value ${hasErrors(bean: personInstance, field: 'dateOfBirthString', 'errors')}" name="dateOfBirthString" value="${personInstance?.dateOfBirthString}" />
							</div>
							<div id="columnOne">
								<label for="dateOfDeathString"><g:message code="person.dateOfDeathString.label" default="Gestorben" /></label>
							</div>
							<div>
								<g:textField class="value ${hasErrors(bean: personInstance, field: 'dateOfDeathString', 'errors')}" name="dateOfDeathString" value="${personInstance?.dateOfDeathString}" />
							</div>		
					</fieldset>
					<fieldset>
						<legend>Geschlecht</legend>
						<div class="value ${hasErrors(bean: personInstance, field: 'gender', 'errors')}">
							<label for="gender"><g:message code="person.gender.label" default="Geschlecht" /></label>
							m&auml;nnlich<g:radio name="gender" value="${true}" checked="${personInstance?.gender}" />
							weiblich<g:radio name="gender" value="${false}" checked="${!personInstance?.gender}" />
						</div>
					</fieldset>
					<fieldset>
						<legend>Biographie</legend>
							<g:textArea class="value ${hasErrors(bean: personInstance, field: 'bio', 'errors')}" name="bio" cols="40" rows="6" value="${personInstance?.bio}" />
					</fieldset>
					<fieldset>
						<legend>Relationen</legend>
						<div id="columnOne">
							<label for="relations"><g:message code="person.relations.label" default="Relationen" /></label>
						</div>
							<g:if test="${!personInstance?.relations?.isEmpty()}">
								<div id="columnTwo">
									<ul>
										<g:each in="${personInstance?.relations?}" var="r">
											<li>
												<g:link controller="relation" action="edit" id="${r?.id}">
													${r?.encodeAsHTML()}
												</g:link>
											</li>
										</g:each>
									</ul>
								</div>
								<div id="columnThree">
									<g:link controller="relation" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'relation.label', default: '+ Relation')])}
									</g:link>
								</div>
							</g:if>
							<g:else>
								<div>
									<g:link controller="relation" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'relation.label', default: '+ Relation')])}
									</g:link>
								</div>
							</g:else>
					</fieldset>
					<fieldset>
						<legend>Konfession</legend>
						<div id="columnOne">
							<label for="confessions"><g:message	code="person.confessions.label" default="Konfessionen" /></label>
						</div>
							<g:if test="${de.uni_koeln.hs.Confession.list().size() != 0}">
								<div id="columnTwo">
									<g:select name="confessions" from="${de.uni_koeln.hs.Confession.list(sort:'confessionType')}" multiple="yes" optionKey="id" size="5" value="${personInstance?.confessions*.id}"  />
								</div>
								<div id="columnThree">
									<g:link controller="confession" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'confession.label', default: '+ Konfession')])}
									</g:link>
								</div>
							</g:if>
							<g:else>
								<div>
									<g:link controller="confession"	action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'confession.label', default: '+ Konfession')])}
									</g:link>
								</div>
							</g:else>
					</fieldset>
					<fieldset>
						<legend>Orte</legend>
						
						<div id="columnOne">
							<label for="locations"><g:message code="person.locations.label" default="Orte" /></label>
						</div>
							<g:if test="${!personInstance?.locations?.isEmpty()}">
								<div id="columnTwo">
									<ul>
										<g:each in="${personInstance?.locations?}" var="l">
											<li>
												<g:link controller="personLocations" action="edit" params="[person_id:personInstance?.id, location_id:l?.id]">
													${l?.encodeAsHTML()}: <%=personInstanceLocationsList.find{ it.location.id == l?.id }%>
												</g:link>
											</li>
										</g:each>
									</ul>
								</div>
								<div id="columnThree">
									<g:link controller="location" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'location.label', default: '+ Ort')])}
									</g:link>
								</div>
							</g:if>
							<g:else>
								<div>
									<g:link controller="location" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'location.label', default: '+ Ort')])}
									</g:link>
								</div>
							</g:else>
					</fieldset>
					<fieldset>
						<legend>Werke</legend>
						<div id="columnOne">
							<label for="works"><g:message code="person.works.label" default="Werke" /></label>
						</div>
							<g:if test="${de.uni_koeln.hs.Work.list().size() != 0}">
								<div id="columnTwo">
									<g:select name="works" from="${de.uni_koeln.hs.Work.list(sort:'workTitle')}" multiple="yes" optionKey="id" size="5" value="${personInstance?.works*.id}" />
								</div>
								<div id="columnThree">
									<g:link controller="work" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'work.label', default: '+ Werk')])}
									</g:link>
								</div>
							</g:if>
							<g:else>
								<div>
									<g:link controller="work" action="create" params="['person.id': personInstance?.id]">
										${message(code: 'default.add.label', args: [message(code: 'work.label', default: '+ Werk')])}
									</g:link>
								</div>
							</g:else>
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
