package de.uni_koeln.hs

class Name {
	
	String firstName
	String lastName
	String other
	
	static belongsTo = [person:Person]
	
	static constraints = {
		person(nullable:false)
		firstName(nullable:true)
		lastName(nullable:true)
		other(nullable:true)
	}
	
	@Override
	String toString() {
		return "${lastName}, ${firstName}"
	}
}
