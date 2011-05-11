package com.nrb.domain

import grails.converters.JSON

class EventCalendarController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def eventsService
	
    def index = {
		switch(request.method){
			case "POST":   
			
			
			//createEvent(String name, String description, double longitude, double latitude, String startDate, String endDate, String url, String dataSource, String tags)
			//if (eventsService.createEvent(params.name, params.description, params.longitude, params.latitude, params.startDate, params.endDate, params.url,params.dataSource, params.tags)){
		
			if (eventsService.createEvent(params)){
					response.status = 201 // Created
					
					render "created"
				}
			else{
			  response.status = 500 //Internal Server Error
			  render "Could not create new EventCalendar due to errors:\n  ${params}"
			}
			break
			case "GET":
			  render EventCalendar.list(params) as JSON
			  break
			case "PUT":    
			case "DELETE": 
			 break
		}
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventCalendarInstanceList: EventCalendar.list(params), eventCalendarInstanceTotal: EventCalendar.count()]
    }

    def create = {
        def eventCalendarInstance = new EventCalendar()
        eventCalendarInstance.properties = params
        return [eventCalendarInstance: eventCalendarInstance]
    }

    def save = {
        def eventCalendarInstance = new EventCalendar(params)
		def locationPoint = new LocationPoint()
		locationPoint.x = eventCalendarInstance.latitude
		locationPoint.y = eventCalendarInstance.longitude
		eventCalendarInstance.loc = locationPoint
        if (eventCalendarInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), eventCalendarInstance.id])}"
            redirect(action: "show", id: eventCalendarInstance.id)
        }
        else {
            render(view: "create", model: [eventCalendarInstance: eventCalendarInstance])
        }
    }

    def show = {
        def eventCalendarInstance = EventCalendar.get(params.id)
        if (!eventCalendarInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
            redirect(action: "list")
        }
        else {
            [eventCalendarInstance: eventCalendarInstance]
        }
    }

    def edit = {
        def eventCalendarInstance = EventCalendar.get(params.id)
        if (!eventCalendarInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [eventCalendarInstance: eventCalendarInstance]
        }
    }

    def update = {
        def eventCalendarInstance = EventCalendar.get(params.id)
        if (eventCalendarInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (eventCalendarInstance.version > version) {
                    
                    eventCalendarInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'eventCalendar.label', default: 'EventCalendar')] as Object[], "Another user has updated this EventCalendar while you were editing")
                    render(view: "edit", model: [eventCalendarInstance: eventCalendarInstance])
                    return
                }
            }
            eventCalendarInstance.properties = params
            if (!eventCalendarInstance.hasErrors() && eventCalendarInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), eventCalendarInstance.id])}"
                redirect(action: "show", id: eventCalendarInstance.id)
            }
            else {
                render(view: "edit", model: [eventCalendarInstance: eventCalendarInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def eventCalendarInstance = EventCalendar.get(params.id)
        if (eventCalendarInstance) {
            try {
                eventCalendarInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])}"
            redirect(action: "list")
        }
    }
}
