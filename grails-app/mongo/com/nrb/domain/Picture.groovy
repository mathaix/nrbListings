package com.nrb.domain


class Picture {
	
	String label
	byte[] image
	String imageType
	
	Date dateCreated // autoset by plugin
	Date lastUpdated // autoset by plugin

    static constraints = {
		image(nullable:true)
		imageType(nullable:true)
	}
}
