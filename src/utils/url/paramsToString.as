package utils.url
{
	import utils.object.getKeys;
	import utils.string.supplant;
	
	/**
	 * Convert the object to a query parameter string of form: <code>&amp;PROP1=VAL1&amp;PROP2=VAL2</code>
	 * where:
	 * <ul>
	 * <li><code>PROP</code> is a property of the object</li>
	 * <li><code>VAL</code> is its corresponding value</li>
	 * </ul>
	 *
	 * @param obj Object to convert
	 * @return An string of all property/value pairs formatted as a HTTP query params
	 */
	
	public function paramsToString(obj:Object = null):String
	{
		if ( obj == null )
		{
			return "";
		}
		else
		{
			var ret:Array = [];
			
			for each (var it:* in getKeys(obj))
			{
				ret.push( supplant("&{0}={1}",[ it, obj[it] ]) );
			}
			return ret.join("");
		}
	}
}