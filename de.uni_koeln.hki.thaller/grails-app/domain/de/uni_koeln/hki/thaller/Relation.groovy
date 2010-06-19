package de.uni_koeln.hki.thaller

class Relation {

	java.sql.Date start
	java.sql.Date end
	
	boolean directRelation
	
	Person relatedPerson
	
	static belongsTo = [person:Person]

    static constraints = {
		relatedPerson(nullable:true)
    }
}
