import 'package:apihome/app/modules/deta/models/home_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Dio dio = Dio();
  String BASE_URL = "https://jsonplaceholder.org/users";
  var Home = <HomeModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getHomeApi();
    super.onInit();
  }

  getHomeApi() async {
    try {
      final response = await dio.get("$BASE_URL");
      if (response.statusCode == 200) {
        var homeList =
            (response.data as List).map((e) => HomeModel.fromJson(e)).toList();
        Home.value = homeList;
        print("Home deta :- ${Home.value}");
      }
    } catch (e) {
      print("error api get home :-$e");
    }
  }
}
