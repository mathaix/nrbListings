package com.nrb.domain


class ProductListing {
	String name
	String url
	String imgUrl
	String description
	double price
	double longitude
	double latitude
	byte[] image
	String dataSource
	String tags
	
	Date dateCreated // autoset by plugin
	Date lastUpdated // autoset by plugin
	
	LocationPoint loc
	
	static embedded = ['loc']
	
	
    static mongoTypeName="productlistings"
    static constraints = {
		name()
		description()
		price()
		longitude()
		latitude()
    }
}
