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
		if(params.person != null)
			flash.put("person_id", params.person.id)
		else {
			// If no person.id is passed the create action redirects to "/"
			redirect(uri:"/")
		}
		def workInstance = new Work()
		workInstance.properties = params
		return[workInstance: workInstance]
	}

	def save = {
		def workInstance = new Work(params)

		workInstance.releaseDateAsString = params.releaseDateAsString

		def date_string

		if(params.releaseDateAsString) {
			date_string = DateUtil.parseToDate(params.releaseDateAsString)
			if(date_string == null) {
				workInstance.errors.rejectValue('releaseDateAsString','date.invalid.format.message')
				render(view: "edit", model: [workInstance: workInstance])
				return
			}
		}

		if (workInstance.save(flush: true)) {
			def person = Person.get(flash.person_id)
			person.works.add(workInstance)
			if(person.save(flush: true)) {
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'work.label', default: 'Work'), workInstance.id])}"
				redirect(controller: "person", action: "edit", id: flash.person_id)
			}else {
				render(view: "create", model: [workInstance: workInstance])
			}
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
			if(workInstance.releaseDate)
				workInstance.releaseDateAsString = DateUtil.getStringFromDate(workInstance.releaseDate)
			return [workInstance: workInstance]
		}
	}

	def update = {
		def workInstance = Work.get(params.id)

		workInstance.releaseDateAsString = params.releaseDateAsString

		def date_string

		if(params.releaseDateAsString) {
			date_string = DateUtil.parseToDate(params.releaseDateAsString)
			if(date_string == null) {
				workInstance.errors.rejectValue('releaseDateAsString','date.invalid.format.message')
				render(view: "edit", model: [workInstance: workInstance])
				return
			}
		}

		if (workInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (workInstance.version > version) {

					workInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'work.label', default: 'Work')]
					as Object[], "Another user has updated this Work while you were editing")
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
