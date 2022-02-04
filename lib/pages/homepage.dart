import 'package:fetch_github_api_getx/controllers/issues_controller.dart';
import 'package:fetch_github_api_getx/controllers/list_user_controller.dart';
import 'package:fetch_github_api_getx/controllers/repository_controller.dart';
import 'package:fetch_github_api_getx/pages/tabs/issues.dart';
import 'package:fetch_github_api_getx/pages/tabs/list_user.dart';
import 'package:fetch_github_api_getx/pages/tabs/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listUserC = Get.put(ListUserController());
    final issuesC = Get.put(IssuesController());
    final repoC = Get.put(RepositoryController());
    final searchC = TextEditingController();

    void searchEngine() {
      listUserC.searchUser(searchC.text);
      issuesC.searchIssues(searchC.text);
      repoC.searchRepository(searchC.text);
    }

    void getAPI() {
      listUserC.fetchListUser();
      issuesC.fetchIssues();
      repoC.fetchRepository();
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              toolbarHeight: 80,
              elevation: 0,
              backgroundColor: Colors.black.withOpacity(0.9),
              title: Row(
                children: [
                  Text(
                    'GET API',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: TextField(
                        controller: searchC,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                        ),
                        onEditingComplete: searchEngine,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchEngine();
                            },
                            icon: Icon(Icons.search),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    getAPI();
                  },
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.group),
                    text: 'User',
                  ),
                  Tab(
                    icon: Icon(Icons.texture),
                    text: 'Issues',
                  ),
                  Tab(
                    icon: Icon(Icons.usb),
                    text: 'Repository',
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              ListUser(),
              Issues(),
              Repository(),
            ],
          ),
        ),
      ),
    );
  }
}
