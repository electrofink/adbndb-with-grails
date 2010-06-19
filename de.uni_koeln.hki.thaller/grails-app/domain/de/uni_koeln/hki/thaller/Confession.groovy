package de.uni_koeln.hki.thaller

class Confession {
	

	String title
	
	java.sql.Date start
	java.sql.Date end
	
	static belongsTo = [person:Person]
	
	static constraints = {
	}
}
