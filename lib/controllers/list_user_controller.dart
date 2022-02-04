import 'package:fetch_github_api_getx/models/list_user_model.dart';
import 'package:fetch_github_api_getx/services/list_user_service.dart';
import 'package:get/get.dart';

class ListUserController extends GetxController {
  var usersList = <ListUserModel>[].obs;
  var userSearch = 'github'.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchListUser();
  }

  Future fetchListUser() async {
    isLoading.value = true;
    try {
      List<ListUserModel> users =
          await ListUserService().fetchListUser(userSearch);
      usersList.value = users;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void searchUser(user) {
    userSearch.value = user;
    fetchListUser();

  }
}
