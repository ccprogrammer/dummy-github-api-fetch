import 'package:fetch_github_api_getx/controllers/list_user_controller.dart';
import 'package:fetch_github_api_getx/widgets/list_user_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userC = Get.find<ListUserController>();
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => (userC.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: userC.usersList.length,
                      itemBuilder: (context, index) => UserTile(
                        userC.usersList[index],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
