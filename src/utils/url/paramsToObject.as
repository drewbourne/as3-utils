package utils.url
{
	import utils.object.merge;
	
	/**
	 * Convert the query parameter string of form: <code>&amp;PROP1=VAL1&amp;PROP2=VAL2</code> 
	 * to a hashmap of name/value pairs; where:
	 * <ul>
	 * <li><code>PROP</code> is a property of the object</li>
	 * <li><code>VAL</code> is its corresponding value</li>
	 * </ul>
	 *
	 * @param str String to convert
	 * @return A Hashmap of all name/value pairs
	 */
	
	public function paramsToObject(str:String, defaultObj:Object=null, delimiter:String="&"):Object
	{
		var results : Object = new Object;
		
		if ( str && (str != "") )
		{
			// Strip the `?` prefix (if any)
			
			var index:Number = str.indexOf('?');
			if (index > -1)
				str = str.substr(index + 1);
			
			// Now gather all the field name/value pairs
			
			var fields:Array = str.split(delimiter);
			
			for each (var it:String in fields)
			{
				var pair : Array = it.split("=");
				
				if (pair && (pair.length == 2)) 
				{
					// Create name = value field in hashmap
					
					results[ pair[0] ] = pair[1];	
				}
			}
		}
		
		return merge(results,defaultObj);
	}

}