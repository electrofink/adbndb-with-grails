package de.uni_koeln.hki.thaller

import grails.test.*

class InterfaceTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testQueryPersonFromDbByName() {
    	//def p = Person.get(1)‘
		def c = Person.createCriteria()
		def results = c.list {
			eq("id", (Long)2)
		}
    }
}
