import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';

/// message : "success"
/// user : {"name":"Mohamed Elsayed","email":"mohamed@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDMxY2RjMzg3NjE1Zjk0NDcwMmVjYiIsIm5hbWUiOiJNb2hhbWVkIEVsc2F5ZWQiLCJyb2xlIjoidXNlciIsImlhdCI6MTY4ODkyODQ1MSwiZXhwIjoxNjk2NzA0NDUxfQ.9jhO-cBy0X9XIXzBjwxMjLxHYjrSxhakVNOn9T-y8TU"

class ModelLog {
  ModelLog({
      this.message, 
      this.user, 
      this.token,});

  ModelLog.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// name : "Mohamed Elsayed"
/// email : "mohamed@gmail.com"
/// role : "user"


