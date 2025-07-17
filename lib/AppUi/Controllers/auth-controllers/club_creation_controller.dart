import 'package:get/get.dart';
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

  void createClub() {
    final newClub = Club(
      name: clubName.value,
      matchType: 'Custom',
      category: 'New',
      members: 1,
    );

    final clubController = Get.find<ClubController>();
    clubController.clubs.add(newClub);
    clearForm();
  }
}
