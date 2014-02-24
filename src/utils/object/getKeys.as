package utils.object
{
    import flash.utils.describeType;

    /**
     * Creates an Array comprised of all the keys in an Object.
     * Note: works on Class instances, Dynamic Class instances, and Object instances
     *
     * @param obj: Object in which to find keys.
     * @return Array containing all the string key names.
     */
    public function getKeys(source:Object, readWrite:Boolean = true):Array
    {
       var keys:Array = [];
       var def:XML = describeType(source);
       var accessors:XMLList = (readWrite) ? def..accessor.( @access == "readwrite" ).@name : def..accessor.@name;
       var properties:XMLList = def..variable.@name;

        properties += accessors;
    
       for each (var sKey:* in properties)
       {
          keys.push(String(sKey));
       }
    
       return keys;
    }
}

