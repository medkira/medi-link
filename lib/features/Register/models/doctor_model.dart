class DoctorModel {
  String type;
  String name;
  String email;
  String gender;
  int age;
  String profileImage;
  Address address;
  Security security;
  String speciality;
  String qualification;
  // int experience;
  String experience;
  // List<String> assurance;
  String assurance;
  DoctorModel({
    required this.type,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.profileImage,
    required this.address,
    required this.security,
    required this.speciality,
    required this.qualification,
    required this.experience,
    required this.assurance,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'profileImage': profileImage,
      'address': address.toJson(),
      'security': security.toJson(),
      'speciality': speciality,
      'qualification': qualification,
      'experience': experience,
      'assurance': assurance,
    };
  }
}

class Address {
  String country;
  String addressLine;
  String city;
  String zipCode;

  Address({
    required this.country,
    required this.addressLine,
    required this.city,
    required this.zipCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'addressLine': addressLine,
      'city': city,
      'zipCode': zipCode,
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
