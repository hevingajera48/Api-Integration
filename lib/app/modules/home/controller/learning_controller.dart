//
// import 'package:apihome/app/modules/deta/models/learning_model.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
//
// class LearningController extends GetxController {
//   Dio dio = Dio();
//   String Base_URL = "https://jsonplaceholder.typicode.com/posts";
//   var Learning = <LearningModel>[].obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getLearningApi();
//     super.onInit();
//   }
//
//   getLearningApi() async {
//     try {
//       final response = await dio.get("$Base_URL");
//       if (response.statusCode == 200) {
//         var learningList = (response.data as List)
//             .map((e) => LearningModel.fromJson(e))
//             .toList();
//         Learning.value = learningList;
//         print("Learning deta :-${Learning.value}");
//       }
//     } catch (e) {
//       print("eroor api get:-$e");
//     }
//   }
// }
//

import 'package:apihome/app/modules/deta/models/learning_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LearningController extends GetxController {
  Dio dio = Dio();
  String BASE_URL = "";
  var Learning = <LearningModel>[].obs;

  void onInit() {
    //TODO: implement onInit

    getLearningApi();
    super.onInit();
  }

  getLearningApi() async {
    try {
      final response = await dio.get("$BASE_URL");
      if (response.statusCode == 200) {
        var learningList = (response.data as List)
            .map((e) => LearningModel.fromJson(e))
            .toList();
        Learning.value = learningList;
        print("${Learning.value}");
      }
    } catch (e) {
      print("error :- $e");
    }
  }
}

// import 'package:apihome/app/modules/deta/models/learning_model.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
//
// class LearningController extends GetxController {
//   Dio dio = Dio();
//   String BASE_URL = "";
//   var Learning = <LearningModel>[].obs;
//
//   void onInit() {
//     //TODO: implement onInit
//     getLearningApi();
//     super.onInit();
//   }
//
//   getLearningApi() async {
//     final response = await dio.get("$BASE_URL");
//     try {
//       if (response.statusCode == 200) {
//         var learningList = (response.data as List)
//             .map((e) => LearningModel.fromJson(e))
//             .toList();
//         Learning.value = learningList;
//         print("${Learning.value}");
//       }
//     } catch (e) {
//       print("Eroor api get:-$e");
//     }
//   }
// }
