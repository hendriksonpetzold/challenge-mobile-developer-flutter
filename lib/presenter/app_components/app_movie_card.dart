import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppMovieCard extends StatelessWidget {
  final String image;
  final String movieName;

  final void Function()? onAddIconTap;
  const AppMovieCard({
    Key? key,
    required this.image,
    required this.movieName,
    this.onAddIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .35,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w220_and_h330_face$image',
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.4,
                0.5,
                0.65,
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              movieName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: onAddIconTap,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
