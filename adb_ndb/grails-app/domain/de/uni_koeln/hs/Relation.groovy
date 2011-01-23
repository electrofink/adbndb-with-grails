package de.uni_koeln.hs

class Relation {

	Integer id
	
	boolean directRelation

	Person relatedPerson

	static belongsTo = [person:Person]

	static constraints = {
	}

	@Override
	String toString() {
		return "${relatedPerson.names.lastName}"
	}
}
