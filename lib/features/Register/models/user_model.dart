// enum UserType {
//   doctor,
//   patient,
//   pharmacy,
//   laboratory,
// }

class UserModel {
  final String username;
  final Security password;
  final String email;
  final String gender;
  final int age;
  final String userType;
  final Address address;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
    required this.gender,
    required this.age,
    required this.userType,
    required this.address,
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
      'address': address.toJson(),
    };
  }
}

class Address {
  String country;
  String addressLine;
  String city;
  String zipCode;
  String region;

  Address({
    required this.country,
    required this.addressLine,
    required this.city,
    required this.zipCode,
    required this.region,
  });

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'addressLine': addressLine,
      'city': city,
      'zipCode': zipCode,
      'region': region,
    };
  }
}

class Security {
  String password;

  Security({required this.password});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}
