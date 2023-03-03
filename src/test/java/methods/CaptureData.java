package methods;

import java.io.*;
import java.util.*;


public class CaptureData {

    static HashMap<String,String> capturedDetails;

    public static void newRequest(){
        capturedDetails = new HashMap<>();
    }

    public static void addData(String key, String value){
        if (capturedDetails == null || capturedDetails.containsKey(key)){
            newRequest();
        }
        capturedDetails.put(key,value);
    }

    public static String getData(String key){
        return capturedDetails.get(key);
    }
}
