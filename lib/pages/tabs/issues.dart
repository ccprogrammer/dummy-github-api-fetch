import 'package:fetch_github_api_getx/controllers/issues_controller.dart';
import 'package:fetch_github_api_getx/widgets/issues_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Issues extends StatelessWidget {
  const Issues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final issuesC = Get.find<IssuesController>();
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => (issuesC.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: issuesC.issuesList.length,
                      itemBuilder: (context, index) => IssuesTile(
                        issuesC.issuesList[index],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
