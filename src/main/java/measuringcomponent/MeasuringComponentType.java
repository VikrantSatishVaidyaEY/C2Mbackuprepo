/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-04-12	CTongo		Initial Version.
 *************************************************************************************
 */

package measuringcomponent;

public class MeasuringComponentType {

//    //    Specification
//    String gTypical = "G-TYPICAL";
//    String eTypical = "E-TYPICAL";
//    String wTypical = "W-TYPICAL";
//
//    //    MC Type Codes - G-Typical(Device Configuration)
//    String gTypicalMcType1 = "Gas Hundred Cubic Feet";   //"G-CCF";
//    String gTypicalMcType2 = "Gas Hundred Cubic Feet - Hourly";   //"G-CCF-1H";
//    String gTypicalMcType3 = "Gas Hundred Cubic Feet - Consumptive";   //"G-CCF-MV90";
//
//    //    MC Type Codes - E-Typical(Device Configuration)
//    String eTypicalMcType1 = "Electric KWH";   //"E-KWH";
//    String eTypicalMcType2 = "Electric KWH - 15min";   //"E-KWH-15";
//
//    //    MC Type Codes - W-Typical(Device Configuration)
//    String wTypicalMcType1 = "Water Cubic Feet";   //"W-CF";
//    String wTypicalMcType2 = "Water Cubic Feet - Hourly";   //"W-CF-1H";

    //////////// Initialization Section - Start ////////////
    //    Specification Array
    String[] specification = new String[60];
    int[] specificationCount = new int[60];

    //    Measuring Components Array
    String[][] measuringComponent = new String[60][60];
    int[] mcCount = new int[60];

    //    Specification Initialization
    {
        //    Specification Code - 17420-E-TYPICAL
        specification[0] = "17420-E-TYPICAL";
        //    Specification Code - 500-W-STRAIGHT
        specification[1] = "500-W-STRAIGHT";
        //    Specification Code - 500-W-TYPICAL
        specification[2] = "500-W-TYPICAL";
        //    Specification Code - 200-G-TYPICAL
        specification[3] = "200-G-TYPICAL";
        //    Specification Code - 210-G-TYPICAL
        specification[4] = "210-G-TYPICAL";
    }

    //    Specification Count Initialization
    {
        specificationCount[0] = 57;
    }

    //    Measuring Component Total count per specification Minus One Initialization
    {
        //    MC Count for 17420-E-TYPICAL
        mcCount[0] = 38;
        //    MC Count for 500-W-STRAIGHT
        mcCount[1] = 2;
        //    MC Count for 500-W-TYPICAL
        mcCount[2] = 2;
        //    MC Count for 200-G-TYPICAL
        mcCount[3] = 2;
        //    MC Count for 210-G-TYPICAL
        mcCount[4] = 2;
    }
    //////////// Initialization Section - End ////////////

    //////////// MC Section - Start ////////////
    //////////// ELECTRIC           ////////////
    //    Measuring Components Type Code Initialization
    {
        //    MC Type Code - 17420-E-TYPICAL
        measuringComponent[0][0] = "Electric I2/Ih Phase A -15min";
        measuringComponent[0][1] = "Electric Current rms Phase A - 5min";
        measuringComponent[0][2] = "Electric Current rms Phase A - 15min";
        measuringComponent[0][3] = "Electric Current rms Phase B - 5min";
        measuringComponent[0][4] = "Electric Current rms Phase C - 5min";
        measuringComponent[0][5] = "Electric KVA Off Peak";
        measuringComponent[0][6] = "Electric KVA On Peak";
        measuringComponent[0][7] = "Electric kVARh Delivered - 5min";
        measuringComponent[0][8] = "Electric kVARh Delivered - 15min";
        measuringComponent[0][9] = "Electric KVARH Lagging - 5min";
        measuringComponent[0][10] = "Electric KVARH Lagging - 15min";
        measuringComponent[0][11] = "Electric KVARH Leading - 5min";
        measuringComponent[0][12] = "Electric KVARH Leading - 15min";
        measuringComponent[0][13] = "Electric kVARh Received - 5min";
        measuringComponent[0][14] = "Electric kVARh Received - 15min";
        measuringComponent[0][15] = "Electric KW Off Peak";
        measuringComponent[0][16] = "Electric KW On Peak";
        measuringComponent[0][17] = "Electric KWH";
        measuringComponent[0][18] = "Electric KWH - 5min";
        measuringComponent[0][19] = "Electric KWH - 15min";
        measuringComponent[0][20] = "Electric KWH - Hourly";
        measuringComponent[0][21] = "Electric KWH - Consumptive";
        measuringComponent[0][22] = "Electric KWH Off Peak";
        measuringComponent[0][23] = "Electric KWH Off Peak - Consumptive";
        measuringComponent[0][24] = "Electric KWH On Peak";
        measuringComponent[0][25] = "Electric KWH On Peak - Consumptive";
        measuringComponent[0][26] = "Electric KWH Received";
        measuringComponent[0][27] = "Electric KWH Received Off Peak";
        measuringComponent[0][28] = "Electric KWH Received On Peak";
        measuringComponent[0][29] = "Electric KWH Received- 5min";
        measuringComponent[0][30] = "Electric KWH Received- 15min";
        measuringComponent[0][31] = "Electric Power Factor";
        measuringComponent[0][32] = "Electric PKVAH Delivered - 15min";
        measuringComponent[0][33] = "Electric PKVAH Received - 15min";
        measuringComponent[0][34] = "Electric V2h/VH Phase A -15min";
        measuringComponent[0][35] = "Electric Volt rms Phase A - 5min";
        measuringComponent[0][36] = "Electric Volt rms Phase B - 5min";
        measuringComponent[0][37] = "Electric Volt rms Phase C - 5min";
        measuringComponent[0][38] = "Electric WH";
    }

    //////////// Water            ////////////
    {
        //    MC Type Code - 500-W-STRAIGHT
        measuringComponent[1][0] = "Water Cubic Feet";
        measuringComponent[1][1] = "Water Cubic Feet - Hourly";
        measuringComponent[1][2] = "Water CF Consumptive";
    }

    {
        //    MC Type Code - 500-W-TYPICAL
        measuringComponent[2][0] = "Water Cubic Feet";
        measuringComponent[2][1] = "Water Cubic Feet - Hourly";
        measuringComponent[2][2] = "Water Cubic Feet Inside";
    }

    //////////// Gas              ////////////
    {
        //    MC Type Code - 200-G-TYPICAL
        measuringComponent[3][0] = "Gas Hundred Cubic Feet";
        measuringComponent[3][1] = "Gas Hundred Cubic Feet - Hourly";
        measuringComponent[3][2] = "Gas Hundred Cubic Feet - Consumptive";
    }

    {
        //    MC Type Code - 210-G-TYPICAL
        measuringComponent[4][0] = "Gas Hundred Cubic Feet";
        measuringComponent[4][1] = "Gas Hundred Cubic Feet - Hourly";
        measuringComponent[4][2] = "Gas Hundred Cubic Feet - Consumptive";
    }

    //////////// MC Section - End ////////////
}
