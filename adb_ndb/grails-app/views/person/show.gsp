<%@ page import="de.uni_koeln.hs.Person" %>
<%@ page import="util.DateUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="person.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="person" action="create"><g:message code="person.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="showPersonInfo">
            
             				<h1><g:message code="person.names.label" default="Name(n)" /></h1>
                            <div style="text-align: left;" class="value">
                                <g:each in="${personInstance.names}" status="counter" var="item">
									<g:if test="${counter < personInstance.names.size()-1}">
										<b>${item?.lastName}, </b>${item?.firstName};
									</g:if>
									<g:else>
										<b>${item?.lastName}, </b>${item?.firstName}
									</g:else>
								</g:each>
                            </div>
                            
                            
                            <h1>Lebensdaten</h1>
	                       	<div>
	                            <g:if test="${personInstance?.dateOfBirth != null}">
	                           		<g:set  var="dateBirth" value="${DateUtil.getStringFromDate(personInstance?.dateOfBirth)}" scope="page" />
	                           		*${dateBirth},
	                           	</g:if><g:else>
	                           		<div>*unbekannt,
	                           	</g:else>
	                           	
	                            <g:if test="${personInstance?.dateOfDeath != null}">
	                           		<g:set  var="dateDeath" value="${DateUtil.getStringFromDate(personInstance?.dateOfDeath)}" scope="page" />
	                           		&#8224;${dateDeath}
	                           	</g:if><g:else>
	                           		&#8224;unbekannt
	                           	</g:else>
           					</div>
           					
           					
                            <h1><g:message code="person.gender.label" default="Geschlecht" /></h1>
                            <div>
                            	<g:if test="${personInstance?.gender}">
									m&auml;nnlich
                            	</g:if>
                            	<g:else>
    								weiblich
								</g:else>
							</div>
							
							 
                            <h1><g:message code="person.locations.label" default="Orte" /></h1>
                            <div>
                                <g:each in="${personInstance.locations}" var="l">
                                    ${l?.encodeAsHTML()}; ${l?.latitude}, ${l?.longitude} <br>
                                </g:each>
                            </div>
                            
                            
                            <h1><g:message code="person.confessions.label" default="Konfession(en)" /></h1>
                            <div>
                                <g:each in="${personInstance.confessions}" var="c">
                                    ${c?.encodeAsHTML()} <br>
                                </g:each>
                           	</div>
                           	
                           	
                            <h1><g:message code="person.works.label" default="Werke" /></h1>
                            <div>
                                <g:each in="${personInstance.works}" var="w">
                                  	 <g:link controller="werke" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link>
                                </g:each>
            				</div>
            				
            				
                            <h1><g:message code="person.relations.label" default="Relationen" /></h1>
                            <div>
                                <g:each in="${personInstance.relations}" var="r">
                                	<g:if test="${r?.directRelation}">
                                		<g:set var="direct" value="Verwandschaft"></g:set>
                                	</g:if>
                                	<g:else>
                                		<g:set var="direct" value="Bekanntschaft"></g:set>
                                	</g:else>
                                    <g:link controller="relation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link> -> ${direct} <br>
                                </g:each>
                            </div>  
                              
                              
                            <h1><g:message code="person.bio.label" default="Biographie" /></h1>
                            <div id="bio">${fieldValue(bean: personInstance, field: "bio")}</div>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <%--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>--%>
                </g:form>
            </div>
        </div>
    </body>
</html>
