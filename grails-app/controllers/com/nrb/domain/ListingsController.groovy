package com.nrb.domain

import grails.converters.JSON

class ListingsController {
	def listingsService
	def eventService
	
	transient productListing
	
	def show ={
		render "hello"
	}
	
    def index = { 
		def lat =  params["lat"]
		def longitude = params["long"]
		def radius = params["radius"]
		
		if (radius==null){
			radius = 10 //defaults to 10
		}
		
		
		def bounds = params["bounds"]
		print bounds
		
		//render productListing.list() as JSON
		//println "%d %d %d ",lat, longitude, radius
		render listingsService.returnRows(params) as JSON
		//.returnAll() as JSON	
	}
}
