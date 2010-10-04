package de.uni_koeln.hs

class Name {
	
	String firstName
	String lastName
	
	static belongsTo = [person:Person]
	
	static constraints = {
		person(nullable:false)
		firstName(blank:false)
		lastName(blank:false)
	}
	
	@Override
	String toString() {
		return lastName+", "+firstName
	}
}
