package com.nrb.utility.geocoding

class Haversine {
	/*
	 * from  movable type
			var R = 6371; // km
			var dLat = (lat2-lat1).toRad();
			var dLon = (lon2-lon1).toRad();
			var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
					Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) *
					Math.sin(dLon/2) * Math.sin(dLon/2);
			var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
			var d = R * c; */
	public static double getDistance(Lat1, Lng1, Lat2,  Lng2) {
		
		double lat1 = new Double (Lat1) //Double.parseDouble (Lat1)
		double lng1 = new Double (Lng1) //Double.parseDouble (Lng2)
		double lat2 = new Double (Lat2)
		double lng2 = new Double (Lng1)
		
		println  lat1 +  " " + lng1 + " " + lat2 + " " + lng2
		
		
		double earthRadius = 3958.75;
		double dLat = Math.toRadians(lat2-lat1);
		//println "dlat " + dLat
		
 		double dLng = Math.toRadians(lng2-lng1);
		 //println "dLng "+ dLng
		double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
				   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
				   Math.sin(dLng/2) * Math.sin(dLng/2);
		//println "a " + a
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		//println "c calc" + c
		double dist = earthRadius * c;
	
		println "distance " + dist
		return dist
		
		//return new Float(dist).floatValue();
	}
}
