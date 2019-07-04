package com.pino.db.pino.entities;


public class Bar {
    private String name;
    private int phone;
    private String address;
    private int license;
    private String city;
    private String email;
    private String state;

    public Bar() {

    }

    public Bar(String name, int phone, String address, int licesne, String city, String email, String state) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.license = license;
        this.city = city;
        this.email = email;
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public int getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public int getLicense() {
        return license;
    }

    public String getCity() {
        return city;
    }

    public String getEmail() {
        return email;
    }

    public String getState() {
        return state;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setLicense(int license) {
        this.license = license;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setState(String state) {
        this.state = state;
    }
}
