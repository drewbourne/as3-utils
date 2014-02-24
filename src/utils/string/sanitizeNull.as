package utils.string
{
	/**
	 * Sanitize <code>null</code> strings for display purposes.
	 */
	public function sanitizeNull(str:String, defaultVal:String=""):String
	{
		return (str == null || str == "null") ? defaultVal : str;
	}
}