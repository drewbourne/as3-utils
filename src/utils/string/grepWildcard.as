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
	public function grepWildcard(input:String, wildCard:String, caseSensitive:Boolean=false, global:Boolean=false):Boolean
	{
				function buildPattern():String {
					var pattern : String = !global ? '^' : '';
					
					for (var i:int = 0; i < wildCard.length; i++ ) {
						var c : String = wildCard.charAt(i);
						switch (c) {
							case '?':
								pattern += '.';
								break;
							case '*':
								pattern += '.*';
								break;
							default:
								pattern += c;
						}
					}
					pattern += !global ? '$' : '';
					
					return pattern;
				}
				
		var options : String = global ? "g" : "";
			options += !caseSensitive ? "i" : "";
			
		var exp : RegExp = new RegExp( buildPattern() ,options );
		
		return ( input.match( exp) != null );
	
	}
}