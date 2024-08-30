import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  HomeController homeController = Get.put(HomeController());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: homeController.Home.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              leading: CircleAvatar(
                child: Text(homeController.Home[index].id.toString()),
              ),
              title: Text(homeController.Home[index].email.toString()),
              subtitle: Text(homeController.Home[index].phone.toString()),
            ));
          },
        ),
      ),
    );
  }
}
