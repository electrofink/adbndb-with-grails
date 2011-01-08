package de.uni_koeln.hs

class NameController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	//	def index = {
	//		redirect(action: "list", params: params)
	//	}

	//	def list = {
	//		params.max = Math.min(params.max ? params.int('max') : 10, 100)
	//		[nameInstanceList: Name.list(params), nameInstanceTotal: Name.count()]
	//	}

	def create = {
		def nameInstance = new Name()
		nameInstance.properties = params
		flash.put("person", params.person)
		return [nameInstance: nameInstance]
	}

	def save = {
		def nameInstance = new Name(params)
		nameInstance.person = Person.get(flash.person.id)
		if (nameInstance.save(flush: true)) {
			def arg1 = "'" + nameInstance.lastName + ', ' + nameInstance.firstName + "'"
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'name.label', default: 'Name'), arg1])}"
			redirect(controller: "person", action: "edit", id: flash.person.id)
		}
		else {
			render(view: "create", model: [nameInstance: nameInstance])
		}
	}

	//	def show = {
	//		def nameInstance = Name.get(params.id)
	//		if (!nameInstance) {
	//			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
	//			redirect(action: "list")
	//		}
	//		else {
	//			[nameInstance: nameInstance]
	//		}
	//	}

	def edit = {
		def nameInstance = Name.get(params.id)
		flash.put("nameInstance", nameInstance)
		flash.put("person", params.person)
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
					nameInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'name.label', default: 'Name')]
					as Object[], "Another user has updated this Name while you were editing")
					render(view: "edit", model: [nameInstance: nameInstance])
					return
				}
			}
			nameInstance.properties = params
			nameInstance.person = Person.get(flash.person.id)
			if (!nameInstance.hasErrors() && nameInstance.save(flush: true)) {
				def arg1 = "'" + flash.nameInstance.lastName + ', ' + flash.nameInstance.firstName + "'"
				def arg2 = "'" + nameInstance.lastName +', ' + nameInstance.firstName + "'"
				flash.message = "${message(code: 'custom.name.updated.message', args: [message(code: 'name.label', default: 'Name'), arg1, arg2])}"
				//redirect(action: "show", id: nameInstance.id)
				redirect(controller: "person", action: "edit", id: flash.person.id)
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
				def arg0 = "'" + nameInstance.lastName + ', ' + nameInstance.firstName + "'"
				nameInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'name.label', default: 'Name'), arg0])}"
				redirect(controller: "person", action: "edit", id: params.person.id)
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
