
<html>    
<head>

        <title>Nearby Listings</title>
        <meta name="layout" content="main" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <style type="text/css" media="screen">
        
        #bodyj{
        		height: 100% ;
                width:  70% ;
        
        }
        
        #map_canvas {   margin-top:0px;
            			margin-left:0px;
            			width:800px;
            			height:800px;
            			float:left;
            			border-style:solid;
						border-width:2px;
						
           }

        .body nav {
            margin-top:4px;
            margin-left:800px;
            width:228px;
            float:right;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
        	background: #000000;
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        #listheader{
        	background = #32344;
        	font-size:1.1em;
        	font-color:red
        }
        
        .listingObject :active{
            color: black; 
        	background-color: white;
        	font-size:1.0em;
        	font-weight: normal;
        	text-decoration: none;
        
        }
        
        
		.listingObject	:visited { 
			color: black; 
			background-color: white;
			text-decoration: none;
			font-weight: normal;
			
			
			}
		.listingObject	:hover {
			color: black; 
			background-color: yellow;
			text-decoration: none;
			
			
			} 
        </style>
    </head>
    <body onLoad="init()">
       <div id="body"> 
       <div id="map_canvas"></div>
        <div id="nav">
            <div class="homePagePanel">
                
                	<div id="listheader" style="background-color:black" >
                    	<img src="${resource(dir:'icons',file:'grocery.png')}">	
                
                   
                    </div>
                    
                    <div id="listings"></div>
                    
                    <div id="listheader"  style="background-color:black"  >
                    <img src="${resource(dir:'icons',file:'party.png')}">
                    </div>
                    <div id="events"  > </div>
            </div>
        </div>
        
        <g:javascript library="prototype" />
       
    <g:javascript>
    var initialLocation;
	var siberia = new google.maps.LatLng(60, 105);
	var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
	var browserSupportFlag =  new Boolean();
	var map;
	var infowindow = new google.maps.InfoWindow();
	
	var eventicon = '${resource(dir:'icons',file:'party.png')}';
	var producticon = '${resource(dir:'icons',file:'grocery.png')}';
  
    var myOptions = {
    	zoom: 14,
    	mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
	  
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	  
	if(navigator.geolocation) {
	 
	    browserSupportFlag = true;
	    
	    navigator.geolocation.getCurrentPosition(function(position) {
	     var jsonPos =  JSON.stringify(position.coords);
	   
	     ${remoteFunction(controller: 'location',action:'setGeoPosition',params:'\'val=\' + jsonPos')}
	    
	      
	      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	      
	      //contentString = "Location found using W3C standard";
	      map.setCenter(initialLocation);
	      //infowindow.setContent(contentString);
	      infowindow.setPosition(initialLocation);
	      infowindow.open(map);
	      
	      //addMarker (map,initialLocation,"Inital point");
	      
	      var marker = new google.maps.Marker({
      			position: initialLocation,
      			title:"My position"
  			});
  
  			// To add the marker to the map, call setMap();
  			marker.setMap(map); 
  			 
	      //LatLngBounds
	      //var bounds = map.getBounds();
	      //var d = HaversineDistance(position.coords.latitude,position.coords.longitude,bounds.getNorthEast().lat(),bounds.getNorthEast().lng());
	     
	      //loadListings(position.coords.latitude,position.coords.longitude,d);
	      //loadEvents(position.coords.latitude,position.coords.longitude,d);
	      
	      google.maps.event.addListener(map, 'bounds_changed', function() {
    			var bounds = map.getBounds();
    			var center = map.getCenter();
    			
    			var lat = map.getCenter().lat();
		        var lng = map.getCenter().lng();
    			
    			
    			var d = HaversineDistance(lat,lng,bounds.getNorthEast().lat(),bounds.getNorthEast().lng());
	     
    			//var distance = (center.latitude,center.longitude,bounds.getNorthEast().lat(),bounds.getNorthEast().lng());
    			loadListings(lat,lng,d);
	      		loadEvents(lat,lng,d);
    			     
  			});
	      
	    })
	  }
	  
	  function distance2(latlong,latlong2)
		{
		  var lat1 = latlong.Latitude;
		  var lon1 = latlong.Longitude;
		  var lat2 = latlong2.Latitude;
		  var lon2 = latlong2.Longitude;
		  var earthRadius = 6371; //appxoximate radius in miles
		      
		  var factor = Math.PI/180;
		  var dLat = (lat2-lat1)*factor;
		  var dLon = (lon2-lon1)*factor; 
		  var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat1*factor) 
		    * Math.cos(lat2*factor) * Math.sin(dLon/2) * Math.sin(dLon/2); 
		  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		  var d = earthRadius * c;
		  return d;
		}
	  
	  function HaversineDistance (Lat1, Lon1, Lat2,Lon2){
	  
	    lat1 =parseFloat(Lat1);
	    lon1 = parseFloat(Lon1);
	    lat2 = parseFloat(Lat2);
	    lon2 =parseFloat(Lon2);
	    var factor = Math.PI/180;
	  	var R = 6371; // km
		var dLat = (lat2-lat1)*factor;
		var dLon = (lon2-lon1)*factor; 
		var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
               Math.cos(lat1*factor) * Math.cos(lat2*factor) * 
               Math.sin(dLon/2) * Math.sin(dLon/2); 
		var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		var d = R * c;
		return d;
	  }
	  
	  function addMarker(theMap, objectLocation , objectTitle , icon){
	  	 var marker = new google.maps.Marker({
      			position: objectLocation,
      			title:objectTitle
  			});
  
  			// To add the marker to the map, call setMap();
  			marker.setMap(theMap); 
	  }
	  
	  function showListings(response){
  			var results = eval( '(' + response.responseText + ')')
  			//var resultCount = 1 * results.totalResultsReturned
  			var html = "<ul>"
  			for(var i=0; i < results.length; i++){
  			    html += "<div class='listingObject'><li ><B><a href='${createLink(controller:'productListing', action:'show/', id='" + results[i].id+ "')}'>"
    			html +=  results[i].name+ "</a></B><br />";
    			html += "Description: " + results[i].description  + "<br />";
    			html += "Price: " + results[i].price  + "<br />";
    			html += "Distance: " + results[i].distance  + "<br />";
    			html += "</li></div>";
    			html += "<hr />";
    			
    			//alert (html);
    			
    			var objlocation = new google.maps.LatLng(results[i].latitude,results[i].longitude);
    			//alert (objlocation);
    			var marker = new google.maps.Marker({
      				position: objlocation,
      				title:results[i].name,
      			    icon: producticon
  				});
  
  				// To add the marker to the map, call setMap();
  				marker.setMap(map); 
  				}
  				
  			html += "</ul>"
  			var listings = document.getElementById("listings")
  			listings.innerHTML = html
  			
  			
	 }
	  
	  function showEvents(response){
  			var results = eval( '(' + response.responseText + ')')
  			//var resultCount = 1 * results.totalResultsReturned
  			var html = "<ul >"
  			for(var i=0; i < results.length; i++){
  			  
    			html += "<div class='listingObject'><li ><B><a href='${createLink(controller:'eventCalendar', action:'show/', id='" + results[i].id+ "')}'>" + results[i].name+ "</B></a><br />";
    			html += "Description: " + results[i].description  + "<br />";
    			html += "StartDate: " + results[i].startDate  + "<br />";
    			html += "EndDate: " + results[i].endDate  + "<br />";
    			html += "Distance: " + results[i].distance  + "<br />";
    			html += "</li></div>";
    			html += "<hr />";
    			
    			var objlocation = new google.maps.LatLng(results[i].latitude,results[i].longitude);
    			//alert (objlocation);
    			var marker = new google.maps.Marker({
      				position: objlocation,
      				title:results[i].name,
      			    icon: eventicon
  				});
  
  				// To add the marker to the map, call setMap();
  				marker.setMap(map); 
  				
  			}
  			html += "</ul>"
  			var events = document.getElementById("events")
  			events.innerHTML = html
	 }
	 
	  function loadListings(latitude,longitude,radius){
  		var url = "${createLink(controller:'listings')}"  //, action:'index')
  		url += "?longitude=" + longitude
  		url += "&latitude=" + latitude
  		url +="&radius=" + radius
  		
  		
  		new Ajax.Request(url,{
    		onSuccess: function(req) { 
    			//alert (req);
    			showListings(req) ;
    		
    		},
    		onFailure: function(req) { 
    				alert("failure");
    			}
  		})
	}
	
	function loadEvents(latitude,longitude, radius){
  		var url = "${createLink(controller:'events', action:'index')}"
  		url += "?longitude=" + longitude
  		url += "&latitude=" + latitude
  		url +="&radius=" + radius
  		
  		//alert (url);
  		
  		new Ajax.Request(url,{
    		onSuccess: function(req) { 
    			//alert (req);
    			showEvents(req) ;
    		
    		},
    		onFailure: function(req) { 
    				alert("failure");
    			}
  		})
	}
	  
	  
    </g:javascript>    
    </body>
</html>
