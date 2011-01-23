package de.uni_koeln.hs

import util.DateUtil;

class Work {
	
	Integer id
	
	String workTitle
	String subtitle
	java.util.Date releaseDate
	
	String releaseDateAsString
	
	static belongsTo = Person
	static hasMany = [persons:Person]
	
	static transients = ["releaseDateAsString"]
	
	static constraints = {
		workTitle(blank:false)
		subtitle(blank:true)
		releaseDate(nullable:true)
	}
	
	@Override
	String toString() {
		return "${workTitle}"
	}
}
