package org.sc.bean;

public class ShopQuery {
    private String itemid;
    private String itemName;
     private String itemClass;
     private String itemimg;
     private float itemPrice;
     private String itemUnit;
     private String itemSerial;
     private int itemStock;
     private String itemOfferId;
     private String itemOfferName;
     private String itemState;

    public ShopQuery() {
        super();
    }

    public ShopQuery(String itemid, String itemName, String itemClass, String itemimg, float itemPrice, String itemUnit, String itemSerial, int itemStock, String itemOfferId, String itemOfferName, String itemState) {
        this.itemid = itemid;
        this.itemName = itemName;
        this.itemClass = itemClass;
        this.itemimg = itemimg;
        this.itemPrice = itemPrice;
        this.itemUnit = itemUnit;
        this.itemSerial = itemSerial;
        this.itemStock = itemStock;
        this.itemOfferId = itemOfferId;
        this.itemOfferName = itemOfferName;
        this.itemState = itemState;
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

    public String getItemimg() {
        return itemimg;
    }

    public void setItemimg(String itemimg) {
        this.itemimg = itemimg;
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
}
