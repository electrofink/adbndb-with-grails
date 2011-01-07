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
		def location = params.location.split()
		def begin = params.begin.split()
		def end = params.end.split()
		
		ResultObject ro = new ResultObject(dataSource)
		def sortedList = sortByRelevance(ro.search(q))
		// [personIDs : sortedList.keySet()]
		
		def personInstanceList = []
		
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		[personInstanceList : personInstanceList]
	
	}
	
}
