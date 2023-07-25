import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';

/// data : {"sold":539,"images":["https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397482-1.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397482-2.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397483-3.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747398/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747186/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2023-07-16T22:04:02.366Z","__v":0,"reviews":[],"id":"6428ebc6dc1175abc65ca0b9"}

class ModelDetails {
  ModelDetails({
      this.data,});

  ModelDetails.fromJson(dynamic json) {
    data = json['data'] != null ? Dproduct.fromJson(json['data']) : null;
  }
  Dproduct? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// sold : 539
/// images : ["https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397482-1.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397482-2.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397483-3.jpeg","https://res.cloudinary.com/dwp0imlbj/image/upload/Route-Academy-products/1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 220
/// price : 149
/// imageCover : "https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747398/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747186/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2023-07-16T22:04:02.366Z"
/// __v : 0
/// reviews : []
/// id : "6428ebc6dc1175abc65ca0b9"


