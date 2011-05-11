
<%@ page import="com.nrb.domain.ProductListing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productListing.label', default: 'ProductListing')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="name" title="${message(code: 'productListing.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'productListing.price.label', default: 'Price')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'productListing.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'productListing.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'productListing.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="image" title="${message(code: 'productListing.image.label', default: 'Image')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productListingInstanceList}" status="i" var="productListingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        <td>${fieldValue(bean: productListingInstance, field: "name")}</td>
                        
                            <td><g:link action="show" id="${productListingInstance.id}">${fieldValue(bean: productListingInstance, field: "price")}</g:link></td>
                        
                            <td>${fieldValue(bean: productListingInstance, field: "description")}</td>
                        
                            
                        
                            <td><g:formatDate date="${productListingInstance.lastUpdated}" /></td>
                        
                            <td><g:formatDate date="${productListingInstance.dateCreated}" /></td>
                        
                            <td><a href="${createLink(controller:'productListing' ,action:'image', id:productListingInstance.id)}"><img class="productimg" src="${createLink(controller:'productListing' ,action:'image', id:productListingInstance.id)}"/></a></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productListingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
