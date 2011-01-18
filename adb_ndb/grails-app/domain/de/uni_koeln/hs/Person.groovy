package de.uni_koeln.hs

import util.DateUtil;

class Person {

	java.util.Date dateOfBirth
	java.util.Date dateOfDeath
	
	String dateOfBirthString
	String dateOfDeathString
	
	String bio
	boolean gender

	static transients = ["dateOfBirthString", "dateOfDeathString"]

	static hasMany = [names:Name, relations:Relation, locations:Location, confessions:Confession,
		works:Work]

	static mapping = {
		locations joinTable: [name:"person_locations", key: "person_id"]
	}

	static constraints = {
		dateOfBirth(nullable:true)
		dateOfDeath(nullable:true)
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
