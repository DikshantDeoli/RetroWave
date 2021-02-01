package com.mycompany.retrowavevideo.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


/**
 *
 * @author ABHISHEK
 */
public class Helper {
    public static String get30Words(String desc){
        String[] strs = desc.split(" ");
        if(strs.length>30){
            String res = "";
            for(int i=0;i<30;i++){
                res = res+strs[i]+" ";
            }
            return (res+"...");
        }else{
            
            return desc+"...";
        }
    }
   
  
}

