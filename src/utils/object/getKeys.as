package utils.object
{
	import flash.utils.describeType;

	/**
	   Creates an Array comprised of all the keys in an Object.
	   Note: works on Class instances, Dynamic Class instances, and Object instances

	   @param obj: Object in which to find keys.
	   @return Array containing all the string key names.
	 */
	public function getKeys(source:Object):Array
	{
		var keys		: Array   = [ ];
		var def 		: XML 	  = describeType(source);
		var isDynamic   : Boolean = String(def.@isDynamic) == "true";
		
		if (isDynamic == true) {
			// Scan dynamic or Object classes for list of properties
			for (var dKey:* in source) keys.push(dKey);	
		}
		else {
			// Scan regular classes for list of properties
			var properties  : XMLList = def..variable.@name + def..accessor.@name;
			for each (var sKey:* in properties) {
				keys.push(sKey);
			}
		}

		return keys;
	}
}