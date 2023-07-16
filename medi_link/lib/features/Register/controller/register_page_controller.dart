import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:medilink/features/Register/models/doctor_model.dart'
    as DoctorModel;
import 'package:medilink/features/Register/models/patient_model.dart'
    as PatientModel;
// import 'package:medilink/features/Register/models/doctor_model.dart';

import '../models/user_model.dart';

class RegisterPageController extends GetxController {
  UserModel? userInfo;
  var username = ''.obs;
  var password = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var userType = ''.obs; //  UserType.patient.obs;

  var profileImage = ''.obs;
  var addressLine = ''.obs;
  var country = ''.obs;
  var city = ''.obs;
  var zipCode = ''.obs;
  var speciality = ''.obs;
  var qualification = ''.obs;
  var experience = ''.obs;
  var assurance = ''.obs;
  var bloodType = ''.obs;
  var height = ''.obs;
  var weight = ''.obs;
  List<RxString> currentAllergies = <RxString>[].obs;
  List<String> Allergies = <String>[].obs;

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setAge(int value) {
    age.value = value;
  }

  void setUserType(String value) {
    userType.value = value;
  }

  void setProfileImage(String value) {
    profileImage.value = value;
  }

  void setAddress(
      {required String country,
      required String addressLine,
      required String city,
      required String zipCode}) {
    this.country.value = country;
    this.addressLine.value = addressLine;
    this.city.value = city;
    this.zipCode.value = zipCode;
  }

  void setDoctorInfo({
    required String speciality,
    required String qualification,
    required String experience,
    required String assurance,
  }) {
    this.speciality.value = speciality;
    this.qualification.value = qualification;
    this.experience.value = experience.toString();
    this.assurance.value = assurance;
  }

  void setHealthMetrics({
    required String bloodType,
    required String height,
    required String weight,
  }) {
    this.bloodType.value = bloodType;
    this.height.value = height;
    this.weight.value = weight;
  }

  void setAllergies(List<String> currentAllergies) {
    this.currentAllergies.assignAll(
        currentAllergies.map((allergy) => RxString(allergy)).toList());
    this.Allergies =
        this.currentAllergies.map((rxString) => rxString.value).toList();
  }

  void registerPatient() async {
    try {
      final userInfo = UserModel(
        username: username.value,
        password: Security(password: password.value),
        email: email.value,
        gender: gender.value,
        age: age.value,
        userType: userType.value,
        address: Address(
            country: country.value,
            addressLine: addressLine.value,
            city: city.value,
            zipCode: zipCode.value),
      );

      final patientInfo = PatientModel.PatientModel(
          type: userInfo.userType,
          name: userInfo.username,
          email: userInfo.email,
          gender: userInfo.gender,
          age: userInfo.age,
          profileImage: profileImage.value,
          address: PatientModel.Address(
              addressLine: addressLine.value,
              city: city.value,
              country: country.value,
              zipCode: zipCode.value),
          security: PatientModel.Security(password: password.value),
          healthMetrics: PatientModel.HealthMetrics(
              bloodType: bloodType.value,
              height: height.value,
              weight: weight.value),
          allergies: PatientModel.Allergies(current: Allergies));

      final userInfoJson = jsonEncode(userInfo.toJson());

      print(userInfoJson);

      // final response = await http.post(
      //   Uri.parse('http://localhost:3000/api/v1/user/create'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: userInfoJson,
      // );
      // if (response.statusCode == 200) {
      // } else {
      //   print('Request failed with status code: ${response.statusCode}');
      // }
      // Uri.parse(uri)
    } catch (err) {
      print('Error: $err');
    }
  }

  void registerDoctor() async {
    final userInfo = UserModel(
      username: username.value,
      password: Security(password: password.value),
      email: email.value,
      gender: gender.value,
      age: age.value,
      userType: userType.value,
      address: Address(
          country: country.value,
          addressLine: addressLine.value,
          city: city.value,
          zipCode: zipCode.value),
    );

    if (userInfo == null) {
      print('User information not available.');
      return;
    }

    final doctorInfo = DoctorModel.DoctorModel(
      type: userInfo.userType,
      name: userInfo.username,
      email: userInfo.email,
      gender: userInfo.gender,
      age: userInfo.age,
      profileImage: profileImage.value,
      address: DoctorModel.Address(
          country: country.value,
          addressLine: addressLine.value,
          city: city.value,
          zipCode: zipCode.value),
      security: DoctorModel.Security(password: password.value),
      speciality: speciality.value,
      qualification: qualification.value,
      experience: experience.value,
      assurance: assurance.value,
    );

    try {
      // final response = await http.post(
      //   Uri.parse('http://localhost:3000/api/v1/user/doctor'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: userInfoJson,
      // );
      // if (response.statusCode == 200) {
      // } else {
      //   print('Request failed with status code: ${response.statusCode}');
      // }
      // Uri.parse(uri)
    } catch (err) {
      print('Error: $err');
    }
  }
}
