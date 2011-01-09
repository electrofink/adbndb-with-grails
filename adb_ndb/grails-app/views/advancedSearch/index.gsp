<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'advanced.label', default: 'Advanced Search')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<style type="text/css" media="screen">
.myProp {padding: 5px; float: left;}
</style>
</head>
<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" condivoller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" condivoller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
        </div>
	<g:form action="index">
		<div class="complexDialog">
					<div class="myProp">
						<label for="name">Name</label>
						<g:textField name="name" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="gender">Geschlecht</label>
						<g:checkBox name="gender" value="${false}" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="birth">Geburtsdatum</label>
						<g:textField name="birth" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="death">Sterbedatum</label>
						<g:textField name="death" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="confession">Konfession</label>
						<g:textField name="confession" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="work">Werk</label>
						<g:textField name="work" />
					</div>
					<div style="clear:left;"></div>
					<div class="myProp">
						<label for="locations">Ort</label>
						<g:textField name="location" />
						<label for="begin">Beginn</label>
						<g:textField name="locationBegin" />
						<label for="end">Ende</label>
						<g:textField name="locationEnd" />
					</div>
			<div style="clear:left;"></div>
			
		</div>
		<span class="searchButton">
			<g:actionSubmit	class="search" value="Person(en) finden" action="result" />
		</span>
	</g:form>
</body>
</html>