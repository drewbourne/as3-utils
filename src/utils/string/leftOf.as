package utils.string
{
	/**
	 *       Returns string to the left of the matching string/character
	 *
	 *       @param input The String whose content will be right-trimmed at the match position
	 *
	 *       @returns A String with content to the left of the match
	 *mm
	 *       @langversion ActionScript 3.0
	 *       @playerversion Flash 9.0
	 *       @tiptext
	 */
	public function leftOf(input:String,match:String):String
	{
		var index : int = input.indexOf( match );
		
		return (index > -1) ? input.substr(0,index) : ""; 
	}
}