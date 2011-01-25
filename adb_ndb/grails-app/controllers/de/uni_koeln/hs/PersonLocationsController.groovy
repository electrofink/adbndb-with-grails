package de.uni_koeln.hs

import util.DateUtil

class PersonLocationsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	/*
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
			redirect(controller: "person", action: "show", id: personLocationsInstance.person.id)
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
	*/

	
    def edit = {
		def ps = PersonLocations.withCriteria {
			eq('person.id', new Integer(params.person_id))
			eq('location.id', new Integer(params.location_id))
		}
        def personLocationsInstance = PersonLocations.get(ps.get(0).id)
        if (!personLocationsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(controller: "person", action: "show", id: personLocationsInstance.person.id)
        }
        else {
			// If not null converted into String and placed in person.edit.gsp input field
			if(personLocationsInstance.startDate)
				personLocationsInstance.startDateString = DateUtil.getStringFromDate(personLocationsInstance.startDate)

			if(personLocationsInstance.endDate)
				personLocationsInstance.endDateString = DateUtil.getStringFromDate(personLocationsInstance.endDate)

            return [personLocationsInstance: personLocationsInstance]
        }
    }

    def update = {
        def personLocationsInstance = PersonLocations.get(params.id)
		
		// Get values from text fields [startDateString, endDateString] in personLocation.edit.gsp
		personLocationsInstance.startDateString = params.startDateString
		personLocationsInstance.endDateString = params.endDateString
		
		def start_date, end_date

		if(params.startDateString) {
			start_date = DateUtil.parseToDate(params.startDateString)
			if(start_date == null) {
				personLocationsInstance.errors.rejectValue('dateOfBirthString','date.invalid.format.message')
				render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
				return
			}
		}

		if (params.endDateString) {
			end_date = DateUtil.parseToDate(params.endDateString)
			if(end_date == null) {
				personLocationsInstance.errors.rejectValue('dateOfDeathString','date.invalid.format.message')
				render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
				return
			}
		}

		// Case startDate is before endDate
		if(start_date != null && end_date != null) {
			if(start_date.after(end_date)) {
				def arg0 = DateUtil.getStringFromDate(start_date)
				def arg2 = DateUtil.getStringFromDate(end_date)
				personLocationsInstance.errors.rejectValue('startDateString',"${message(code: 'custom.date.invalid.validator.message', args: [arg0, 'Gestorben', arg2, 'Geboren'])}")
				personLocationsInstance.errors.rejectValue('endDateString','')
				render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
				return
			}
		}
		
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
			personLocationsInstance.startDate = DateUtil.parseToDate(params.startDateString)
			personLocationsInstance.endDate = DateUtil.parseToDate(params.endDateString)
			
            if (!personLocationsInstance.hasErrors() && personLocationsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), personLocationsInstance.id])}"
                redirect(controller: "person", action: "edit", id: personLocationsInstance.person.id)
            }
            else {
                render(view: "edit", model: [personLocationsInstance: personLocationsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(controller: "person", action: "edit", id: personLocationsInstance.person.id)
        }
    }

    def delete = {
        def personLocationsInstance = PersonLocations.get(params.id)
        if (personLocationsInstance) {
            try {
                personLocationsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
                redirect(controller: "person", action: "edit", id: personLocationsInstance.person.id)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
                redirect(controller: "person", action: "show", id: personLocationsInstance.person.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personLocations.label', default: 'PersonLocations'), params.id])}"
            redirect(controller: "person", action: "show", id: personLocationsInstance.person.id)
        }
    }
}
