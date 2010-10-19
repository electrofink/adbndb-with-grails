package de.uni_koeln.hs

import util.DateValidator;

class Person {
	
	String dateOfBirth
	String dateOfDeath
	String bio
	boolean gender
	
	
	static hasMany = [names:Name, relations:Relation, locations:Location, confessions:Confession,
		works:Work]
	
	static mapping = {
		locations joinTable: [name:"person_locations", key: "person_id"]
	}
	
	static constraints = {
		
		dateOfBirth(nullable:false, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})
		
		dateOfDeath(nullable: true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})
		
		bio(maxSize:10000, blank:true)
	}
	
	
	def shortBio() {
		if(bio.length() > 200)
			return bio.substring(0, 200)
		return bio
	}
	
	@Override
	String toString() {
		if(names != null)
			return names.toString()+": "+this.id
		return this.ident().toString()
	}
}