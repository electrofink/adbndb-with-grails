package de.uni_koeln.hki.thaller

class InterfaceController {
	
	static allowedMethods = [save: "POST"]
	
	def index = {
		redirect(action: "create", params:params)
	}
	
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }
	
	def create = {
		def personInstance = new Person()
		personInstance.properties = params
		[personInstance:personInstance]
	}
	
	def save = {
		def personInstance = new Person(params)
		personInstance.addToNames(new Name(params))
		personInstance.addToConfessions(new Confession(params))
		personInstance.addToLocations(new Location(params))
		personInstance.addToRelations(new Relation(params))
		personInstance.addToWorks(new Work(params))
		
		if (personInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
			redirect(action: "show", id: personInstance.id)
		} else {
			render(view: "create", model: [personInstance: personInstance])
		}
	}
		
    def show = {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personInstance: personInstance]
        }
    }
}
