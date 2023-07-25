/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YmNhZWE5MTZmNTAwNWU5MjJlZjk4OCIsImlhdCI6MTY5MDEwMzU4MiwiZXhwIjoxNjk3ODc5NTgyfQ.w39z7052hLxiNn7YOoEPD1NBWDH7Yfs65n6JmJ7X8X0"

class ResetPass {
  ResetPass({
      this.token,});

  ResetPass.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}