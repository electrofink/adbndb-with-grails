package de.uni_koeln.hs

class RelationController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	/*
	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[relationInstanceList: Relation.list(params), relationInstanceTotal: Relation.count()]
	}
	*/
	def create = {
		def relationInstance = new Relation()
		relationInstance.properties = params
		return [relationInstance: relationInstance]
	}

	def save = {
		def relationInstance = new Relation(params)
		if (relationInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'relation.label', default: 'Relation'), relationInstance.id])}"
			redirect(controller: "person", action: "edit", id: params.person.id)
		}
		else {
			render(view: "create", model: [relationInstance: relationInstance])
		}
	}
	/*
	def show = {
		def relationInstance = Relation.get(params.id)
		if (!relationInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
			redirect(action: "list")
		}
		else {
			[relationInstance: relationInstance]
		}
	}
	*/

	def edit = {
		def relationInstance = Relation.get(params.id)
		if (!relationInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
			redirect(controller: "person", action: "show", id: params.person.id)
		}
		else {
			return [relationInstance: relationInstance]
		}
	}

	def update = {
		def relationInstance = Relation.get(params.id)
		if (relationInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (relationInstance.version > version) {

					relationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'relation.label', default: 'Relation')]
					as Object[], "Another user has updated this Relation while you were editing")
					render(view: "edit", model: [relationInstance: relationInstance])
					return
				}
			}
			relationInstance.properties = params
			if (!relationInstance.hasErrors() && relationInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'relation.label', default: 'Relation'), relationInstance.id])}"
				redirect(controller: "person", action: "show", id: params.person.id)
			}
			else {
				render(view: "edit", model: [relationInstance: relationInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
			redirect(controller: "person", action: "show", id: params.person.id)
		}
	}

	def delete = {
		def relationInstance = Relation.get(params.id)
		if (relationInstance) {
			try {
				relationInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
				redirect(controller: "person", action: "edit", id: params.person.id)
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
				redirect(controller: "person", action: "show", id: params.person.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relation.label', default: 'Relation'), params.id])}"
			redirect(controller: "person", action: "show", id: params.person.id)
		}
	}
}
