package org.sc.bean;

public class itemDetail {
    private String itemid;
    private String itemName;
    private String itemClass;
    private String itemimgurl;
    private float itemPrice;
    private String itemUnit;
    private String itemSerial;
    private int itemStock;
    private String itemOfferId;
    private String itemOfferName;
    private String itemState;
    private String imgUrl;
    private String description;
    private String addTime;
    private String Address;
    private String Phone;

    public itemDetail(String itemid, String itemName, String itemClass, String itemimgurl, float itemPrice, String itemUnit, String itemSerial, int itemStock, String itemOfferId, String itemOfferName, String itemState, String imgUrl, String description, String addTime, String address, String phone) {
        this.itemid = itemid;
        this.itemName = itemName;
        this.itemClass = itemClass;
        this.itemimgurl = itemimgurl;
        this.itemPrice = itemPrice;
        this.itemUnit = itemUnit;
        this.itemSerial = itemSerial;
        this.itemStock = itemStock;
        this.itemOfferId = itemOfferId;
        this.itemOfferName = itemOfferName;
        this.itemState = itemState;
        this.imgUrl = imgUrl;
        this.description = description;
        this.addTime = addTime;
        Address = address;
        Phone = phone;
    }

    public itemDetail() {
        super();
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemClass() {
        return itemClass;
    }

    public void setItemClass(String itemClass) {
        this.itemClass = itemClass;
    }

    public String getItemimgurl() {
        return itemimgurl;
    }

    public void setItemimgurl(String itemimgurl) {
        this.itemimgurl = itemimgurl;
    }

    public float getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(float itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getItemUnit() {
        return itemUnit;
    }

    public void setItemUnit(String itemUnit) {
        this.itemUnit = itemUnit;
    }

    public String getItemSerial() {
        return itemSerial;
    }

    public void setItemSerial(String itemSerial) {
        this.itemSerial = itemSerial;
    }

    public int getItemStock() {
        return itemStock;
    }

    public void setItemStock(int itemStock) {
        this.itemStock = itemStock;
    }

    public String getItemOfferId() {
        return itemOfferId;
    }

    public void setItemOfferId(String itemOfferId) {
        this.itemOfferId = itemOfferId;
    }

    public String getItemOfferName() {
        return itemOfferName;
    }

    public void setItemOfferName(String itemOfferName) {
        this.itemOfferName = itemOfferName;
    }

    public String getItemState() {
        return itemState;
    }

    public void setItemState(String itemState) {
        this.itemState = itemState;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }
}
