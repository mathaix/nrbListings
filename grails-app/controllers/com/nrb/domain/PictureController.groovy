package com.nrb.domain

class PictureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
	
	def image= {
		def pictureInstance = Picture.get(params.id)
		byte[] image = pictureInstance.image
		response.outputStream << image
		}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pictureInstanceList: Picture.list(params), pictureInstanceTotal: Picture.count()]
    }

    def create = {
        def pictureInstance = new Picture()
        pictureInstance.properties = params
        return [pictureInstance: pictureInstance]
    }

    def save = {
        def pictureInstance = new Picture(params)
        if (pictureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])}"
            redirect(action: "show", id: pictureInstance.id)
        }
        else {
            render(view: "create", model: [pictureInstance: pictureInstance])
        }
    }

    def show = {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pictureInstance: pictureInstance]
        }
    }

    def edit = {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pictureInstance: pictureInstance]
        }
    }

    def update = {
        def pictureInstance = Picture.get(params.id)
        if (pictureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pictureInstance.version > version) {
                    
                    pictureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'picture.label', default: 'Picture')] as Object[], "Another user has updated this Picture while you were editing")
                    render(view: "edit", model: [pictureInstance: pictureInstance])
                    return
                }
            }
            pictureInstance.properties = params
            if (!pictureInstance.hasErrors() && pictureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])}"
                redirect(action: "show", id: pictureInstance.id)
            }
            else {
                render(view: "edit", model: [pictureInstance: pictureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pictureInstance = Picture.get(params.id)
        if (pictureInstance) {
            try {
                pictureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])}"
            redirect(action: "list")
        }
    }
}
