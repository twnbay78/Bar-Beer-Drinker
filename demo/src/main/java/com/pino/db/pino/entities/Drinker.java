package com.pino.db.pino.entities;

import java.util.Date;

public class Drinker {
    private String drinker_name;
    private int drinker_phone;
    private int cc_number;
    private java.sql.Date cc_expiration;

    public Drinker(){

    }
    public Drinker(String drinker_name, int drinker_phone, int cc_number, java.sql.Date cc_expiration){
        this.drinker_name = drinker_name;
        this.drinker_phone = drinker_phone;
        this.cc_number = cc_number;
        this.cc_expiration = cc_expiration;
    }

    public String getDrinkerName(){
        return drinker_name;
    }
    public int getDrinkerPhone(){
        return drinker_phone;
    }
    public int getDrinkerCCNumber(){
        return cc_number;
    }
    public Date getDrinkerCCExpiration(){
        return cc_expiration;
    }

    public void setDrinkerName(String drinker_name){
        this.drinker_name = drinker_name;
    }
    public void setDrinkerPhone(int drinker_phone){
        this.drinker_phone = drinker_phone;
    }

    public void setDrinkerCCNumber(int cc_number){
        this.cc_number = cc_number;
    }
    public void setDrinkerCCExpiration(java.sql.Date cc_expiration){
        this.cc_expiration = cc_expiration;
    }
}
