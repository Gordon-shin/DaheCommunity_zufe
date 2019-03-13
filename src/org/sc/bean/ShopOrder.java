package org.sc.bean;

public class ShopOrder {
    private String orderId;
     private String ItemId;
     private String userId;
     private String ItemNumber;
     private String orderDate;
     private String payStatus;

 public ShopOrder() {
  super();
 }

 public ShopOrder(String orderId, String itemId, String userId, String itemNumber, String orderDate, String payStatus) {
  this.orderId = orderId;
  ItemId = itemId;
  this.userId = userId;
  ItemNumber = itemNumber;
  this.orderDate = orderDate;
  this.payStatus = payStatus;
 }

 public String getOrderId() {
  return orderId;
 }

 public void setOrderId(String orderId) {
  this.orderId = orderId;
 }

 public String getItemId() {
  return ItemId;
 }

 public void setItemId(String itemId) {
  ItemId = itemId;
 }

 public String getUserId() {
  return userId;
 }

 public void setUserId(String userId) {
  this.userId = userId;
 }

 public String getItemNumber() {
  return ItemNumber;
 }

 public void setItemNumber(String itemNumber) {
  ItemNumber = itemNumber;
 }

 public String getOrderDate() {
  return orderDate;
 }

 public void setOrderDate(String orderDate) {
  this.orderDate = orderDate;
 }

 public String getPayStatus() {
  return payStatus;
 }

 public void setPayStatus(String payStatus) {
  this.payStatus = payStatus;
 }
}
