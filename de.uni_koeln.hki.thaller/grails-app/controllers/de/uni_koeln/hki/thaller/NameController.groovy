package de.uni_koeln.hki.thaller

class NameController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [nameInstanceList: Name.list(params), nameInstanceTotal: Name.count()]
    }

    def create = {
        def nameInstance = new Name()
        nameInstance.properties = params
        return [nameInstance: nameInstance]
    }

    def save = {
        def nameInstance = new Name(params)

        if (nameInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'name.label', default: 'Name'), nameInstance.id])}"
            redirect(action: "show", id: nameInstance.id)
        }
        else {
            render(view: "create", model: [nameInstance: nameInstance])
        }
    }

    def show = {
        def nameInstance = Name.get(params.id)
        if (!nameInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
            redirect(action: "list")
        }
        else {
            [nameInstance: nameInstance]
        }
    }

    def edit = {
        def nameInstance = Name.get(params.id)
        if (!nameInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [nameInstance: nameInstance]
        }
    }

    def update = {
        def nameInstance = Name.get(params.id)
        if (nameInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (nameInstance.version > version) {
                    
                    nameInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'name.label', default: 'Name')] as Object[], "Another user has updated this Name while you were editing")
                    render(view: "edit", model: [nameInstance: nameInstance])
                    return
                }
            }
            nameInstance.properties = params
            if (!nameInstance.hasErrors() && nameInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'name.label', default: 'Name'), nameInstance.id])}"
                redirect(action: "show", id: nameInstance.id)
            }
            else {
                render(view: "edit", model: [nameInstance: nameInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def nameInstance = Name.get(params.id)
        if (nameInstance) {
            try {
                nameInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
            redirect(action: "list")
        }
    }
}
