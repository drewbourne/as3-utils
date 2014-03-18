package utils.string
{
	/**
	 *       Determines whether the specified string matches a wildcard
	 *
	 *       @param input  The string that the prefix will be checked against.
	 *       @param prefix The tests that will be tested against the string.
	 *       @returns True if the string starts with the prefix, false if it does not.
	 *
	 *       @langversion ActionScript 3.0
	 *       @playerversion Flash 9.0
	 *       @tiptext
	 */
	public function matches(input:String, pattern:String, caseSensitive:Boolean = false):Boolean
	{
	  var hasWildcards : Boolean = (pattern.indexOf("*") > -1)  || (pattern.indexOf("?") > -1);
	  
		if ( hasWildcards ) 
		{
			return grepWildcard(input,pattern,caseSensitive);
		}
		else 
		{
			if (caseSensitive != true) 
			{
				input 	 = input.toUpperCase();
				pattern  = pattern.toUpperCase();
			}
			
			return (input.indexOf(pattern) >= 0);
		}
	
	}
}