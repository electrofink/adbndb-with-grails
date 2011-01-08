package query.util

import groovy.sql.Sql
import java.text.SimpleDateFormat
import de.uni_koeln.hs.*

class ResultObject {

	def dataSource

	def person = [:]

	ResultObject(dataSource) {
		this.dataSource = dataSource
	}

	def simpleSearch = { q ->

		q.each { eachSearchString ->

			getPersonByName(eachSearchString)

			getPersonByConfession(eachSearchString)

			getPersonByWork(eachSearchString)

			getPersonByLocation(eachSearchString, null, null)
		}
		return person
	}

	def getPersonByName = { searchString ->
		def name = Name.withCriteria {
			or {
				like('lastName', "%"+searchString+"%")
				like('firstName', "%"+searchString+"%")
			}
		}
		if(name != []) {
			def n = retrievePersonIdByName(name)
			if(n != []) {
				n.each {person.put(it, ++person.get(it, 0))}
			}
		}
	}

	def getPersonByConfession = { searchString ->

		def confession = Confession.withCriteria {
			like('confessionType', "%"+searchString+"%")
		}
		if(confession != []) {
			def c = retrievePersonIdByConfession(confession)
			if(c != []) {
				c.each {person.put(it, ++person.get(it, 0))}
			}
		}
	}

	def getPersonByWork = { searchString ->

		def work = Work.withCriteria {
			or {
				like('workTitle', "%"+searchString+"%")
				like('subtitle', "%"+searchString+"%")
			}
		}
		if(work != []) {
			def w = retrievePersonByWork(work)
			if(w != []) {
				w.each {person.put(it, ++person.get(it, 0))}
			}
		}
	}

	def getPersonByLocation = { searchString, begin, end ->
		def location = Location.withCriteria {
			or {
				like('country', "%"+searchString+"%")
				like('city', "%"+searchString+"%")
			}
		}
		def parsedBegin, parsedEnd
		def sdf = new SimpleDateFormat("yyyy-MM-dd")

		if(location != []) {
			def l
			// If no date is specified, don't search with it (simpleSearch).
			if (begin == null && end == null)
				l = retrievePersonIdByLocation(location)
			// At least one of them is not null
			else {
				
				// In case only one of them is given...
				if (begin != null)
					parsedBegin = sdf.parse(begin)
				else
					parsedBegin = new Date()
				// ... set the other to now.
				if (end != null)
					parsedEnd = sdf.parse(end)
				else
					parsedEnd = new Date()
				
				// Only sensible input, please.	
				if (parsedEnd > parsedBegin) {
					def person_locations = PersonLocations.withCriteria {
						and {
							between('startDate', parsedBegin, parsedEnd)
							between('endDate', parsedBegin, parsedEnd)
						}
					}
					l = retrievePersonIdByPersonLocations(person_locations)
				}
			}

			if(l != []) {
				l.each {person.put(it, ++person.get(it, 0))}
			}
		}
	}

	def nameSearch = { q ->
		q.each { eachSearchString -> getPersonByName(eachSearchString) }
	}

	def birthSearch = {}

	def deathSearch = {}

	def confessionSearch = { q ->
		q.each { eachSearchString -> getPersonByConfession(eachSearchString) }
	}

	def workSearch = { q ->
		q.each { eachSearchString -> getPersonByWork(eachSearchString) }
	}

	def locationSearch = { location, begin, end ->
		getPersonByLocation(location, begin, end)
	}

	def retrievePersonIdByName =  { name ->
		def db = new Sql(dataSource)
		def listOfPersonID = []
		name.each {
			def rows = db.rows("SELECT person_id FROM name WHERE id = " + it.id)
			rows.each { listOfPersonID.add(it.getProperty("person_id")) }
		}
		return listOfPersonID
	}

	def retrievePersonIdByLocation = { location ->
		def db = new Sql(dataSource)
		def listOfPersonID = []
		location.each {
			def rows = db.rows("SELECT person_id FROM person_locations WHERE location_id = " + it.id)
			rows.each { listOfPersonID.add(it.getProperty("person_id")) }
		}
		return listOfPersonID
	}

	def retrievePersonIdByPersonLocations = { person_locations ->
		def db = new Sql(dataSource)
		def listOfPersonID = []
		person_locations.each {
			def rows = db.rows("SELECT person_id FROM person_locations WHERE location_id = " + it.location.id)
			rows.each { listOfPersonID.add(it.getProperty("person_id")) }
		}
		return listOfPersonID
	}

	def retrievePersonIdByConfession = { confession ->
		def db = new Sql(dataSource)
		def listOfPersonID = []
		confession.each {
			def rows = db.rows("SELECT person_id FROM person_confessions WHERE confession_id = " + it.id)
			rows.each { listOfPersonID.add(it.getProperty("person_id")) }
		}
		return listOfPersonID
	}

	def retrievePersonIdByWork = { work ->
		def db = new Sql(dataSource)
		def listOfPersonID = []
		work.each {
			def rows = db.rows("SELECT person_id FROM person_works WHERE work_id = " + it.id)
			rows.each { listOfPersonID.add(it.getProperty("person_id")) }
		}
		return listOfPersonID
	}
}
