package de.uni_koeln.hs

import query.util.ResultObject;

class SearchController {

	static allowedMethods = [simpleSearch: "POST"]
	
	def dataSource

	def index = { }

	def result = {
		def q = params.query.split()
		ResultObject ro = new ResultObject(dataSource)
		def sortedList = sortByRelevance(ro.simpleSearch(q))
		// [personIDs : sortedList.keySet()]
		
		def personInstanceList = []
		
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		[personInstanceList : personInstanceList]
	
	}


	def sortByRelevance = { map ->
		def sortedMap = map.sort { a, b ->
			b.value <=> a.value
		}
	}
}
