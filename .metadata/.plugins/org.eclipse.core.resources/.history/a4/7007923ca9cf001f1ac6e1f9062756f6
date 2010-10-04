package de.uni_koeln.hs

class PersonLocationsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personLocationsInstanceList: PersonLocations.list(params), personLocationsInstanceTotal: PersonLocations.count()]
    }

    def create = {
        def personLocationsInstance = new PersonLocations()
        personLocationsInstance.properties = params
        return [personLocationsInstance: personLocationsInstance]
    }

    def save = {
        def personLocationsInstance = new PersonLocations(params)
        if (personLocationsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), personLocationsInstance.id])}"
            redirect(action: "show", id: personLocationsInstance.id)
        }
        else {
            render(view: "create", model: [personLocationsInstance: personLocationsInstance])
        }
    }

    def show = {
        def personLocationsInstance = PersonLocations.get(params.id)
        if (!personLocationsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personLocationsInstance: personLocationsInstance]
        }
    }

    def edit = {
        def personLocationsInstance = PersonLocations.get(params.id)
        if (!personLocationsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personLocationsInstance: personLocationsInstance]
        }
    }

    def update = {
        def personLocationsInstance = PersonLocations.get(params.id)
        if (personLocationsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personLocationsInstance.version > version) {
                    
                    personLocationsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personLocations.label', default: 'PersonLocations')] as Object[], "Another user has updated this PersonLocations while you were editing")
                    render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
                    return
                }
            }
            personLocationsInstance.properties = params
            if (!personLocationsInstance.hasErrors() && personLocationsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), personLocationsInstance.id])}"
                redirect(action: "show", id: personLocationsInstance.id)
            }
            else {
                render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personLocationsInstance = PersonLocations.get(params.id)
        if (personLocationsInstance) {
            try {
                personLocationsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(action: "list")
        }
    }
}
