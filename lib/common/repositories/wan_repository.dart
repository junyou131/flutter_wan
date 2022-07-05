import 'package:dio/dio.dart';
import '../net/http_client.dart';
import 'package:get/get.dart' hide Response;

class WanRepository extends GetxService {
  static WanRepository get instance => Get.find();
  late HttpClient client;

  WanRepository(this.client);

  Future<Response> getHomeBanner() {
    return client.fire(RequestMethod.GET, '/banner/json');
  }
}
