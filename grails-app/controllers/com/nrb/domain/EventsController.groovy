package com.nrb.domain

import grails.converters.JSON

class EventsController {
	def eventsService
 	
    def index = { 
		//for somereason service code is not getting wired in.
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		render eventsService.returnRows(params) as JSON
			
		/*def renderList = new ArrayList()
		
		EventCalendar.list(params).each{ Item->
			def itemMap = new HashMap()
			itemMap.put "startDate", Item.startDate
			itemMap.put "endDate", Item.endDate
			itemMap.put "description", Item.description
			itemMap.put "url", Item.url
			itemMap.put "longitude", Item.longitude
			itemMap.put "latitude", Item.latitude

			
			renderList.add itemMap
		}
		
		render renderList as JSON*/
	}
}
