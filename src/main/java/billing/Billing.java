/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-04-12	CTongo		Initial Version.
 *************************************************************************************
 */

package billing;

public class Billing {

    public String initialize_bseg_xpath(String xpath, String saId) {
        String eVariable = xpath;
        String eXpathSub1 = eVariable.substring(0, 24);
        String eXpathSub2 = eVariable.substring(24, 27);
        String eXpath = eXpathSub1 + saId + eXpathSub2;
        return eXpath;
    }
}
