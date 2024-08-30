import 'package:apihome/app/modules/crud/model/get_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningController extends GetxController {
  Dio dio = Dio();
  String BASE_URL = "http://192.168.29.45:5000";

  var getstudent = <GetDataModel>[].obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getApideta();
    super.onInit();
  }

  getApideta() async {
    try {
      final response = await dio.get("$BASE_URL/get-student");

      if (response.statusCode == 200) {
        var getstudentList = (response.data as List)
            .map((e) => GetDataModel.fromJson(e))
            .toList();
        getstudent.value = getstudentList;
        print(getstudent.value);
      }
    } catch (e) {
      print("error api get deta:-$e");
    }
  }

  postdeta({name, email, num, address}) async {
    print("$name,$email,$num,$address");
    try {
      final response = await dio.post("$BASE_URL/post-student", data: {
        "name": name,
        "email": email,
        "phone": num,
        "address": address
      });
      if (response.statusCode == 201) {
        getApideta();
        Get.snackbar("Success", "Student Added Successfully",
            backgroundColor: Colors.blue.withOpacity(.3));
        update();
      }
    } catch (e) {
      print("error get api deta:-$e");
    }
  }

  editData({name, email, num, address, id}) async {
    print("$name,$email,$num,$address");
    try {
      final response = await dio.patch("$BASE_URL/edit-student/$id", data: {
        "name": name,
        "email": email,
        "phone": num,
        "address": address
      });
      if (response.statusCode == 200) {
        getApideta();
        Get.snackbar("Success", "Student Updated Successfully",
            backgroundColor: Colors.blue.withOpacity(.3));
        update();
      }
    } catch (e) {
      print("error get api deta:-$e");
    }
  }

  removeData({id}) async {
    print("Id:-$id");
    try {
      final response = await dio.delete("$BASE_URL/remove-student/$id");
      if (response.statusCode == 200) {
        getApideta();
        Get.snackbar("Success", "Student Removed Successfully",
            backgroundColor: Colors.green.withOpacity(.3));
        update();
      }
    } catch (e) {
      print("error get api data:-$e");
    }
  }
}
