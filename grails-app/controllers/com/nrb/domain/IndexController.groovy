package com.nrb.domain


class IndexController {

    def index = { 
		
		def position = new GeoPosition(o)
		def coords = new Coordinates(o.coords)
		position.coords = coords
		session.position = position
		 }
		
		
}
