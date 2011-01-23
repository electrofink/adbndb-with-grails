package de.uni_koeln.hs

import query.util.ResultObject

class AdvancedSearchController {
	
	static allowedMethods = [result: "POST"]
	
	def dataSource
	
    def index = { }

	def result = {
		
		def name, birth, death, gender, confession, work, location, begin, end
		
		name = params.name
		birth = params.birth
		death = params.death
		gender = params.gender
		confession = params.confessionType
		work = params.work
		location = params.location
		begin = params.locationBegin
		end = params.locationEnd
		
		ResultObject ro = new ResultObject(dataSource)
		
		if (name != "")
			ro.nameSearch(name)
		if (birth != "" || death != "")
			ro.bioDataSearch(birth, death)
		if (gender != "")
			ro.genderSearch(gender)
		if (confession != "")
			ro.confessionSearch(confession)
		if (work != "")
			ro.workSearch(work)
		if (location != "")
			ro.locationSearch(location, begin, end)	
		
		def sortedList = ro.getSortedPersonHashMap()
		def personInstanceList = []
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personInstanceList : personInstanceList, personInstanceTotal: personInstanceList.size()]
	
	}
	
}
