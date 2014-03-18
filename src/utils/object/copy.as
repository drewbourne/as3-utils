package utils.object
{
	import utils.array.arrayContainsValue;
	import utils.object.getKeys;

	/**
	 *   Copy an object
	 *   @param src Object to copy
	 *   @param target (optional) Object to copy into. If null, a new object
	 *                is created.
	 *   @return A one-level deep copy of the object or null if the argument
	 *           is null
	 *   @author Jackson Dunstan
	 */
	public function copy(src:Object, target:Object = null, excludes:Array=null):Object
	{
		src    		||= new Object;
		target 		||= new Object;
		excludes 	||= [ ];
		
		var properties : Array = getKeys(src);
		
		for each (var key:Object in properties) {
			try {
				var skip : Boolean = arrayContainsValue(excludes, key); 
				
				if ( !skip )
					target[key] = src[key];
				
			} catch (e:Error) { ; }
		}
		return target;
	}
}