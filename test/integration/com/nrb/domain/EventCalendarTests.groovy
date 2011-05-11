package com.nrb.domain

import grails.test.*

class EventCalendarTests extends GroovyTestCase {
	def eventService
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		Date d = Date.parse("yyyy-MM-dd HH:mm:ss", "2011-01-23 23:43:22")
    }
}
