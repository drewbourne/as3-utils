package utils.string
{
	/**
	 *       Returns string to the right of the matching string/character
	 *
	 *       @param input The String whose content will be left-trimmed at the match position
	 *
	 *       @returns A String with content to the right of the match
	 *
	 *       @langversion ActionScript 3.0
	 *       @playerversion Flash 9.0
	 *       @tiptext
	 */
	public function rightOf(input:String,match:String):String
	{
		var index : int 	= input.indexOf( match );
		
		return (index > -1) && (index < input.length) ? input.substr(index+1) : "";
	}
}