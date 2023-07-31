import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserDataController extends GetxController {
  var username = ''.obs;
  final userDataBox = Hive.box("userDataBox");

  @override
  void onInit() async {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    var data = await userDataBox.get('user');
    print(
        "user -------------data from THE CONTROLLER  user data PRINT OUT ------------------");
    print(userDataBox.get('user'));
    if (data != null) {
      username.value = data["data"]["name"];
    } else {
      username.value = "NO DATA";
    }
  }

  void deleteUserData() {
    userDataBox.delete('user');
  }
}
