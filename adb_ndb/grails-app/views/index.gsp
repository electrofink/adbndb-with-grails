<html>
<head>
<title>ADB NDB fake...</title>
<meta name="layout" content="main" />
<style type="text/css" media="screen">
#nav {
	margin-top: 20px;
	margin-left: 30px;
	width: 228px;
	float: left;
}

.homePagePanel * {
	margin: 0px;
}

.homePagePanel .panelBody ul {
	list-style-type: none;
	margin-bottom: 10px;
}

.homePagePanel .panelBody h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin-bottom: 10px;
}

.homePagePanel .panelBody {
	background: url(images/leftnav_midstretch.png) repeat-y top;
	margin: 0px;
	padding: 15px;
}

.homePagePanel .panelBtm {
	background: url(images/leftnav_btm.png) no-repeat top;
	height: 20px;
	margin: 0px;
}

.homePagePanel .panelTop {
	background: url(images/leftnav_top.png) no-repeat top;
	height: 11px;
	margin: 0px;
}

h2 {
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 1.2em;
}

#pageBody {
	margin-left: 20px;
}

.simpleDialog {
	padding: 15px 0;
	margin: 0;
	width: auto;
}

#welcome {
	padding: 5px 0;
	margin: 0;
	width: auto;
}

</style>
</head>
	<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
        </div>
		
		<div id="pageBody">
			<div class="simpleDialog">
				<g:form controller="search">
					<label for="search">Einfache Suche </label>
					<g:textField name="query" /> 
					<span class="searchButton">
						<g:actionSubmit	class="search" value="Person(en) finden" action="result" />
					</span>
				</g:form>
				<span class="smallLink"><g:link controller="advancedSearch" action="index">Erweiterte Suche</g:link></span>
			</div>
			
			<div id="welcome">
				<h1>Welcome to the ADB/NDB fake...</h1>
				<p>A university project to implement a basic structure for the
				ADB/NDB, a german biography database</p>
			</div>
			
		</div>
	</body>
</html>
