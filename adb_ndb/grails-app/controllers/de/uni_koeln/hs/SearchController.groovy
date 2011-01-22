package de.uni_koeln.hs

import query.util.ResultObject;

class SearchController {

	static allowedMethods = [result: "POST"]

	def dataSource

	def result = {
		def q = params.query.split()
		ResultObject ro = new ResultObject(dataSource)
		ro.simpleSearch(q)
		def sortedList = ro.getSortedPersonHashMap()
		def personInstanceList = []
		sortedList.keySet().each {
			def p = Person.get(it)
			personInstanceList.add(p)
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personInstanceList: personInstanceList, personInstanceTotal: personInstanceList.size()]
	}
}
