import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageSelectMovieTypeShimmer extends StatelessWidget {
  const HomePageSelectMovieTypeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.only(top: 8),
      child: Shimmer.fromColors(
        baseColor: const Color.fromRGBO(110, 110, 110, 1),
        highlightColor: const Color.fromARGB(255, 85, 84, 84),
        child: ListView.separated(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 20,
              width: 50,
              color: Colors.grey.withOpacity(0.4),
            );
          },
        ),
      ),
    );
  }
}
