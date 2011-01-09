<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'search.label', default: 'Search')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
        </div>
<g:form action="index">
	<div class="dialog">
	<table>
			<tr class="prop">
				<td valign="top" class="name"><label for="search">Suche</label></td>
				<td valign="top" class="value"><g:textField name="query" /></td>
			</tr>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:actionSubmit
		class="" value="find" action="result" /></span></div>
</g:form>
</body>
</html>
