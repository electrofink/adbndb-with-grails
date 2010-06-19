package de.uni_koeln.hki.thaller

class Location {

	String name
	String description
	float latitude //north to south
	float longitude // east to west
	java.sql.Date start
	java.sql.Date end
	
	static belongsTo = [person:Person]
	
	static constraints = {
	}
}
