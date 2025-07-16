import 'package:get/get.dart';
import '../../models/post_model.dart';

class HomeController extends GetxController {
  // BottomNavBar selected index
  var currentIndex = 0.obs;

  // Posts for the feed
  var posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // Change tab in BottomNavBar
  void changeTab(int index) {
    currentIndex.value = index;

    // Optional navigation based on tab
    switch (index) {
      case 0:
        Get.toNamed('/stats');
        break;
      case 1:
        Get.toNamed('/profile');
        break;
      case 2:
        Get.toNamed('/sponsors');
        break;
      case 3:
        Get.toNamed('/settings');
        break;
    }
  }

  // Fetch posts from model or API
  void fetchPosts() {
    posts.value = [
      PostModel(
        author: "Elite Club",
        timeAgo: "2 hours ago",
        content:
            "What a thrilling match today between the Warriors and Titans! Unforgettable moments!",
        imageUrl: "assets/images/match.jpg",
      ),
      PostModel(
        author: "Elite Club",
        timeAgo: "2 hours ago",
        content:
            "What a thrilling match today between the Warriors and Titans! Unforgettable moments!",
        imageUrl: "assets/images/match 2.jpg",
      ),
      PostModel(
        author: "Elite Club",
        timeAgo: "2 hours ago",
        content:
            "What a thrilling match today between the Warriors and Titans! Unforgettable moments!",
        imageUrl: "assets/images/match 1.jpg",
      ),
    ];
  }

  // Cheer a specific post
  void cheerPost(int index) {
    // Future implementation for API call to cheer a post
    print("Cheered post at index $index");
  }
}
