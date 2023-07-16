import 'package:get/get.dart';
import 'package:medilink/features/Register/controller/register_page_controller.dart';
import '../screens/register doctor/register_doctor_info_page.dart';
import '../screens/register patient/register_healthmatrics_page.dart';

class RegisterTypeNavigatioController extends GetxController {
  void navigateRegisterType() {
    final RegisterPageController controller = Get.find();
    final String userType = controller.userType.value;
    if (userType == 'doctor') {
      Get.to(() => const RegisterDoctorInfoPage(),
          transition: Transition.rightToLeft);
    } else if (userType == 'patient') {
      Get.to(() => const RegisterHealthMetricsPage(),
          transition: Transition.rightToLeft);
    } else if (userType == 'laboratory') {
      Get.to(() => const RegisterHealthMetricsPage(),
          transition: Transition.rightToLeft);
    } else if (userType == 'pharmacy') {
      Get.to(() => const RegisterHealthMetricsPage(),
          transition: Transition.rightToLeft);
    }
  }
}
