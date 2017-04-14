package com.liu.main;

import java.util.Calendar;  
import java.util.Date;
import java.util.UUID;

public class test {
	private static long _TEN_THOUSAND=10;  
    public static void main(String[] args) {  
        long times=1000*_TEN_THOUSAND;  
        long t1=System.currentTimeMillis();  
        testSystem(times);  
        long t2=System.currentTimeMillis();  
        System.out.println(t2-t1);  
        testCalander(times);  
        long t3=System.currentTimeMillis();  
        System.out.println(t3-t2);  
        testDate(times);  
        long t4=System.currentTimeMillis();  
        System.out.println(t4-t3); 
        
        System.out.println("Éú³ÉUUID£º"+UUID.randomUUID().toString());
    }  
      
    public static void testSystem(long times){//use 188  
        for(int i=0;i<times;i++){  
            long currentTime=System.currentTimeMillis();  
        }  
    }  
  
    public static void testCalander(long times){//use 6299  
        for(int i=0;i<times;i++){  
            long currentTime=Calendar.getInstance().getTimeInMillis();  
        }  
    }  
      
    public static void testDate(long times){  
        for(int i=0;i<times;i++){  
            long currentTime=new Date().getTime();  
        }  
          
    }  
}
