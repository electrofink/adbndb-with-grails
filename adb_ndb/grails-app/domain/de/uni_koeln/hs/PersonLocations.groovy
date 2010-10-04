package de.uni_koeln.hs

import util.DateValidator;

class PersonLocations {
	
	static mapping = {
		table "person_locations"
		version false
//		location updateable: false
//		location insertable: false
	}
	
    static belongsTo = [person:Person, location:Location]
	
	Location location
	String startDate
	String endDate
	
	static constraints = {
		startDate(nullable:false, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})
		
		endDate(nullable: false, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})
	}
}
