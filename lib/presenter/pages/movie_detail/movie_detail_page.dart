import 'package:challange_mobile_developer_flutter/presenter/app_components/app_custom_back_button.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/components/movie_detail_page_information_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .5,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 60, right: 16),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 32,
                bottom: 24,
              ),
              height: MediaQuery.of(context).size.height * .7,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.02,
                    0.1,
                    0.2,
                    0.85,
                    0.95,
                  ],
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.8),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const MovieDetailPageInformationBox(
                    releaseDate: '',
                    grade: 0,
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
                  const Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
