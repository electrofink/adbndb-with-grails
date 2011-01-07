package de.uni_koeln.hs

import util.DateValidator;

class Person {

	String geboren
	String gestorben
	String biographie
	boolean gender


	static hasMany = [names:Name, relations:Relation, locations:Location, confessions:Confession,
		works:Work]

	static mapping = {
		locations joinTable: [name:"person_locations", key: "person_id"]
		columns {
			biographie column:'bio'
			geboren column: 'date_of_birth'
			gestorben column: 'date_of_death'
		}
	}

	static constraints = {

		geboren(nullable:true, validator:{val, obj ->
			return DateValidator.validate(val, false)
		})

		gestorben(nullable:true, validator:{val, obj ->
			return DateValidator.validate(val, true)
		})

		biographie(maxSize:100000, nullable: true)
	}

	String toString () {
		return "Person: ${this.id}"
	}

	String shortBio() {
		if (biographie == null)
			return ""
		else if (biographie.length() > 360)
			return "${biographie.substring(0, 360)}"
		else
			return "${biographie}"
	}
}
