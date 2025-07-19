import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Models/club_model.dart';
import 'club_controller.dart';

class ClubCreationController extends GetxController {
  var clubName = ''.obs;
  var about = ''.obs;
  var imagePath = ''.obs;

  void setClubName(String value) => clubName.value = value;
  void setAbout(String value) => about.value = value;
  void setImagePath(String path) => imagePath.value = path;

  void clearForm() {
    clubName.value = '';
    about.value = '';
    imagePath.value = '';
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    }
  }
  void createClub() {
    final name = clubName.value.trim().isEmpty
        ? 'Unnamed Club'
        : clubName.value.trim();

    final aboutText = about.value.trim().isEmpty
        ? 'No description available.'
        : about.value.trim();

    final img = imagePath.value.isNotEmpty
        ? imagePath.value
        : 'assets/images/default.png';

    final newClub = Club(
      name: name,
      matchType: 'friendly match',
      category: 'Football',
      members: 1,
      imagePath: img,
      about: aboutText,
    );

    final clubController = Get.find<ClubController>();
    clubController.clubs.add(newClub);

    clearForm();
  }
}
