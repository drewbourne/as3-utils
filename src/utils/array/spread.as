/**
 *
 *  @MODULE:    ${FILENAME}.as
 *  @AUTHOR:    Thomas Burleson, www.gridlinked.info
 *  @CREATED:   3/12/14
 *  @COPYRIGHT: 2013  Sirius Satellite Radio
 *
 *  @DESCRIPTION:
 *
 *
 *
 */
package utils.array
{
    /**
     * Will distribute an array of elements as named arguments to target function
     * @param targetFn
     * @param scope
     */
    public function spread( targetFn:Function, scope:*=null) : Function
    {
        return  function execute ( items:Array ):*
                {
                    var params : Array = [].concat( items );
                    return targetFn.apply(scope, items);
                };
    }
}
