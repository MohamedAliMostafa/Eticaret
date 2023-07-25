import 'package:equatable/equatable.dart';

/// message : "success"
/// user : {"name":"AhmedLOL","email":"ahmedlol@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTllOTZjNTBjODcxODZkODQ3MDlhZSIsIm5hbWUiOiJBaG1lZExPTCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4ODU2OTQxLCJleHAiOjE2OTY2MzI5NDF9.iSKcO7fHxGnElF4h0RAzyx5pH4IFiEMC4Mmdw-HAjyI"

class SignUpEntity  extends Equatable {
  SignUpEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  User? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [message,user,token];


}

/// name : "AhmedLOL"
/// email : "ahmedlol@gmail.com"
/// role : "user"

class User extends Equatable {
  User({
      this.name, 
      this.email, 
      this.role,});


  String? name;
  String? email;
  String? role;

  @override
  // TODO: implement props
  List<Object?> get props => [email,role];


}