
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxString name = 'Alex Jhonson'.obs;
  RxString email = 'alexjhonson@gmail.com'.obs;
  Rx<XFile?> profileImage = Rx<XFile?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = pickedFile;
    }
  }

  void updateProfile(String newName, String newEmail) {
    name.value = newName;
    email.value = newEmail;
  }
}
