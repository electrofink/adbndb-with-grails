package de.uni_koeln.hs

import util.DateValidator;

class PersonLocations {
	
	static mapping = {
		table "person_locations"
		version false
	}
	
    static belongsTo = [person:Person, location:Location]
	
	Location location
	String startDate
	String endDate
	
	static constraints = {
		startDate(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})
		
		endDate(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})

	}
}
