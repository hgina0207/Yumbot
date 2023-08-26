package com.yummy.yumbot.main.service;

import java.io.*;

import org.springframework.stereotype.Component;

@Component
public class AWSKeyManager {
	private String comprehendAccessKey = "예제 키";
	private String comprehendSecretKey = "예제 키";
	
	public AWSKeyManager() {
		String keyFilePath = "C:\\temp\\aaa.txt";
		
        try (BufferedReader br = new BufferedReader(new FileReader(keyFilePath))) {
            String line;
            
            if ((line = br.readLine()) != null) {
                // 파일에서 한 줄씩 읽어와서 처리
                comprehendAccessKey = line;
                
            }
            if ((line = br.readLine()) != null) {
                // 파일에서 한 줄씩 읽어와서 처리
                comprehendSecretKey = line;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }		
		
	}
	
	public String getAccessKey() {
		return comprehendAccessKey;
	}
	
	public String getSecretKey() {
		return comprehendSecretKey;
	}
}
