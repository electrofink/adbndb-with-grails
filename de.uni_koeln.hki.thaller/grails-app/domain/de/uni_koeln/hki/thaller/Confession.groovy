package de.uni_koeln.hki.thaller

import validator.DateValidator;


class Confession {
	
	String title
	String startConfession
	String endConfession
	
	static belongsTo = [person:Person]
	
	static constraints = {
		startConfession(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
		endConfession(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
	}
}
