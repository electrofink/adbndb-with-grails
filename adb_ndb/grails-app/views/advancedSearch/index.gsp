<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'advanced.label', default: 'Advanced Search')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
	  		<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	  		<span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
	   		<span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
	  	</div>
	  	<div id="pageBody">
	  	<h1>Erweiterte Suche</h1>
	  	<div class="complexDialog">
			<g:form controller="advancedSearch">
				<fieldset>
					<legend>Name(n)/Geschlecht/Lebensdaten</legend>
						<div>
							<label for="name">Name</label>
							<g:textField name="name" />
						</div>
						<div>
							<label for="gender">Geschlecht</label>
							<g:checkBox style="margin-left: -20%;" name="gender" value="${false}" />
						</div>
						<div>
							<label for="birth">Geburtsdatum</label>
							<g:textField name="birth" />
						</div>
						<div>
							<label for="death">Sterbedatum</label>
							<g:textField name="death" />
						</div>
				</fieldset>
				<fieldset>
					<legend>Konfession/Werk(e)</legend>
						<div>
							<label for="confession">Konfession</label>
							<g:select name="confessionType" from="${de.uni_koeln.hs.Confession.list(sort:'confessionType')}" optionKey="id" value="${confessionInstance?.id}"  />
						</div>
						<div>
							<label for="work">Werk</label>
							<g:textField name="work" />
						</div>
				</fieldset>
				<fieldset>
					<legend>Stadt/Land</legend>
						<div>
							<label for="locations">Ort</label>
							<g:textField name="location" />
						</div>
						<div>
							<label for="begin">Von</label>
							<g:textField name="locationBegin" />
						</div>
						<div>
							<label for="end">Bis</label>
							<g:textField name="locationEnd" />
						</div>
				</fieldset>
				<div class="buttons">
                   <span class="button"><g:actionSubmit class="search" value="Person(en) finden" action="result"/></span>
                </div>
		</g:form>
		</div>
		</div>
	</body>
</html>