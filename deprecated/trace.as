package deprecated
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;

    import utils.string.supplant;

    /*---------------------------------------------------------------------------------------------

		[AS3] traceDL
		=======================================================================================

		Copyright (c) 2009 Tomek 'Og2t' Augustyn

		e	tomek@blog2t.net
		w	http://play.blog2t.net

		Please retain this info when redistributed.

		VERSION HISTORY:
		v0.1	30/4/2009	Initial concept
		v0.2	1/5/2009	Added more params, filter and depth

		USAGE:

		// displays the whole display list of any displayObject
		traceDL(displayObject);

		// displays all displayObjects matching "filterString"
		traceDL(displayObject, "filterString");

		// displays the display list of any displayObject up to the given depth
		traceDL(displayObject, depth);

	---------------------------------------------------------------------------------------------*/

    public function traceDL(container:DisplayObjectContainer, options:* = undefined, indentString:String = "", depth:int = 0, childAt:int = 0):void
    {

    		function hasMatch(target:String):Boolean
    		{
    			return (target.match(new RegExp(options, "gi")).length != 0);
    		}

   		const INDENT:String = "   ";

        if (typeof options == "undefined") options = Number.POSITIVE_INFINITY;
        if (depth > options) return;

        var i:int = container.numChildren;

        while ( i-- )
        {
            var child :DisplayObject = container.getChildAt(i);
            var output:String        = indentString;
            var hasMatch : Boolean   = output.match(new RegExp(options, "gi")).length != 0;

            // debug alpha/visible properties
            output += supplant("{0}: {1} ➔ {2}", 	[ childAt++, child.name,  child ] );
            output += supplant("\t\talpha:{0}/{1}", [ child.alpha.toFixed(2), child.visible ] );
            output += supplant(", @: ({0},{1}", 	[child.x, child.y ]);
            output += supplant(", w: {0} px ({1})", [ child.width, child.scaleX.toFixed(2)]);
            output += supplant(", h: {0} px ({1})", [ child.height, child.scaleY.toFixed(2)]);
            output += supplant(", r: {0} °", 		[ child.rotation.toFixed(1) ]);

            if (typeof options == "number") return output;
            if (typeof options == "string" && hasMatch(output) )
            {
            	return supplant("{0} in {1} ➔ {2}",[ output, container.name, container]);
            }

            if (child is DisplayObjectContainer)
            	traceDL( DisplayObjectContainer(child), options, indentString + INDENT, depth + 1);
        }
    }
}
