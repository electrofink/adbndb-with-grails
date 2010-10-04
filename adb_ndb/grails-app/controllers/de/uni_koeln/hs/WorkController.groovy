package de.uni_koeln.hs

class WorkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workInstanceList: Work.list(params), workInstanceTotal: Work.count()]
    }

    def create = {
        def workInstance = new Work()
        workInstance.properties = params
        return [workInstance: workInstance]
    }

    def save = {
        def workInstance = new Work(params)
        if (workInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'work.label', default: 'Work'), workInstance.id])}"
            redirect(action: "show", id: workInstance.id)
        }
        else {
            render(view: "create", model: [workInstance: workInstance])
        }
    }

    def show = {
        def workInstance = Work.get(params.id)
        if (!workInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
        else {
            [workInstance: workInstance]
        }
    }

    def edit = {
        def workInstance = Work.get(params.id)
        if (!workInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [workInstance: workInstance]
        }
    }

    def update = {
        def workInstance = Work.get(params.id)
        if (workInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (workInstance.version > version) {
                    
                    workInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'work.label', default: 'Work')] as Object[], "Another user has updated this Work while you were editing")
                    render(view: "edit", model: [workInstance: workInstance])
                    return
                }
            }
            workInstance.properties = params
            if (!workInstance.hasErrors() && workInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'work.label', default: 'Work'), workInstance.id])}"
                redirect(action: "show", id: workInstance.id)
            }
            else {
                render(view: "edit", model: [workInstance: workInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def workInstance = Work.get(params.id)
        if (workInstance) {
            try {
                workInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
    }
}
