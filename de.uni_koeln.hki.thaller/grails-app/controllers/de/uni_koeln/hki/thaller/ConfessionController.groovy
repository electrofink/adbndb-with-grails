package de.uni_koeln.hki.thaller

class ConfessionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [confessionInstanceList: Confession.list(params), confessionInstanceTotal: Confession.count()]
    }

    def create = {
        def confessionInstance = new Confession()
        confessionInstance.properties = params
        return [confessionInstance: confessionInstance]
    }

    def save = {
        def confessionInstance = new Confession(params)
        if (confessionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'confession.label', default: 'Confession'), confessionInstance.id])}"
            redirect(action: "show", id: confessionInstance.id)
        }
        else {
            render(view: "create", model: [confessionInstance: confessionInstance])
        }
    }

    def show = {
        def confessionInstance = Confession.get(params.id)
        if (!confessionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
            redirect(action: "list")
        }
        else {
            [confessionInstance: confessionInstance]
        }
    }

    def edit = {
        def confessionInstance = Confession.get(params.id)
        if (!confessionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [confessionInstance: confessionInstance]
        }
    }

    def update = {
        def confessionInstance = Confession.get(params.id)
        if (confessionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (confessionInstance.version > version) {
                    
                    confessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'confession.label', default: 'Confession')] as Object[], "Another user has updated this Confession while you were editing")
                    render(view: "edit", model: [confessionInstance: confessionInstance])
                    return
                }
            }
            confessionInstance.properties = params
            if (!confessionInstance.hasErrors() && confessionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'confession.label', default: 'Confession'), confessionInstance.id])}"
                redirect(action: "show", id: confessionInstance.id)
            }
            else {
                render(view: "edit", model: [confessionInstance: confessionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def confessionInstance = Confession.get(params.id)
        if (confessionInstance) {
            try {
                confessionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'confession.label', default: 'Confession'), params.id])}"
            redirect(action: "list")
        }
    }
}
