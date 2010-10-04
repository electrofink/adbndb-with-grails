<%@ page import="de.uni_koeln.hki.thaller.Person"%>
<%@ page import="de.uni_koeln.hki.thaller.Name"%>
<%@ page import="de.uni_koeln.hki.thaller.Confession"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'person.label', default: 'Person')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="nav"><span class="menuButton"><a class="home"
	href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></span>
<span class="menuButton"><g:link class="create" action="create">
	<g:message code="default.new.label" args="[entityName]" />
</g:link></span></div>
<div class="body">
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if>
<div class="list">
<table>
	<thead>
		<tr>

			<g:sortableColumn property="id"
				title="${message(code: 'person.id.label', default: 'Id')}" />

			<g:sortableColumn property="personLastname" title="Name" />

			<%--<g:sortableColumn property="personFirstnames" title="First Names" /> --%>


			<g:sortableColumn property="personConfessions" title="Confession" />

			<%-- <g:sortableColumn property="personRelations" title="Relation" />--%>
			<th><g:message code="person.relations.label" default="Relation" /></th>

			<g:sortableColumn property="dateOfBirth"
				title="${message(code: 'person.dateOfBirth.label', default: 'Date Of Birth')}" />

			<g:sortableColumn property="dateOfDeath"
				title="${message(code: 'person.dateOfDeath.label', default: 'Date Of Death')}" />

			<th><g:message code="person.bio.label" default="Bio" /></th>

			<%-- <g:sortableColumn property="gender"
				title="${message(code: 'person.gender.label', default: 'Gender')}" />--%>

		</tr>
	</thead>
	<tbody>
		<g:each in="${personInstanceList}" status="i" var="personInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${personInstance.id}">
					${fieldValue(bean: personInstance, field: "id")}
				</g:link></td>

				<td>
				<ul>
					<g:each in="${personInstance?.names}" var="ln">
						<g:if test="${fn?.lastName != ''}">
							<li>
							${ln?.lastName}
							</li>
						</g:if>
					</g:each>
					<%--${fieldValue(bean: personInstance.names, field: "lastName")}--%>
				</ul>
				</td>

				<%--<td>
				<ul>
					<g:each in="${personInstance?.names}" var="fn">
						<g:if test="${fn?.firstNames != ''}">
							<li>
							${fn?.firstNames}
							</li>
						</g:if>
					</g:each>
				</ul>
				</td> --%>



				<td>

					<g:each in="${personInstance?.confessions}" var="con">
						<g:if test="${con?.title != ''}">
							${con?.title}
						</g:if>
					</g:each>
				</td>


				<%--${fieldValue(bean: personInstance.confessions, field: "title")} --%>
				</td>

				<td>
						<g:each in="${personInstance.relations}" var="r">
							<g:if test="${r?.relatedPerson != null}">
									<g:link controller="interface" action="show"
										id="${r?.relatedPerson?.id}">
									Person: ${r?.relatedPerson?.id}
									</g:link>
									<br/>
							</g:if>
						</g:each>
				<%-- ${fieldValue(bean: personInstance.relations.relatedPerson.names, field: "lastName")}--%>
				</td>

				<td>
				${fieldValue(bean: personInstance, field: "dateOfBirth")}
				</td>

				<td>
				${fieldValue(bean: personInstance, field: "dateOfDeath")}
				</td>

				<td>
				${personInstance?.shortBio()}...</td>

				<%--<td>
					<g:if test="${personInstance.gender == true}">
     					m&auml;nnlich
					</g:if> 
					<g:else>
    					 weiblich
					</g:else>
				</td> --%>
			</tr>
		</g:each>
	</tbody>
</table>
</div>
<div class="paginateButtons"><g:paginate
	total="${personInstanceTotal}" /></div>
</div>
</body>
</html>
