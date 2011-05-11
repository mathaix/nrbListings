package com.nrb.domain

import com.mongodb.BasicDBObject
import com.mongodb.DBCollection
import java.util.List;
import com.nrb.utility.geocoding.Haversine;

import org.codehaus.groovy.grails.commons.GrailsApplication;


class ListingsService {
	def grailsApplication
	def mongo
	
	
    static transactional = true
	
	def returnRows (def params){
		def longitude //= -71.0822
		def latitude //= 42.3637
		double radius = 3.0
		int startOffset = 0
		int endOffset = 10  //by default show first 10 points.
		
		if (params.longitude != null)
			 longitude = params.longitude
		
		
		if (params.latitude != null)
			latitude = params.latitude
		
		if (params.radius != null)
			radius = new Double (params.radius) 
		
		if (params.startOffset  != null)	
			startOffset = new Integer (params.startOffset)
		
		if (params.endOffset !=null)
		   endOffset = new Integer (params.endOffset)
		
		def query = new BasicDBObject();
		query.put("loc", new BasicDBObject("\$near", [new Double (latitude),new Double(longitude)]));
		//query.put("loc", new BasicDBObject("\$within", new BasicDBObject("\$center",[new Double(233.45),new Double (444.23)])));
		def cur = ProductListing.collection.find (query)
		
		
		def renderList = new ArrayList()
	    
		int counter = 0
		while (cur.hasNext()){
			def itemMap = new HashMap()
			def Item = cur.next()
			
			counter++;
			
			if (counter < startOffset)  //skip first few items.
				continue;
				
			if (counter>=endOffset){
					break;
			}
			
			//skip if error; assume bad data
			double howfar = 1.0;
			
			try{
			    howfar =  Haversine.getDistance(Item.get("latitude"), Item.get("longitude"), latitude, longitude)
				println howfar
			}catch(Exception e){
			    
			    println "dont understand this error " + e
				continue;
			}
			
			if (howfar < radius){
			
				itemMap.put "id", Item.get("_id").toString()
				itemMap.put "name", Item.get("name")
				itemMap.put "longitude", Item.get("longitude")
				itemMap.put "latitude", Item.get("latitude")
				itemMap.put "description", Item.get("description")	
				itemMap.put "url", Item.get("url")
				itemMap.put "price", Item.get("price")
				itemMap.put "dateCreated", Item.get("dateCreated")
				itemMap.put "distance", howfar
				
				if (Item.get("image")!=null){
					def link = grailsApplication.config.grails.serverURL.toString() + '/productListing/image/'  + Item.get("_id")
					itemMap.put "imgUrl", link
				}else{
					itemMap.put "imgUrl", "defaultImage"
				}
				
				renderList.add (itemMap)
			}else
		       break;
			
		}
		
		return renderList
			
	}
	
	def returnAll (){
		def params = new HashMap()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)	
			
		def renderList = new ArrayList()
		
		 ProductListing.list(params).each{ Item->
			def itemMap = new HashMap()
			itemMap.put "name", Item.name
			itemMap.put "description", Item.description
			
			if (Item.image !=null){
				
				def link = grailsApplication.config.grails.serverURL.toString() + '/productListing/image/'  + Item.id
				itemMap.put "imgUrl", link
			}else{
				itemMap.put "imgUrl", Item.url
			}
			
			itemMap.put "url", Item.url
			itemMap.put "longitude", Item.longitude
			itemMap.put "latitude", Item.latitude
			itemMap.put "price", Item.price.toString()
			
			renderList.add itemMap
		}
		return renderList
		
	}
	
	public String createProductListing(def params){
		
		def returncode = false
		//log name
		def listing= new ProductListing()
		listing.name = params.name
		listing.description = params.description?:""
		listing.dataSource = params.dataSource?:""
		listing.longitude = Double.parseDouble  (params.longitude)
		listing.latitude = Double.parseDouble (params.latitude)
		listing.price = Double.parseDouble(params.price)
		listing.url = params.url?:""
		listing.imgUrl = params.imgUrl?:""
		listing.tags = params.tags?:""
		listing.image = params.image?:""
		
		def point = new LocationPoint()
		point.x = listing.latitude 
		point.y = listing.longitude
		listing.loc = point
		
		if (listing.save()){
			returncode = true
		}
		else {
			returncode = false
			String errors = new String()
			listing.errors.each {
				println it
				errors = errors + it
		   }
			throw new Exception(errors)
		}
		
		return listing.id
	}
	
	
    def serviceMethod() {

    }
}
