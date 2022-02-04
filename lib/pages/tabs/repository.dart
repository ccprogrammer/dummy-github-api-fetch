import 'package:fetch_github_api_getx/controllers/repository_controller.dart';
import 'package:fetch_github_api_getx/widgets/repository_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Repository extends StatelessWidget {
  const Repository({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repoC = Get.find<RepositoryController>();

    return Container(
      child: Column(
        children: [
          Expanded(
            child: (repoC.isLoading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: 10,
                    itemBuilder: (context, index) => RepositoryTile(
                      repoC.repository[index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
