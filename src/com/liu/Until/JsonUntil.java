package com.liu.Until;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class JsonUntil {
	public String getJsonData(){
		String fullFileName = JsonUntil.class.getClassLoader().getResource("DataSource/JsonSource.json").getPath();  //先获取绝对路劲在查找
        
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
         
        return buffer.toString();
	} 
}
