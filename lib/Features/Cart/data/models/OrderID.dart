

class OrderId {
  OrderId({
      this.id, 

  });

  OrderId.fromJson(dynamic json) {
    id = json['id'];
  }
  int? id;


}