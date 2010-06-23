package de.uni_koeln.hki.thaller

class Work {

	String title
	String subtitle
	Date releaseDate
	
	static hasMany = [persons:Person]
	static belongsTo = Person
	
    static constraints = {
    }
}