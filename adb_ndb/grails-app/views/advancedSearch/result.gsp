<%@ page import="de.uni_koeln.hs.Person" %>
<%@ page import="util.DateUtil" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'search.label', default: 'Suchergebnis')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
	  		<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	  		<span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
	     	<span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
	 	</div>
		<div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<th>Details</th>
                        	
                            <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'ID')}" />
                            
                            <%-- Column 'Name' is not sortable because property attribute refers only to fields in Person domain
                            <g:sortableColumn property="names" title="${message(code: 'person.name.label', default: 'Name')}" />--%>
                            <th>Name</th>
                        
                            <g:sortableColumn property="dateOfBirth" title="${message(code: 'person.dateOfBirth.label', default: 'Geboren')}" />
                        
                            <g:sortableColumn property="dateOfDeath" title="${message(code: 'person.dateOfDeath.label', default: 'Gestorben')}" />
                        
                            <g:sortableColumn property="gender" title="${message(code: 'person.gender.label', default: 'Geschlecht')}" />
                            
                            <g:sortableColumn property="bio" title="${message(code: 'person.bio.label', default: 'Biographie')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                       		 <td valign="top">
                        		<span class="smallLink"><g:link controller="person" action="show" id="${personInstance?.id}">zu den Details</g:link></span>                        	
                        	</td>
                        
                        	<td valign="top" style="width:10px;">
                        		${personInstance?.id}                        	
                        	</td>
                        
                            <td valign="top" class="value">
								<g:each in="${personInstance?.names?}" var="n">
									<%--<g:link controller="name" action="edit" id="${n.id}" params="['person.id': personInstance?.id]">--%>
										${n?.encodeAsHTML()} <br>
									<%--</g:link>--%>
								</g:each>
	                            <%--<g:link action="show" id="${personInstance.id}">${personInstance.names}</g:link>--%>
                            </td>
                        	
                        	<td valign="top" class="value">
	                        	<g:if test="${personInstance?.dateOfBirth != null}">
	                           		<g:set  var="dateBirth" value="${DateUtil.getStringFromDate(personInstance?.dateOfBirth)}" scope="page" />
	                           		${dateBirth}
	                           	</g:if><g:else>
	                           		unbekannt
	                           	</g:else>
                           	</td>
                           	
                        	<td valign="top" class="value">
	                        	<g:if test="${personInstance?.dateOfDeath != null}">
	                           		<g:set  var="dateDeath" value="${DateUtil.getStringFromDate(personInstance?.dateOfDeath)}" scope="page" />
	                           		${dateDeath}
	                           	</g:if><g:else>
	                           		unbekannt
	                           	</g:else>
                           	</td>
                           	
                           	<td valign="top" class="value">
	                            <g:if test="${personInstance?.gender}">
	                            	m&auml;nnlich
	                            </g:if>
	                            <g:else>
	    							weiblich
								</g:else>
							</td>
                        
                            <td style="width: 100%">${personInstance.shortBio()}</td>
                            
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
    	</div>
	</body>
</html>