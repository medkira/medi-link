import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:medilink/features/auth/controller/token_controller.dart';

class FetchUserDataController extends GetxController {
  final userDataBox = Hive.box("userDataBox");
  var username = ''.obs;

  final TokenController tokenController = Get.find<TokenController>();
  void setUserData(String id) async {
    try {
      final String token = tokenController.getToken();
      final response = await http.get(
        Uri.parse('http://192.168.51.82:8800/api/user/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        // body: requestBody,
      );

      var jsonResponse = jsonDecode(response.body);
      await userDataBox.put('user', jsonResponse);
      print(
          "user -------------data from THE CONTROLLER fetch user data PRINT OUT ------------------");
      print(userDataBox.get('user'));
      var data = userDataBox.get('user');
      username.value = data["data"]["name"];
    } catch (err) {
      print(err);
    }
  }

  // dynamic getUserName() {
  //   var data = userDataBox.get('user');
  //   return data["data"]['name'];
  // }
}



      // Map<String, dynamic> requestBody = {
      //   "user": {
      //     "id": id,
      //   }
      // };
      // print(jsonEncode(requestBody));
      // print("---------------------------------------------------------------");
      // print(requestBody);