import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:medilink/features/Login/model/login_model.dart';

import '../../Profile/screens/patient_profile_page.dart';
import '../../auth/controller/token_controller.dart';

class LoginPageController extends GetxController {
  var rememberMe = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  final TokenController tokenController = Get.put(TokenController());
  void setPassword(String value) {
    password.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void login() async {
    try {
      final user = UserModel(email: email.value, password: password.value);
      print(user.email);
      final userJson = jsonEncode(user.toJsoon());

      final response = await http.post(
        Uri.parse('http://192.168.1.18:8800/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: userJson,
      );
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var myToken = jsonResponse['token'];
        tokenController.setToken(myToken);

        Get.to(() => const PatientProfilePage());
      } else {
        Get.snackbar('Error', 'Invalid ');
      }
    } catch (err) {
      print('Error: $err');
    }
  }
}
