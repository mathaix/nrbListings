
<%@ page import="com.nrb.domain.EventCalendar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventCalendar.label', default: 'EventCalendar')}" />
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
                        
                            <g:sortableColumn property="tags" title="${message(code: 'eventCalendar.tags.label', default: 'Tags')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'eventCalendar.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="dataSource" title="${message(code: 'eventCalendar.dataSource.label', default: 'Data Source')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'eventCalendar.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'eventCalendar.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'eventCalendar.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventCalendarInstanceList}" status="i" var="eventCalendarInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventCalendarInstance.id}">${fieldValue(bean: eventCalendarInstance, field: "tags")}</g:link></td>
                        
                            <td><g:formatDate date="${eventCalendarInstance.startDate}" /></td>
                        
                            <td>${fieldValue(bean: eventCalendarInstance, field: "dataSource")}</td>
                        
                            <td>${fieldValue(bean: eventCalendarInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: eventCalendarInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${eventCalendarInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventCalendarInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
