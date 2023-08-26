package com.yummy.yumbot.main.service;

import java.io.*;

import org.springframework.stereotype.Component;

@Component
public class AWSKeyManager {
	private String comprehendAccessKey = "���� Ű";
	private String comprehendSecretKey = "���� Ű";
	
	public AWSKeyManager() {
		String keyFilePath = "C:\\temp\\aaa.txt";
		
        try (BufferedReader br = new BufferedReader(new FileReader(keyFilePath))) {
            String line;
            
            if ((line = br.readLine()) != null) {
                // ���Ͽ��� �� �پ� �о�ͼ� ó��
                comprehendAccessKey = line;
                
            }
            if ((line = br.readLine()) != null) {
                // ���Ͽ��� �� �پ� �о�ͼ� ó��
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
