package com.nrb.domain

import grails.converters.JSON

class ProductListingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def listingsService

    def index = {
		switch(request.method){
			case "POST": 
			try{  
			    def productId = listingsService.createProductListing(params)
				response.status = 201
				render "productId"
			}
			catch(Exception e){
				response.status = 500
				throw e
				render "Could not create ProductListing due to errors:\n ${e.stackTrace()}"
				
			
			}
			break
			/*def productInstance = new ProductListing(params)
			def locationPoint = new LocationPoint()
			locationPoint.x = productListingInstance.latitude 
			locationPoint.y = productListingInstance.longitude
			productListingInstance.loc = locationPoint
			if(productInstance.save()){
					response.status = 201 // Created
					render productInstance.id as JSON
				}
			else{
			  response.status = 500 //Internal Server Error
			  render "Could not create new ProductListing due to errors:\n ${productInstance.errors} ${params}"
			}
			break*/
			case "GET":
			  render ProductListing.list(params) as JSON
			  break
			case "PUT":    
			case "DELETE": 
			 break
		}
    }
	
	def debugAccept = {
		def clientRequest = request.getHeader("accept")
		def serverResponse = request.format
		render "Client: ${clientRequest}\nServer: ${serverResponse}\n"
	  }
		
         
	
	def image= {
		def product = ProductListing.get(params.id)
		byte[] image = product.image
		response.outputStream << image
		}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productListingInstanceList: ProductListing.list(params), productListingInstanceTotal: ProductListing.count()]
    }

    def create = {
        def productListingInstance = new ProductListing()

		
        productListingInstance.properties = params
        return [productListingInstance: productListingInstance]
    }

    def save = {
		
        def productListingInstance = new ProductListing(params)
		def locationPoint = new LocationPoint()
		locationPoint.x = productListingInstance.latitude
		locationPoint.y = productListingInstance.longitude
		productListingInstance.loc = locationPoint
        if (productListingInstance.save(flush: true)) {
			//render =[id: productListingInstance.id]
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productListing.label', default: 'ProductListing'), productListingInstance.id])}"
            redirect(action: "show", id: productListingInstance.id)
        }
        else {
            render(view: "create", model: [productListingInstance: productListingInstance])
        }
    }

    def show = {
        def productListingInstance = ProductListing.get(params.id)
        if (!productListingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productListingInstance: productListingInstance]
        }
    }

    def edit = {
        def productListingInstance = ProductListing.get(params.id)
        if (!productListingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productListingInstance: productListingInstance]
        }
    }

    def update = {
        def productListingInstance = ProductListing.get(params.id)
        if (productListingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productListingInstance.version > version) {
                    
                    productListingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productListing.label', default: 'ProductListing')] as Object[], "Another user has updated this ProductListing while you were editing")
                    render(view: "edit", model: [productListingInstance: productListingInstance])
                    return
                }
            }
            productListingInstance.properties = params
            if (!productListingInstance.hasErrors() && productListingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productListing.label', default: 'ProductListing'), productListingInstance.id])}"
                redirect(action: "show", id: productListingInstance.id)
            }
            else {
                render(view: "edit", model: [productListingInstance: productListingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productListingInstance = ProductListing.get(params.id)
        if (productListingInstance) {
            try {
                productListingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productListing.label', default: 'ProductListing'), params.id])}"
            redirect(action: "list")
        }
    }
  }
