import 'package:fetch_github_api_getx/models/repository_model.dart';
import 'package:fetch_github_api_getx/services/repository_service.dart';
import 'package:get/get.dart';

class RepositoryController extends GetxController {
  var repository = [].obs;
  var repositorySearch = 'github'.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRepository();
  }

  Future fetchRepository() async {
    isLoading.value = true;
    try {
      List<RepositoryModel> _repository =
          await RepositoryService().fetchRepository(repositorySearch);
      repository.value = _repository;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void searchRepository(repo) {
    repositorySearch.value = repo;
    fetchRepository();
  }
}
