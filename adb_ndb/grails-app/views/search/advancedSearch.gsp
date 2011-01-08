<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'advanced.label', default: 'Advanced Search')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<g:form action="index">
	<div class="dialog">
	<table>
			<tr class="prop">
				<td valign="top" class="name"><label for="name">Name</label></td>
				<td valign="top" class="value"><g:textField name="name" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="gender">Geschlecht</label></td>
				<td valign="top" class="value">
				<g:checkBox name="gender" value="${false}" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="birth">Geburtsdatum</label></td>
				<td valign="top" class="value"><g:textField name="birth" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="death">Sterbedatum</label></td>
				<td valign="top" class="value"><g:textField name="death" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="confession">Konfession</label></td>
				<td valign="top" class="value"><g:textField name="confession" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="work">Werk</label></td>
				<td valign="top" class="value"><g:textField name="work" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="locations">Ort</label></td>
				<td valign="top" class="value"><g:textField name="location" /></td>
				<td valign="top" class="name"><label for="begin">Beginn</label></td>
				<td valign="top" class="value"><g:textField name="begin" /></td>
				<td valign="top" class="name"><label for="end">Ende</label></td>
				<td valign="top" class="value"><g:textField name="end" /></td>
			</tr>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:actionSubmit
		class="" value="find" action="result" /></span></div>
</g:form>
</body>
</html>