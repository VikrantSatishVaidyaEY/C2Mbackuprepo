/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-04-21	CTongo		Initial Version.
 *************************************************************************************
 */

package data.dataclass;

import java.sql.Timestamp;

public class TestDataGenerator {

    public String generatebadgenumber() {
        String badgenumber = "BN-" + this.generateNumberViaTimestamp();
        return badgenumber;
    }

    public String generateserialnumber() {
        String serialnumber = "SN-" + this.generateNumberViaTimestamp();
        return serialnumber;
    }

    public String generateNumberViaTimestamp(){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String dateTime = timestamp.toString();
        String month = dateTime.substring(5,7);
        String day = dateTime.substring(8,10);
        String year = dateTime.substring(2,4);
        String hour = dateTime.substring(11,13);
        String minute = dateTime.substring(14,16);
        String seconds = dateTime.substring(17,19);
        String number = month + day + year + hour + minute + seconds;
        return number;
    }

    /*
     * This method is responsible for formatting date from DB.
     */
    public static String dbDateFormatter(String date){

        String readYear = date.substring(0, 4);
        String readMonth = date.substring(5, 7);
        String readDay = date.substring(8, 10);
        String readDate = readMonth +"-"+ readDay +"-"+ readYear;

        return readDate;
    }

    /*
     * This method is responsible for formatting time from DB.
     */
    public static String dbTimeFormatter(String time){

        String readHour = time.substring(11, 13);
        String readMin = time.substring(14, 16);
        String readSec = time.substring(17, 19);
        String readTime = readHour +":"+ readMin +":"+ readSec;

        return readTime;
    }
}
