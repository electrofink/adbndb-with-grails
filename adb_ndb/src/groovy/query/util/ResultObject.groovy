package query.util

import groovy.sql.Sql
import util.DateUtil
import de.uni_koeln.hs.*

class ResultObject {

	def dataSource

	def person = [:]

	ResultObject(dataSource) {
		this.dataSource = dataSource
	}
	
	def getSortedPersonHashMap() {
		return sortByRelevance(person)
	}
	
	def sortByRelevance = { map ->
		def sortedMap = map.sort { a, b ->
			b.value <=> a.value
		}
	}

	def simpleSearch = { q ->

		q.each { eachSearchString ->

			getPersonByName(eachSearchString)

			getPersonByConfession(eachSearchString)

			getPersonByWork(eachSearchString)

			getPersonByLocation(eachSearchString, "", "")
		}
		//return person
	}

	def getPersonByName = { searchString ->
		def name = Name.withCriteria {
			or {
				like('lastName', "%"+searchString+"%")
				like('firstName', "%"+searchString+"%")
				like('other', "%"+searchString+"%")
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
			def w = retrievePersonIdByWork(work)
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

		if(location != []) {
			def l
			// If no date is specified, don't search with it (simpleSearch).
			if (begin == "" && end == "") {
				l = retrievePersonIdByLocation(location)
			}
			// At least one of them is not null
			else {			
				// In case only one of them is given...
				if (begin != "")
					parsedBegin = DateUtil.parseToDate(begin)
				else
					parsedBegin = new Date()
				// ... set the other to now.
				if (end != "")
					parsedEnd = DateUtil.parseToDate(end)
				else
					parsedEnd = new Date()
				
				// Only sensible input, please.
				if (parsedEnd > parsedBegin) {
					def person_locations = PersonLocations.withCriteria {
						or {
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

	def nameSearch = { searchString ->
		getPersonByName(searchString)
	}

	def bioDataSearch = { birth, death ->
		
		def parsedBirth, parsedDeath
		
		// In case only one of them is given...
		if (birth != "")
			parsedBirth = DateUtil.parseToDate(birth)
		else
			parsedBirth = new Date()
		// ... set the other to now.
		if (death != "")
			parsedDeath = DateUtil.parseToDate(death)
		else
			parsedDeath = new Date()
		
		if (parsedDeath > parsedBirth) {
			def b = []
			def biodata = Person.withCriteria {
				or {
					between('dateOfBirth', parsedBirth, parsedDeath)
					between('dateOfDeath', parsedBirth, parsedDeath)
				}
			}
			if (biodata != []) {
				b.addAll(biodata.id)
				if(b != []) {
					b.each {person.put(it, ++person.get(it, 0))}
				}
			}
		}
	}

	def genderSearch = { gender ->
		def g = []
		
		if (gender == "m")
			gender = true
		else if (gender == "w")
			gender = false
		else
			return
			
		def genderPersons = Person.withCriteria {
			eq('gender', gender)
		}
		
		if (genderPersons != []) {
			g.addAll(genderPersons.id)
			if (g != []) {
				g.each {person.put(it, ++person.get(it, 0))}
			}
		}
	}
	
	def confessionSearch = { searchString ->
		getPersonByConfession(searchString)
	}

	def workSearch = { searchString ->
		getPersonByWork(searchString)
	}

	def locationSearch = { searchString, begin, end ->
		getPersonByLocation(searchString, begin, end)
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
