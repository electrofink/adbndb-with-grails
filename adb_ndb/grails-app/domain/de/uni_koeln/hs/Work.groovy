package de.uni_koeln.hs

import util.DateUtil;

class Work {
	
	String workTitle
	String subtitle
	String releaseDate
	
	static belongsTo = Person
	static hasMany = [persons:Person]
	
	static constraints = {
		workTitle(blank:false)
		subtitle(blank:true)
		
		releaseDate(blank: true, validator:{val, obj ->
			return DateUtil.parseToDate(val, true)
		})
	}
	
	@Override
	String toString() {
		if(releaseDate.length() > 0)
			return workTitle+" ("+releaseDate+")"
		return workTitle
	}
}
