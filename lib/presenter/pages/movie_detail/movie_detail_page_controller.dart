import 'package:get/get.dart';

class MovieDetailPageController extends GetxController {
  String movieImage = Get.arguments['movieImage'];
  String movieTitle = Get.arguments['movieTitle'];
  String movieOverview = Get.arguments['movieOverview'];
  String releaseDate = Get.arguments['releaseDate'];
  double grade = Get.arguments['voteAverage'];
}
