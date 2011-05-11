

<%@ page import="com.nrb.domain.EventCalendar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventCalendar.label', default: 'EventCalendar')}" />
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
            <g:hasErrors bean="${eventCalendarInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventCalendarInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="eventCalendar.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${eventCalendarInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="eventCalendar.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'description', 'errors')}">
                                    <g:textArea   rows="5" cols="40" name="description" value="${eventCalendarInstance?.description}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataSource"><g:message code="eventCalendar.dataSource.label" default="Data Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'dataSource', 'errors')}">
                                    <g:textField name="dataSource" value="${eventCalendarInstance?.dataSource}" />
                                </td>
                            </tr>
                            
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="eventCalendar.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${eventCalendarInstance?.startDate}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="eventCalendar.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${eventCalendarInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                        
                            
                        
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="eventCalendar.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${session.position.coords.latitude}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="eventCalendar.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${session.position.coords.longitude}" />
                                </td>
                            </tr>
                        
                           
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="eventCalendar.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${eventCalendarInstance?.url}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags"><g:message code="eventCalendar.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'tags', 'errors')}">
                                    <g:textField name="tags" value="${eventCalendarInstance?.tags}" />
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
