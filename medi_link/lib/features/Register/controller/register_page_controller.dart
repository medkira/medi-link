import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:medilink/features/Register/models/doctor_model.dart';

import '../models/user_model.dart';

class RegisterPageController extends GetxController {
  UserModel? userInfo;
  var username = ''.obs;
  var password = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var userType = ''.obs; //  UserType.patient.obs;

  //doctor info
  var profileImage = ''.obs;

  var city = ''.obs;
  var zipCode = ''.obs;
  var speciality = ''.obs;
  var qualification = ''.obs;
  var experience = 0.obs;
  var assurance = <String>[].obs;

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

//set for doctor

  void setProfileImage(String value) {
    profileImage.value = value;
  }

  // void setAddressLine(String value) {
  //   addressLine.value = value;
  // }

  void setCity(String value) {
    city.value = value;
  }

  void setZipCode(String value) {
    zipCode.value = value;
  }

  void setSpeciality(String value) {
    speciality.value = value;
  }

  void setQualification(String value) {
    qualification.value = value;
  }

  void setExperience(int value) {
    experience.value = value;
  }

  void setAssurance(List<String> value) {
    assurance.value = value;
  }

  void register() async {
    try {
      final userInfo = UserModel(
          username: username.value,
          password: password.value,
          email: email.value,
          gender: gender.value,
          age: age.value,
          userType: userType.value);

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

  void register_doctor() async {
    if (userInfo == null) {
      print('User information not available.');
      return;
    }
    // final doctorInfo = DoctorModel(
    //   type: userInfo!.userType,
    //   name: userInfo!.username,
    //   email: userInfo!.email,
    //   gender: userInfo!.gender,
    //   age: userInfo!.age,
    //   profileImage: profileImage.value,
    //   address: address
    //   security: security.,
    //   speciality: "speciality",
    //   qualification: "qualification",
    //   experience: "experience",
    //   assurance: "assurance",
    // );
  }
}
