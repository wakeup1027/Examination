package com.liu.main;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class demo {

	public static void main(String[] args) {
		String fullFileName = "DataSource/JsonSource.json";
        
        File file = new File(fullFileName);
        Scanner scanner = null;
        StringBuilder buffer = new StringBuilder();
        try {
            scanner = new Scanner(file, "utf-8");
            while (scanner.hasNextLine()) {
                buffer.append(scanner.nextLine());
            }
 
        } catch (FileNotFoundException e) {
 
        } finally {
            if (scanner != null) {
                scanner.close();
            }
        }
         
        System.out.println(buffer.toString());
		
	}

}
