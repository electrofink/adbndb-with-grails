package de.uni_koeln.hs
import groovy.sql.Sql

class SearchController {
	
	static allowedMethods = [result:"POST"]
	
	def dataSource
	
	def index = {
	}
	
	def result = {
		
		def q = params.query.split();		
		def matches = []
		def person = [:]
		
		q.each { eachSearchString ->
			
			def name = Name.withCriteria {
				or {
					like('lastName', "%"+eachSearchString+"%")
					like('firstName', "%"+eachSearchString+"%")
				}
			}
			
			def location = Location.withCriteria {
				or {
					like('country', "%"+eachSearchString+"%")
					like('city', "%"+eachSearchString+"%")
				}
			}
			
			def confession = Confession.withCriteria {
				like('confessionType', "%"+eachSearchString+"%")
			}
			
			def work = Work.withCriteria {
				or {
					like('workTitle', "%"+eachSearchString+"%")
					like('subtitle', "%"+eachSearchString+"%")
				}
			}
			
			if(name != []) {
				def n = retrievePersonByName(name)
				if(n != []) {
					n.each {person.put(it, ++person.get(it, 0))}
				}
			}
			if(location != []) {
				def l = retrievePersonByLocation(location)
				if(l != []) {
					l.each {person.put(it, ++person.get(it, 0))}
				}
			}
			if(confession != []) {
				def c = retrievePersonByConfession(confession)
				if(c != []) {
					c.each {person.put(it, ++person.get(it, 0))}
				}
			}
			if(work != []) {
				def w = retrievePersonByWork(work)
				if(w != []) {
					w.each {person.put(it, ++person.get(it, 0))}
				}
			}
		}
		
	}
	
	def retrievePersonByName =  { name ->
		def toReturn = [] 
		name.each {
			def rows = Name.executeQuery("select n.person.id from Name n where n.id = :id", [id: it.id])
			rows.each { toReturn.add(it) }
		}
		return toReturn
	}
	
	def retrievePersonByLocation = { location ->
		def toReturn = []
		location.each { 
			def rows = Location.executeQuery("select pl.person.id from PersonLocations pl where pl.location.id = :id", [id: it.id])
			rows.each { toReturn.add(it) }
		}
		return toReturn
	}
	
	def retrievePersonByConfession = { confession -> 
		def db = new Sql(dataSource)
		def toReturn = []
		confession.each {
			def rows = db.rows("SELECT person_id FROM person_confessions WHERE confession_id = " + it.id)
			rows.each { toReturn.add(it.getProperty("person_id")) }
		}
		return toReturn
	}
	
	def retrievePersonByWork = { work ->
		def db = new Sql(dataSource)
		def toReturn = []
		work.each {
			def rows = db.rows("SELECT person_id FROM person_works WHERE work_id = " + it.id)
			rows.each { toReturn.add(it.getProperty("person_id")) }
		}
		return toReturn
	}
}
