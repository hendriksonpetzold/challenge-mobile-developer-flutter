import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MovieDetailPageInformationBody extends StatelessWidget {
  final String heroTag;
  final String movieImage;
  final String releaseDate;
  final String overview;
  final String voteAverage;

  const MovieDetailPageInformationBody({
    Key? key,
    required this.heroTag,
    required this.movieImage,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: heroTag,
                  child: Image(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w220_and_h330_face$movieImage'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Release Date',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        releaseDate,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Grade',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        voteAverage,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
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
              overview,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
