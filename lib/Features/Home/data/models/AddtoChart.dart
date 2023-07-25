/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// data : {"_id":"64b706d586df630033fa88b6","cartOwner":"64b6e64c593af8266ac1a7d2","products":[{"count":1,"_id":"64b706d586df630033fa88b7","product":"6428ebc6dc1175abc65ca0b9","price":149}],"createdAt":"2023-07-18T21:40:37.806Z","updatedAt":"2023-07-18T21:40:38.052Z","__v":0,"totalCartPrice":149}

class AddToCart {
  AddToCart({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  AddToCart.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// _id : "64b706d586df630033fa88b6"
/// cartOwner : "64b6e64c593af8266ac1a7d2"
/// products : [{"count":1,"_id":"64b706d586df630033fa88b7","product":"6428ebc6dc1175abc65ca0b9","price":149}]
/// createdAt : "2023-07-18T21:40:37.806Z"
/// updatedAt : "2023-07-18T21:40:38.052Z"
/// __v : 0
/// totalCartPrice : 149

class Data {
  Data({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

/// count : 1
/// _id : "64b706d586df630033fa88b7"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 149

class Products {
  Products({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}