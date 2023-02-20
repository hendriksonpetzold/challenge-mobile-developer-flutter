import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmerList extends StatelessWidget {
  const HomePageShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(110, 110, 110, 1),
      highlightColor: const Color.fromARGB(255, 85, 84, 84),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey.withOpacity(0.4),
          );
        },
      ),
    );
  }
}
