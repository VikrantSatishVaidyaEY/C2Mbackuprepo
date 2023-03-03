/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-04	CTongo		Initial Version.
 *************************************************************************************
 */

package commons;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;

public class CustomConditions {


    public static ExpectedCondition<Boolean> checkWindowReadyState() {
        return new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                Object a =  ((JavascriptExecutor) driver)
                        .executeScript("return document.readyState");
                if (a.toString().trim().equals("complete")){
                    return true;
                }else{
                    return false;
                }
            }
        };
    }

    public static ExpectedCondition<Boolean> checkElementExists(final String element, final WebElement frame) {
        return new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                driver.switchTo().defaultContent();
                driver.switchTo().frame(frame);
                Boolean result = (Boolean) ((JavascriptExecutor) driver)
                        .executeScript("return !!document.getElementById('"+ element + "') ? true : false");
                System.out.println(result);
                return result;
            }
        };
    }
}
