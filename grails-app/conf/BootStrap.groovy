import com.nrb.domain.*

class BootStrap {

    def init = { servletContext ->
		
		def User1 = new User (fn:"fredy plap", address:"somewhere", email:"freddy@somewehere.com", phone:"232-443-2345")
		User1.save()
		if(User1.hasErrors()){
			println User1.errors
		}
		
		
		def AroundMIT= new Location(name:"AroundMIT", latitude:32.23, longitude:53.53, description:"Kendal Square ")
		AroundMIT.save()
		if(AroundMIT.hasErrors()){
			println AroundMIT.errors
		}
		
		def EveryWhere= new Location(name:"Everywhere", latitude:0, longitude:0, description:"Universal Type service")
		EveryWhere.save()
		if(EveryWhere.hasErrors()){
			println EveryWhere.errors
		}
		

		def AroundProvidence= new Location(name:"Providence", latitude:62.23, longitude:73.53, description:"Providence, RI")
		AroundProvidence.save()
		if(AroundProvidence.hasErrors()){
			println AroundMIT.errors
		}
		
		def MITService = new ServiceProvider(name:"MITService", description : "MIT DataService", creator: User1, url:"http://www.google.com", loc: AroundMIT)
		MITService.save()
		if(MITService.hasErrors()){
			println MITService.errors
		}
		
		def MarketPlaceService = new ServiceProvider(name:"MarketPlace", description : "MarketPlace Service",creator: User1, url:"http://www.google.com", loc:EveryWhere )
		MarketPlaceService.save()
		if(MarketPlaceService.hasErrors()){
			println MarketPlaceService.errors
		}
		
		def tag1 = new Tag (Name:"Food")
		tag1.save()
		
		def tag2 = new Tag (Name:"Market")
		tag2.save()
		

		
    }
	
    def destroy = {
    }
}
