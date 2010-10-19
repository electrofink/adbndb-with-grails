package de.uni_koeln.hs

class SearchController {
	
	static allowedMethods = [result:"POST"]
	
	def index = {
	}
	
	def result = {
		
		def q = params.query.split();		
		def matches = []
		def person = [:]
		
		q.each { str ->  
			
			def name = Name.withCriteria {
				or {
					like('lastName', "%"+str+"%")
					like('firstName', "%"+str+"%")
				}
			}
			
			def location = Location.withCriteria {
				or {
					like('country', "%"+str+"%")
					like('city', "%"+str+"%")
				}
			}
			
			def confession = Confession.withCriteria {
				like('confessionType', "%"+str+"%")
			}
			
			def work = Work.withCriteria {
				or {
					like('workTitle', "%"+str+"%")
					like('subtitle', "%"+str+"%")
				}
			}
						
			if(name != []) {
				def n = retrievePersonByName(name)
				n.each {person.put(it, ++person.get(it,1))}
			}
			if(location != []) {
				def l = retrievePersonByLocation(location)
				l.each {person.put(it, ++person.get(it, 1))}
			}
			if(confession != []) {
				def c = retrievePersonByConfession(confession)
				c.each {person.put(it, ++person.get(it, 1))}
			}
			if(work != []) {
				def w = retrievePersonByWork(work)
				w.each {person.put(it, ++person.get(it, 1))}
			}
			
			
			person.each {println(it)}
			
			
		}
	}
	
	def retrievePersonByName =  { name -> 
		Name.executeQuery("select n.person.id from Name n where n.id = :id", [id: name.id])
	}
	
	def retrievePersonByLocation = { location ->
		Location.executeQuery("select pl.person.id from PersonLocations pl where pl.location.id = :id", [id: location.id])
	}
	
	def retrievePersonByConfession = { confession -> 
		Confession.executeQuery("select pc.person.id from PersonConfessions pc where pc.confessionn.id = :id", [id: confession.id])
	}
	
	def retrievePersonByWork = { work ->
		Work.executeQuery("select pw.person.id from PersonWorks pw where pw.work.id = :id", [id: work.id])
	}
	
	
	
}