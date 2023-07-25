/// message : "success"
/// user : {"name":"AhmedLOL","email":"ahmedlol@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTllOTZjNTBjODcxODZkODQ3MDlhZSIsIm5hbWUiOiJBaG1lZExPTCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4ODU2OTQxLCJleHAiOjE2OTY2MzI5NDF9.iSKcO7fHxGnElF4h0RAzyx5pH4IFiEMC4Mmdw-HAjyI"

class SignUpModel {
  SignUpModel({
      this.message, 
      this.user, 
      this.token,});

  SignUpModel.fromJson(dynamic json) {
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

/// name : "AhmedLOL"
/// email : "ahmedlol@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}