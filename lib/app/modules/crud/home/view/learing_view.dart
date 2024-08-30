import 'package:apihome/app/modules/crud/home/controller/learning_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningView extends StatefulWidget {
  const LearningView({super.key});

  @override
  State<LearningView> createState() => _LearningViewState();
}

class _LearningViewState extends State<LearningView> {
  LearningController learningController = Get.put(LearningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LearningView"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          const Text("Add Student"),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: learningController.name,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(), hintText: "name"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: learningController.email,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "email"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: learningController.num,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(), hintText: "num"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: learningController.address,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "address"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              learningController.postdeta(
                                  name: learningController.name.text,
                                  email: learningController.email.text,
                                  num: learningController.num.text,
                                  address: learningController.address.text);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Submit"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).then((value) {
              learningController.name.clear();
              learningController.address.clear();
              learningController.email.clear();
              learningController.num.clear();
            });
          },
          child: const Icon(Icons.add)),
      body: RefreshIndicator(
        onRefresh: () {
          return learningController.getApideta();
        },
        child: Obx(
          () => ListView.builder(
            itemCount: learningController.getstudent.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title:
                    Text(learningController.getstudent[index].email.toString()),
                subtitle: Text(
                    learningController.getstudent[index].address.toString()),
                trailing: Wrap(children: [
                  IconButton(
                      onPressed: () {
                        learningController.num.text = learningController
                            .getstudent[index].phone
                            .toString();
                        learningController.email.text = learningController
                            .getstudent[index].email
                            .toString();
                        learningController.name.text = learningController
                            .getstudent[index].name
                            .toString();
                        learningController.address.text = learningController
                            .getstudent[index].address
                            .toString();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text("Add Student"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextField(
                                        controller: learningController.name,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "name"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: learningController.email,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "email"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: learningController.num,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "num"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: learningController.address,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "address"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          learningController.editData(
                                              id: learningController
                                                  .getstudent[index].sId,
                                              name:
                                                  learningController.name.text,
                                              email:
                                                  learningController.email.text,
                                              num: learningController.num.text,
                                              address: learningController
                                                  .address.text);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Update"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) {
                          learningController.name.clear();
                          learningController.address.clear();
                          learningController.email.clear();
                          learningController.num.clear();
                        });
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        learningController.removeData(
                            id: learningController.getstudent[index].sId
                                .toString());
                      },
                      icon: const Icon(Icons.delete)),
                ]),
              ));
            },
          ),
        ),
      ),
    );
  }
}
