package de.uni_koeln.hs

class Relation {
	
	
	boolean directRelation
	
	Person relatedPerson

	static belongsTo = [person:Person]
	
	static constraints = {
	}
	
	@Override
	String toString() {
		return "ID: " + this.id + "[Rel: " + relatedPerson.toString() + " / " + person.toString()+"]"
	}
}
