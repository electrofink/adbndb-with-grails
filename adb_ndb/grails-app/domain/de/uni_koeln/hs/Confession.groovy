package de.uni_koeln.hs

class Confession {

	String confessionType
	
	static hasMany = [person:Person]
	static belongsTo = Person
	
	static constraints = {
		confessionType(blank:false)
	}
	
	String toString() {
		return confessionType
	}
}
