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
            function isNullOrEmpty(value:*):Boolean
            {
              return (value == null) || (value == "");
            }

        var keys     : Array   = [];
        var def      : XML     = describeType(source);
        var isDynamic: Boolean = String(def.@isDynamic) == "true" ;

        // If it is a `dynamic` class, then force scan the accessors instead
        if ( isDynamic ) isDynamic = (def.child("extendsClass").length() < 1);

        if (isDynamic == true)
        {
            // Scan dynamic or Object classes for list of properties
            for (var dKey:* in source)
            {
                if ( !isNullOrEmpty( dKey ) )
                {
                    keys.push(dKey);
                }
            }

        } else {

           var accessors:XMLList = (readWrite) ? def..accessor.( @access == "readwrite" ).@name : def..accessor.@name;
           var properties:XMLList = def..variable.@name;

            properties += accessors;

           for each (var node:XML in properties)
           {
              var sKey : String = String(node);
              if ( !isNullOrEmpty(sKey) )
              {
                  keys.push( String(sKey) );
              }
           }
        }


       return keys;
    }
}

