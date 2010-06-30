package de.uni_koeln.hki.thaller

import java.util.StringTokenizer;

class Person {
	
	String bio
	String  dateOfBirth
	String  dateOfDeath
	boolean gender
	
	String year
	String month
	String day
	
	
	static transients = [ "year", "month", "day" ]
	
	
	static hasMany = [names:Name, relations:Relation, confessions:Confession,
	locations:Location, works:Work]
	
	static constraints = {
		dateOfBirth(validator:{val, obj ->
			if(val?.matches("[0-9]{3,4}(-[0-9]{2})?(-[0-9]{2})?")) {
				String[] str = val?.split("-")
				for (int i = 0; i < str.length; i++) {
					String s = str[i];
					switch(i) {
					
						case 0 : 
							boolean a = s.length() == 3 || s.length() == 4; 
							System.out.println("case 1"+a);
							break;
						case 1 : 
							boolean a = s.length() == 2 && Integer.parseInt(s) <= 12;
							System.out.println("case 2"+a); 
							break;
						case 2 : 
							boolean a = s.length() == 2 && Integer.parseInt(s) <= 31;
							System.out.println("case 3"+a); 
							break;
						default: 
							break;
					}
				}
				
				return true
			}
			else {
				return false
			}
			
			
			
			//			if(obj.dateOfDeath != null)
			//			if(val?.compareTo(obj.dateOfDeath) >= 0) {
			//				return false
			//			}
		})
		dateOfDeath(nullable:true)
		bio(maxSize:10000)
	}
	
	
	
}
