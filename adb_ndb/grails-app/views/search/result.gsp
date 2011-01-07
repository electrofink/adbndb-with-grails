<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'search.label', default: 'Search')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


<ol>
	<g:each in="${personInstanceList}" status="i" var="item">
		<li><g:link controller="person" action="show" id="${item.id}">${item.names}</g:link></li>
	</g:each>
</ol>
</body>
</html>