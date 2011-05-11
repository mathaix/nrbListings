package com.nrb.domain

import com.mongodb.BasicDBObject
import java.text.DateFormat;
import java.util.List;
import com.nrb.utility.geocoding.Haversine;

class EventsService {

    def grailsApplication
	def mongo
	
	
    static transactional = true
	
	def returnRows (def params){
		def longitude = -71.0822
		def latitude = 42.3637
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
		   
		 println "start offset, end Offset " + startOffset + " " + endOffset
		
		def query = new BasicDBObject();
		query.put("loc", new BasicDBObject("\$near", [new Double (latitude),new Double(longitude)]));
		//query.put("loc", new BasicDBObject("\$within", new BasicDBObject("\$center",[new Double(233.45),new Double (444.23)])));
		def cur = EventCalendar.collection.find (query)
		
		
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
				itemMap.put "startDate", Item.get("startDate")
				itemMap.put "endDate", Item.get("endDate")
				itemMap.put "dateCreated", Item.get("dateCreated")
				itemMap.put "distance", howfar
				
				renderList.add (itemMap)
				
				
			}else
				break;
			
		}
		
		return renderList
			
	}
	
	
	def returnAll(){
		def params = new HashMap()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
			
		def renderList = new ArrayList()
		
		EventCalendar.list(params).each{ Item->
			def itemMap = new HashMap()
			itemMap.put "startDate", Item.startDate
			itemMap.put "endDate", Item.endDate
			itemMap.put "description", Item.description
			itemMap.put "url", Item.url
			itemMap.put "longitude", Item.longitude
			itemMap.put "latitude", Item.latitude
			itemMap.put "price", Item.price.toString()
			
			renderList.add itemMap
		}
		return [renderList]
			
	}
	
	
	def getNearbyListsings(double longitude, double latitude, double radius){
		def params = new HashMap()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)	
			
		def renderList = new ArrayList()
		
		EventCalendar.list(params).each{ Item->
			def itemMap = new HashMap()
			itemMap.put "startDate", Item.startDate
			itemMap.put "endDate", Item.endDate
			itemMap.put "description", Item.description
			itemMap.put "url", Item.url
			itemMap.put "longitude", Item.longitude
			itemMap.put "latitude", Item.latitude
			itemMap.put "price", Item.price.toString()
			
			renderList.add itemMap
		}
		return [renderList]		
	}
	
	public boolean testService(){
		return true
		
	}
	
	
	public boolean createEvent(def params){
			
		def returncode = false
		//log name
		def eventCalendar = new EventCalendar()
		eventCalendar.name = params.name
		eventCalendar.description = params.description?:""
		eventCalendar.startDate =  Date.parse("yyyy-MM-dd HH:mm:ss", params.startDate)
		eventCalendar.endDate =  Date.parse("yyyy-MM-dd HH:mm:ss", params.endDate)
		eventCalendar.dataSource = params.dataSource?:""
		eventCalendar.longitude = Double.parseDouble  (params.longitude)
		eventCalendar.latitude = Double.parseDouble (params.latitude)
		eventCalendar.url = params.url?:""
		eventCalendar.tags = params.tags?:""
		
		def point = new LocationPoint()
		point.x = eventCalendar.latitude
		point.y = eventCalendar.longitude
		eventCalendar.loc = point
		
		if (eventCalendar.save()){
			returncode = true
		}
		else {
			returncode = false
			println eventCalendar.errors
		}
		
		return returncode
		
	}

    def serviceMethod() {

    }
}
