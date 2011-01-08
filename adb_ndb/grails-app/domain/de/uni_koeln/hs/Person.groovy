package de.uni_koeln.hs

import util.DateValidator;

class Person {

	java.sql.Date dateOfBirth
	java.sql.Date dateOfDeath
	String bio
	boolean gender


	static hasMany = [names:Name, relations:Relation, locations:Location, confessions:Confession,
		works:Work]

	static mapping = {
		locations joinTable: [name:"person_locations", key: "person_id"]
	}

	static constraints = {

		dateOfBirth(nullable:true, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})

		dateOfDeath(nullable:true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})

		bio(maxSize:100000, nullable: true)
	}

	String toString () {
		return "Person: ${this.id}"
	}

	String shortBio() {
		if (bio == null)
			return ""
		else if (bio.length() > 360)
			return "${bio.substring(0, 360)}..."
		else
			return "${bio}"
	}
}
