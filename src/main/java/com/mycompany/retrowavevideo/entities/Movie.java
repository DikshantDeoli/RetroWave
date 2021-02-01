/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.retrowavevideo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author ABHISHEK
 */
@Entity
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iId;
    private String mName;
    @Column(length = 3000)
    private String mDesc;
    private String mPhoto;
    private int mprice;
    private int mDiscount;
    private int mQuantity;
    private float mrating;
    private int myear;
    @ManyToOne
    private Category category;
    public Movie() {
    }

    /**
     *
     * @param mName
     * @param mDesc
     * @param mPhoto
     * @param mprice
     * @param mDiscount
     * @param mQuantity
     * @param mrating
     * @param myear
     * @param category
     */
    public Movie(String mName, String mDesc, String mPhoto, int mprice, int mDiscount, int mQuantity,float mrating, int myear,Category category) {
        this.mName = mName;
        this.mDesc = mDesc;
        this.mPhoto = mPhoto;
        this.mprice = mprice;
        this.mDiscount = mDiscount;
        this.mQuantity = mQuantity;
        this.mrating = mrating;
        this.myear = myear;
        this.category = category;
        
    }

    public int getiId() {
        return iId;
    }

    public void setiId(int iId) {
        this.iId = iId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmDesc() {
        return mDesc;
    }

    public void setmDesc(String mDesc) {
        this.mDesc = mDesc;
    }

    public String getmPhoto() {
        return mPhoto;
    }

    public void setmPhoto(String mPhoto) {
        this.mPhoto = mPhoto;
    }

    public int getMprice() {
        return mprice;
    }

    public void setMprice(int mprice) {
        this.mprice = mprice;
    }

    public int getmDiscount() {
        return mDiscount;
    }

    public void setmDiscount(int mDiscount) {
        this.mDiscount = mDiscount;
    }

    public int getmQuantity() {
        return mQuantity;
    }

    public void setmQuantity(int mQuantity) {
        this.mQuantity = mQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public float getMrating() {
        return mrating;
    }

    public void setMrating(float mrating) {
        this.mrating = mrating;
    }

    public int getMyear() {
        return myear;
    }

    public void setMyear(int myear) {
        this.myear = myear;
    }
    
    

    @Override
    public String toString() {
        return "Movies{" + "iId=" + iId + ", mName=" + mName + ", mDesc=" + mDesc + ", mPhoto=" + mPhoto + ", mprice=" + mprice + ", mDiscount=" + mDiscount + ", mQuantity=" + mQuantity + '}';
    }
    public int getPriceAfterApplyingDiscount(){
        int d=(int) (this.getmDiscount()/100.0*this.getMprice());
        return this.getMprice() - d;
    }
    
    
}
