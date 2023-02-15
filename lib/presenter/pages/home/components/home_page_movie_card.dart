import 'package:flutter/material.dart';

class HomePageMovieCard extends StatelessWidget {
  final String image;
  final String movieName;
  final String releaseDate;
  const HomePageMovieCard({
    Key? key,
    required this.image,
    required this.movieName,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w220_and_h330_face$image',
              ),
            ),
          ),
        ),
        Text(
          movieName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          releaseDate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
