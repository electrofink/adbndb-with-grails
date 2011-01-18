package de.uni_koeln.hs

import util.DateUtil;

class PersonLocations {
	
	static mapping = {
		table "person_locations"
		version false
	}
	
    static belongsTo = [person:Person, location:Location]
	
	Location location
	
	java.util.Date startDate
	java.util.Date endDate
	
	String startDateString
	String endDateString
	
	static transients = ["startDateString", "endDateString"]
	
	static constraints = {
		startDate(nullable: true)
		endDate(nullable: true)

	}
}
