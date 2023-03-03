/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-04-27	CTongo		Initial Version.
 *************************************************************************************
 */

package measuringcomponent;

import org.openqa.selenium.WebDriver;
import base.BaseInitializer;
import org.openqa.selenium.TimeoutException;
import utils.element.GetElementUsingBy;
import utils.element.Waits;

public class MeasuringComponent extends MeasuringComponentType{

    private WebDriver driver;
    private GetElementUsingBy d;

    public MeasuringComponent(WebDriver driver){
        this.driver = driver;
        this.d = new GetElementUsingBy(driver);
    }

    public MeasuringComponent(){

    }

    public boolean isMcPresent(String attribute, String attributeValue, boolean ElementPresent) {
        Waits wait = new Waits(this.driver);
        if (ElementPresent) {
            try {
                wait.waitForElementToDisplay(attribute, attributeValue, BaseInitializer.defaultwaitTime);
            } catch (TimeoutException var5) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }

    public String initialize_mc_xpath(String xpath, int mcCounter) {
        String eVariable = xpath;
        String eXpathSub1 = eVariable.substring(0, 37);
        String eXpathSub2 = eVariable.substring(38, 52);
        String eXpath = eXpathSub1 + mcCounter + eXpathSub2;
        return eXpath;
    }

    public void validate_mc_type(String mc_type, String device_configuration){
        boolean specificationFlag = false;
        int specificationCounter = 0;
        do{
            if(device_configuration.equals(specification[specificationCounter])){
                boolean measuringComponentFlag = false;
                specificationFlag = true;
                int measuringComponentCounter = 0;
                do{
                    if(mc_type.equals(measuringComponent[specificationCounter][measuringComponentCounter])){
                        measuringComponentFlag = true;
                        System.out.println("MC Type " + mc_type + " is validated");
                    } else if(measuringComponentCounter==mcCount[specificationCounter]) {
                        System.out.println("MC Type " + mc_type + " Not Found");
                    }
                    measuringComponentCounter = measuringComponentCounter + 1;
                }while((measuringComponentFlag==false)||(measuringComponentCounter < mcCount[specificationCounter]));
            }else if(specificationCounter==57){
                System.out.println("Device Configuration: " + device_configuration + " Not Found");
            }
            specificationCounter = specificationCounter + 1;
        }while((specificationFlag==false)||(specificationCounter<57));

    }

//    public void validate_mc_type(String mc_type, String device_configuration){
//        if(device_configuration.equals(gTypical)){
//            if(mc_type.equals(gTypicalMcType1)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else if(mc_type.equals(gTypicalMcType2)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else if(mc_type.equals(gTypicalMcType3)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else{
//                System.out.println("MC Type " + mc_type + " Not Found");
//            }
//        }else if(device_configuration.equals(eTypical)){
//            if(mc_type.equals(eTypicalMcType1)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else if(mc_type.equals(eTypicalMcType2)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else{
//                System.out.println("MC Type " + mc_type + " Not Found");
//            }
//        }else if(device_configuration.equals(wTypical)){
//            if(mc_type.equals(wTypicalMcType1)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else if(mc_type.equals(wTypicalMcType2)){
//                System.out.println("MC Type " + mc_type + " is validated");
//            }else{
//                System.out.println("MC Type " + mc_type + " Not Found");
//            }
//        }else{
//            System.out.println("Device Configuration: " + device_configuration + " Not Found");
//        }
//    }
}