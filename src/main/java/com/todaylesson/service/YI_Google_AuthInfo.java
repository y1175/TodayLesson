package com.todaylesson.service;

public class YI_Google_AuthInfo {
	private String clientId;
    private String clientSecret;
    
    
    public YI_Google_AuthInfo(String clientId, String clientSecret) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
    }
 
 
    public String getClientId() {
        return clientId;
    }
 
 
    public String getClientSecret() {
        return clientSecret;
    }
}