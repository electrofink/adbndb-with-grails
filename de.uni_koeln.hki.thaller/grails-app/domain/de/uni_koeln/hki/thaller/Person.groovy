package de.uni_koeln.hki.thaller

import validator.DateValidator;

class Person {
	
	String bio
	String  dateOfBirth
	String  dateOfDeath
	boolean gender
	
	static hasMany = [names:Name, relations:Relation, confessions:Confession,
	locations:Location, works:Work]
	
	static constraints = {
		dateOfBirth(validator:{val, obj ->
			return DateValidator.validate(val, false)
		})
		
		
		dateOfDeath(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
		bio(maxSize:10000)
	}
	
	
	
}
