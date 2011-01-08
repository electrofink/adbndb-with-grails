package de.uni_koeln.hs

import query.util.ResultObject;

class AdvancedSearchController {
	
	static allowedMethods = [simpleSearch: "POST"]
	
	def dataSource
	
    def index = { }

	def result = {
		def name = params.name.split()
		def birth = params.birth.split()
		def death = params.death.split()
		def confession = params.confession.split()
		def work = params.work.split()
		def location = params.location
		def begin = params.begin
		def end = params.end
		
		ResultObject ro = new ResultObject(dataSource)
		def sortedList = sortByRelevance(ro.locationSearch(location, begin, end))
		// [personIDs : sortedList.keySet()]
		
		def personInstanceList = []
		
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		[personInstanceList : personInstanceList]
	
	}
	
}
