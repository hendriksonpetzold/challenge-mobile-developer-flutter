import 'package:challange_mobile_developer_flutter/presenter/app_components/app_custom_back_button.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/components/movie_detail_page_information_box.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/movie_detail_page_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailPageController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCustomBackButton(onTap: () {
                          Get.back();
                        }),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              MovieDetailPageInformationBox(
                releaseDate: controller.releaseDate,
                grade: controller.grade,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                controller.movieOverview,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
