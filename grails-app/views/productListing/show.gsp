
<%@ page import="com.nrb.domain.ProductListing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productListing.label', default: 'ProductListing')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    	<tr class="prop">
                        
							<td><a href="${createLink(controller:'productListing' ,action:'image', id:productListingInstance.id)}"><img class="productimg" src="${createLink(controller:'productListing' ,action:'image', id:productListingInstance.id)}"/></a></td>
 
                            
                        </tr>
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.price.label" default="Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "price")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "description")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productListingInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productListingInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.longitude.label" default="Longitude" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "longitude")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.latitude.label" default="Latitude" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "latitude")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productListing.url.label" default="Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productListingInstance, field: "url")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productListingInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
