import 'package:apihome/app/modules/home/controller/learning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningScreen extends StatelessWidget {
  LearningScreen({super.key});

  @override
  LearningController learningController = Get.put(LearningController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: learningController.Learning.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              leading: CircleAvatar(
                  child:
                      Text(learningController.Learning[index].id.toString())),
              title: Text(learningController.Learning[index].title.toString()),
              subtitle:
                  Text(learningController.Learning[index].userId.toString()),
            ));
          },
        ),
      ),
    );
  }
}
