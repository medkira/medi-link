class PatientModel {
  String type;
  String name;
  String email;
  String gender;
  int age;
  String profileImage;
  Address address;
  Security security;
  HealthMetrics healthMetrics;
  Allergies allergies;

  PatientModel({
    required this.type,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.profileImage,
    required this.address,
    required this.security,
    required this.healthMetrics,
    required this.allergies,
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
      'healthMetrics': healthMetrics.toJson(),
      'allergies': allergies.toJson(),
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

class HealthMetrics {
  String bloodType;
  String height;
  String weight;

  HealthMetrics({
    required this.bloodType,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toJson() {
    return {
      'bloodType': bloodType,
      'height': height,
      'weight': weight,
    };
  }
}

class Allergies {
  List<String> current;

  Allergies({
    required this.current,
  });

  Map<String, dynamic> toJson() {
    return {
      'current': current,
    };
  }
}
