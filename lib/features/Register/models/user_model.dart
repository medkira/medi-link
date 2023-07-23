// enum UserType {
//   doctor,
//   patient,
//   pharmacy,
//   laboratory,
// }

class UserModel {
  final String name;
  final String password;
  final String email;
  // final String gender;
  final String userType;
  final String userRole;
  final String firstName;
  final String lastName;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.password,
    required this.email,
    // required this.gender,
    required this.userType,
    required this.userRole,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'name': name,
      'role': userRole,
      'type': userType,
      // 'gender': gender,
    };
  }
}

// class Address {
//   String country;
//   String addressLine;
//   String city;
//   String zipCode;
//   String region;

//   Address({
//     required this.country,
//     required this.addressLine,
//     required this.city,
//     required this.zipCode,
//     required this.region,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'country': country,
//       'addressLine': addressLine,
//       'city': city,
//       'zipCode': zipCode,
//       'region': region,
//     };
//   }
// }


