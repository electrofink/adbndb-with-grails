package de.uni_koeln.hs

import util.DateUtil

/**
 * @author Mihail Atanassov <mail:saeko.bjagai@gmail.com>
 */
class PersonController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
	}

	def create = {
		def personInstance = new Person(params)
		personInstance.save(validate: false)
		redirect(action: "edit", id: personInstance.id)
	}

	def save = {
		def personInstance = new Person(params)
		if (personInstance.save()) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
			redirect(action: "edit", id: personInstance.id)
		} else {
			render(view: "create", model: [personInstance: personInstance])
		}
	}

	def show = {
		def personInstance = Person.get(params.id)
		def personInstanceLocationsList = PersonLocations.withCriteria {
			eq('person.id', new Integer(params.id))
		}
		println "personInstanceLocationsList: " + personInstanceLocationsList

		if (!personInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(action: "list")
		} else {
			[personInstance: personInstance, personInstanceLocationsList: personInstanceLocationsList]
		}
	}

	def edit = {
		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(action: "list")
		} else {
			// If not null converted into String and placed in person.edit.gsp input field
			if(personInstance.dateOfBirth)
				personInstance.dateOfBirthString = DateUtil.getStringFromDate(personInstance.dateOfBirth)

			if(personInstance.dateOfDeath)
				personInstance.dateOfDeathString = DateUtil.getStringFromDate(personInstance.dateOfDeath)

			return [personInstance: personInstance]
		}
	}

	def update = {
		def personInstance = Person.get(params.id)

		// Get values from text fields [dateOfBirthString, dateOfDeathString] in person.edit.gsp
		personInstance.dateOfBirthString = params.dateOfBirthString
		personInstance.dateOfDeathString = params.dateOfDeathString

		def date_birth, date_death

		if(params.dateOfBirthString) {
			date_birth = DateUtil.parseToDate(params.dateOfBirthString)
			if(date_birth == null) {
				personInstance.errors.rejectValue('dateOfBirthString','date.invalid.format.message')
				render(view: "edit", model: [personInstance: personInstance])
				return
			}
		}

		if (params.dateOfDeathString) {
			date_death = DateUtil.parseToDate(params.dateOfDeathString)
			if(date_death == null) {
				personInstance.errors.rejectValue('dateOfDeathString','date.invalid.format.message')
				render(view: "edit", model: [personInstance: personInstance])
				return
			}
		}

		// Case dateOfDeath is before dateOfBirth
		if(date_death != null && date_birth != null) {
			if(date_birth.after(date_death)) {
				def arg0 = DateUtil.getStringFromDate(date_birth)
				def arg2 = DateUtil.getStringFromDate(date_death)
				personInstance.errors.rejectValue('dateOfBirthString',"${message(code: 'custom.date.invalid.validator.message', args: [arg0, 'Gestorben', arg2, 'Geboren'])}")
				personInstance.errors.rejectValue('dateOfDeathString','')
				render(view: "edit", model: [personInstance: personInstance])
				return
			}
		}

		if (personInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (personInstance.version > version) {
					personInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'person.label', default: 'Person')]
					as Object[], "Another user has updated this Person while you were editing")
					render(view: "edit", model: [personInstance: personInstance])
					return
				}
			}
			personInstance.properties = params
			personInstance.dateOfBirth = DateUtil.parseToDate(params.dateOfBirthString)
			personInstance.dateOfDeath = DateUtil.parseToDate(params.dateOfDeathString)

			if (!personInstance.hasErrors() && personInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
				redirect(action: "show", id: personInstance.id)
			}
			else {
				render(view: "edit", model: [personInstance: personInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def personInstance = Person.get(params.id)
		if (personInstance) {
			try {
				personInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(action: "list")
		}
	}
}
