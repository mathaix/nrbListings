package com.nrb.domain

import java.net.URL;
import java.util.Date;



class ServiceProvider {
	String name;
	String description
	URL url
	Location loc
	User creator
	Date dateCreated = new Date()
	double pollingInterval
	boolean pull //if false its push
	
	static hasMany = [tags: Tag]
	
	
	static constraints = {
		/*name(nullable : false)
		url(nullable : false)
		dateCreated(nullable: false)
		description (blank:false, size: 1..255)
		pollingInterval()*/
	}
}
