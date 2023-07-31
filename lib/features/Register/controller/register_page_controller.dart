import 'dart:convert';
import 'package:get/get.dart';
import 'package:medilink/features/Profile/screens/patient_profile_page.dart';

import 'package:http/http.dart' as http;
import 'package:medilink/features/auth/controller/token_controller.dart';

import '../models/user_model.dart';

class RegisterPageController extends GetxController {
  UserModel? userInfo;
  var fullUsername = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var password = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var userRole = ''.obs;
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
  var region = ''.obs;
  List<RxString> currentAllergies = <RxString>[].obs;
  List<String> Allergies = <String>[].obs;
  void setGender(String value) {
    gender.value = value;
  }

  void setAge(int value) {
    age.value = value;
  }

  void setFirstname(String value) {
    firstName.value = value;
    setUsername();
  }

  void setLastname(String value) {
    lastName.value = value;
  }

  void setUsername() {
    fullUsername.value = "${firstName.value} ${lastName.value}";
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setUserRole(String value) {
    userRole.value = value;
  }

  void setProfileImage(String value) {
    profileImage.value = value;
  }

//this info need to be fill in the profile page update
  void setAddress(
      {required String country,
      required String addressLine,
      required String city,
      required String zipCode,
      required String region}) {
    this.country.value = country;
    this.addressLine.value = addressLine;
    this.city.value = city;
    this.zipCode.value = zipCode;
    this.region.value = region;
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

  //U need to change if statement  to Pharmacy Laboratory Doctor

  void register() {
    if (userRole.value == 'Patient') {
      registerPatient();
    } else {
      registerDoctor();
    }
  }

  void registerPatient() async {
    final userInfo = UserModel(
      name: fullUsername.value,
      firstName: firstName.value,
      lastName: lastName.value,
      password: password.value,
      email: email.value,
      userType: "",
      userRole: userRole.value,
    );

    final userInfoJson = jsonEncode(userInfo.toJson());
    try {
      final response = await http.post(
        Uri.parse('http://192.168.51.82:8800/api/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: userInfoJson,
      );
      if (response.statusCode == 201) {
        // final TokenController tokenController = Get.put(TokenController()); we dont need it becs we get.put in the login page -_-
        // print("Patient created");
        var res = jsonDecode(response.body);

        Get.find<TokenController>().setToken(res['token']);

        Get.to(() => PatientProfilePage(), transition: Transition.rightToLeft);
      } else {
        var res = jsonDecode(response.body);
        var message = res['message'];

        print('Request failed with message: $message');
      }
      // Uri.parse(uri);
    } catch (err) {
      print('Error: $err');
    }
  }

  void registerDoctor() async {
    final userInfo = UserModel(
        name: fullUsername.value,
        firstName: firstName.value,
        lastName: lastName.value,
        password: password.value,
        email: email.value,
        // gender: gender.value,
        userType: "Doctor",
        userRole: "HealthcareProvider");

    // if (userInfo.email == null) {
    //   print('User information not available.');
    //   return;
    // }

    final userInfoJson = jsonEncode(userInfo.toJson());
    print(userInfoJson);
    try {
      final response = await http.post(
        Uri.parse('http://192.168.51.82:8800/api/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: userInfoJson,
      );
      if (response.statusCode == 201) {
        // print("Doctor Created");
        var res = jsonDecode(response.body);

        Get.find<TokenController>().setToken(res['token']);
        Get.to(() => PatientProfilePage(), transition: Transition.rightToLeft);
      } else {
        var res = jsonDecode(response.body);
        var message = res['message'];
        print("***************************************************");
        print('Request failed with message: $message');
      }
      // Uri.parse(uri)
    } catch (err) {
      print('Error: $err');
    }
  }
}
