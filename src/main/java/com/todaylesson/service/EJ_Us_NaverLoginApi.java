package com.todaylesson.service;

import com.github.scribejava.core.builder.api.DefaultApi20;               

public class EJ_Us_NaverLoginApi extends DefaultApi20{

    
    protected EJ_Us_NaverLoginApi(){
    }

    private static class InstanceHolder{
        private static final EJ_Us_NaverLoginApi INSTANCE = new EJ_Us_NaverLoginApi();
    }


    public static EJ_Us_NaverLoginApi instance(){
        return InstanceHolder.INSTANCE;
    }

    
    @Override
    public String getAccessTokenEndpoint() {
        
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";

    }

    @Override
    protected String getAuthorizationBaseUrl() {
        // TODO Auto-generated method stub
        return"https://nid.naver.com/oauth2.0/authorize";
    }
}

