package com.nrb.domain


import grails.converters.*;
import org.codehaus.groovy.grails.web.json.*

import com.nrb.domain.Coordinates;
import com.nrb.domain.GeoPosition;

class LocationController {

  def setGeoPosition = {
    def o = JSON.parse(params.val); // Parse a JSON String
	println "geoposition" + o.longitude + " " + o.latitude
	
	def itemMap = new HashMap()
	itemMap.put "longitude", o.longitude
	itemMap.put "latitude", o.latitude
	
	
	def position = new GeoPosition()
	def coords = new Coordinates(itemMap)
    position.coords = coords
	session.position = position
	response.status = 201
  }
}
