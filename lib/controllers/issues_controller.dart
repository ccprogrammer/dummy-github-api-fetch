import 'package:fetch_github_api_getx/models/issues_model.dart';
import 'package:fetch_github_api_getx/services/issues_service.dart';
import 'package:get/get.dart';

class IssuesController extends GetxController {
  var issuesList = <IssuesModel>[].obs;
  var issuesSearch = 'github'.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchIssues();
  }

  Future fetchIssues() async {
    isLoading.value = true;
    try {
      List<IssuesModel> _issues =
          await IssuesService().fetchIssues(issuesSearch);
      issuesList.value = _issues;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void searchIssues(issues) {
    issuesSearch.value = issues;
    fetchIssues();
  }
}
