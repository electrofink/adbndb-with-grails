package de.uni_koeln.hki.thaller

import validator.DateValidator;


class Relation {

	String startRelation
	String endRelation
	
	boolean directRelation
	
	Person relatedPerson
	
	
	static belongsTo = [person:Person]

    static constraints = {
		relatedPerson(nullable:true)
		startRelation(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
		endRelation(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
    }
}
