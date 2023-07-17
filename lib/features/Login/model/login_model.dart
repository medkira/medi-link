class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});
  Map<String, dynamic> toJsoon() {
    return {
      'username': email,
      'password': password,
    };
  }
}
