// enum UserType {
//   doctor,
//   patient,
//   pharmacy,
//   laboratory,
// }

class UserModel {
  final String username;
  final String password;
  final String email;
  final String gender;
  final int age;
  final String userType;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
    required this.gender,
    required this.age,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'userType': userType,
      'username': username,
      'email': email,
      'gender': gender,
      'age': age,
      "security": {
        'password': password,
      },
    };
  }
}
