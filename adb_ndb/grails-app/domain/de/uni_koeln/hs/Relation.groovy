package de.uni_koeln.hs

class Relation {
	
	
	boolean directRelation
	
	/*Person person1 
	Person person2*/
	
	static hasMany = [persons:Person]	
	
	static belongsTo = Person
	
	static constraints = {
	}
	
	@Override
	String toString() {
		return relatedPerson.toString()
	}
}
