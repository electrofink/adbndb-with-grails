package de.uni_koeln.hs

import query.util.ResultObject

class AdvancedSearchController {
	
	static allowedMethods = [result: "POST"]
	
	def dataSource
	
    def index = { }

	def result = {
		
		def name, birth, death, confession, work, location, begin, end
		
		if (params.name != null)
			name = params.name.split()
			
		if (params.birth != null)
			birth = params.birth.split()
			
		if (params.death != null)
			death = params.death.split()
			
		if (params.confessionType != null)
			confession = params.confessionType
			
		if (params.work != null)
			work = params.work.split()
			
		if (params.location != null)
			location = params.location
			
		if (params.locationBegin != null)
			begin = params.locationBegin
			
		if (params.locationEnd != null)
			end = params.locationEnd
		
		ResultObject ro = new ResultObject(dataSource)
		ro.locationSearch(location, begin, end)
		println "person hashmap: " + ro.getPersonHashMap()
		def sortedList = sortByRelevance(ro.getPersonHashMap())
		// [personIDs : sortedList.keySet()]
		
		def personInstanceList = []
		
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		[personInstanceList : personInstanceList]
	
	}
	
}
