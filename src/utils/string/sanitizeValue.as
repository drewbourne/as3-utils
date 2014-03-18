package utils.string
{
	/**
	 * Convert incoming Number or String to proper string value or return default.
	 */
	public function sanitizeValue(val:*, defaultVal:String=null ):String {
		var results : String = defaultVal;
		
		if (val is String)						 
		{
			results = String(val)
			
		} else if (val is Number) 
		{
			if ( !isNaN( Number(val) )) 
				results = String(val);				
		}
		
		return results;
	}
}