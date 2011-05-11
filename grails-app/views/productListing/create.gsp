

<%@ page import="com.nrb.domain.ProductListing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productListing.label', default: 'ProductListing')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
      
    </head>
    <body>
 
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
        
        
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productListingInstance}">
            <div class="errors">
                <g:renderErrors bean="${productListingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="productListing.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${productListingInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="productListing.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'description', 'errors')}">
                                    <g:textArea   rows="5" cols="40" name="description" value="${productListingInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="productListing.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: productListingInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="productListing.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${session.position.coords.latitude}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="productListing.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${session.position.coords.longitude}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags"><g:message code="productListing.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'tags', 'errors')}">
                                    <g:textField name="tags" value="${productListingInstance?.tags}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imgUrl"><g:message code="productListing.imgUrl.label" default="Img Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'imgUrl', 'errors')}">
                                    <g:textField name="imgUrl" value="${productListingInstance?.imgUrl}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataSource"><g:message code="productListing.dataSource.label" default="Data Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'dataSource', 'errors')}">
                                    <g:textField name="dataSource" value="${productListingInstance?.dataSource}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="image"><g:message code="productListing.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'image', 'errors')}">
                                    <input type="file" id="image" name="image" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="productListing.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productListingInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${productListingInstance?.url}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
