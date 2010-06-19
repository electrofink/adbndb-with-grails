#!/bin/bash

for x in `ls grails-app/domain/de/uni_koeln/hki/thaller/`
	do
		y=`basename $x .groovy`
		grails generate-all de.uni_koeln.hki.thaller.$y
	done
exit 0
