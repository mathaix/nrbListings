package com.nrb.domain

class Location {
	String name
	String description
	Double  latitude
	Double longitude
	
	static hasMany = [tags:Tag,
					  sources:ServiceProvider]
	
	static constraints = {
		name()
		description()
		longitude()
		latitude()
	}

    
}
