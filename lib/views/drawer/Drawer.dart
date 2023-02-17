import 'package:first_project/controllers/dashboard/DashboardController.dart';
import 'package:first_project/views/project/ProjectList.dart';
import 'package:flutter/material.dart';
import 'package:first_project/controllers/auth/LoginController.dart';
import 'package:first_project/views/auth/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:first_project/views/hr/EmployeeList.dart';

import '../asset/AssetList.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                // Image.network(
                //   DashboardController().pictureUrl,
                //   height: 50,
                // ),
                Text('Sohail Afzal'),
                Text('IT Coordinator'),
                Text('sohail.afzal@barqaab.com'),
              ],
            ),
          ),
          ListTile(
            title: const Text('HR'),
            onTap: () {
              Get.to(() => EmployeeList());
              // Update the state of the app
              // ...
              // Then close the drawer
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () {
              Get.to(() => ProjectList());
              // Update the state of the app
              // ...
              // Then close the drawer
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Assets'),
            onTap: () {
              Get.to(() => AssetList());
              // Update the state of the app
              // ...
              // Then close the drawer
              //Navigator.pop(context);
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Logout'),
              ),
              IconButton(
                  onPressed: () {
                    LoginController.logout();
                    Get.to(LoginScreen());
                  },
                  icon: Icon(Icons.logout)),
            ],
          )
        ],
      ),
    );
  }
}
