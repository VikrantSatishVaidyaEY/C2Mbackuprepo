/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-04-12	CTongo		Initial Version.
 *************************************************************************************
 */

package creditcollection;

public class CreditCollection {

    public boolean compare_eventSequence(String event, String eventSeq) {
        if(event.equals(eventSeq)){
            return true;
        }else{
            return false;
        }
    }
}
