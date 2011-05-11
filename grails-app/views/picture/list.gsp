
<%@ page import="com.nrb.domain.Picture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
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
                        
                            <g:sortableColumn property="image" title="${message(code: 'picture.image.label', default: 'Image')}" />
                        
                            <g:sortableColumn property="imageType" title="${message(code: 'picture.imageType.label', default: 'Image Type')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'picture.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'picture.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="label" title="${message(code: 'picture.label.label', default: 'Label')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pictureInstance.id}">${fieldValue(bean: pictureInstance, field: "image")}</g:link></td>
                        
                            <td>${fieldValue(bean: pictureInstance, field: "imageType")}</td>
                        
                            <td><g:formatDate date="${pictureInstance.lastUpdated}" /></td>
                        
                            <td><g:formatDate date="${pictureInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: pictureInstance, field: "label")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pictureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
