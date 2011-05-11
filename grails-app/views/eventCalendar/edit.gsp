

<%@ page import="com.nrb.domain.EventCalendar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventCalendar.label', default: 'EventCalendar')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventCalendarInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventCalendarInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${eventCalendarInstance?.id}" />
                <g:hiddenField name="version" value="${eventCalendarInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tags"><g:message code="eventCalendar.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'tags', 'errors')}">
                                    <g:textField name="tags" value="${eventCalendarInstance?.tags}" />
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
                                  <label for="dataSource"><g:message code="eventCalendar.dataSource.label" default="Data Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'dataSource', 'errors')}">
                                    <g:textField name="dataSource" value="${eventCalendarInstance?.dataSource}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="eventCalendar.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${eventCalendarInstance?.description}" />
                                </td>
                            </tr>
                        
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
                                  <label for="longitude"><g:message code="eventCalendar.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventCalendarInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: eventCalendarInstance, field: 'longitude')}" />
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
                                    <g:textField name="latitude" value="${fieldValue(bean: eventCalendarInstance, field: 'latitude')}" />
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
