package com.nrb.domain

import java.net.URL;
import java.util.Date;


class EventCalendar {
	String name
	Date startDate
	Date endDate
	String description
	String url
	double longitude
	double latitude
	String dataSource
	String tags
	
	Date dateCreated // autoset by plugin
	Date lastUpdated // autoset by plugin
	LocationPoint loc
	
	static embedded = ['loc']
	
	
    static constraints = {
		/*description()
		startDate()
		endDate()
		url()
		longitude()
		latitude()*/
    }
}
