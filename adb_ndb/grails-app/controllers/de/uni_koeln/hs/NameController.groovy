package de.uni_koeln.hs

class NameController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def create = {
		def nameInstance = new Name(params)
		return [nameInstance: nameInstance]
	}

	def save = {
		def nameInstance = new Name(params)
		nameInstance.properties = prepareValues(nameInstance).properties

		if (nameInstance.save(flush: true)) {
			def arg1 = "'" + nameInstance.lastName + ', ' + nameInstance.firstName + "'"
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'name.label', default: 'Name'), arg1])}"
			redirect(controller: "person", action: "edit", id: params.person.id)
		}
		else {
			render(view: "create", model: [nameInstance: nameInstance])
		}
	}

	def edit = {
		def nameInstance = Name.get(params.id)
		flash.put("pre_nameInstance", nameInstance)
		if (!nameInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
			redirect(controller: "person", action: "show", id: params.person.id)
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
					redirect(controller: "person", action: "edit", id: params.person.id)
					return
				}
			}
			nameInstance.properties = params
			nameInstance.properties = prepareValues(nameInstance).properties

			if (!nameInstance.hasErrors() && nameInstance.save(flush: true)) {
				if(flash.pre_nameInstance) {
					def arg1 = "'" + flash.pre_nameInstance.lastName + ', ' + flash.pre_nameInstance.firstName + "'"
					def arg2 = "'" + nameInstance.lastName +', ' + nameInstance.firstName + "'"
					flash.message = "${message(code: 'custom.name.updated.message', args: [message(code: 'name.label', default: 'Name'), arg1, arg2])}"
				}
				else  {
					def arg1 = "'" + nameInstance.lastName + ', ' + nameInstance.firstName + "'"
					flash.message = "${message(code: 'custom.name.not.flashed.updated.message', args: [message(code: 'name.label', default: 'Name'), arg1])}"
				}
				redirect(controller: "person", action: "edit", id: params.person.id)
			}
			else {
				render(view: "edit", model: [nameInstance: nameInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
			redirect(controller: "person", action: "show", id: params.person.id)
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
				redirect(controller: "person", action: "edit", id: params.person.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'name.label', default: 'Name'), params.id])}"
			redirect(controller: "person", action: "edit", id: params.person.id)
		}
	}

	Name prepareValues (def nameInstance) {
		if(nameInstance.firstName == null)
			nameInstance.firstName = "unbekannt"
		if(nameInstance.lastName == null)
			nameInstance.lastName = "unbekannt"
		if(nameInstance.other == null)
			nameInstance.other = "unbekannt"
		return nameInstance
	}
}
