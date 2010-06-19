package de.uni_koeln.hki.thaller

class Name {
	
	String firstNames
	String lastName
	String birthName
	
	static belongsTo = [person:Person]

    static constraints = {
    }
}
