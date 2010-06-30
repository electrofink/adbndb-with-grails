package de.uni_koeln.hki.thaller

import validator.DateValidator;

class Work {
	
	String title
	String subtitle
	String releaseDate
	
	static hasMany = [persons:Person]
	static belongsTo = Person
	
	static constraints = {
		releaseDate(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
	}
}
