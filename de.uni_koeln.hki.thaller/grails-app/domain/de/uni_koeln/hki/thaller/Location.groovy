package de.uni_koeln.hki.thaller

import validator.DateValidator;

class Location {
	
	String name
	String description
	float latitude //north to south
	float longitude // east to west
	String startLocation
	String endLocation
	
	static belongsTo = [person:Person]
	
	static constraints = {
		startLocation(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
		endLocation(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
	}
}
