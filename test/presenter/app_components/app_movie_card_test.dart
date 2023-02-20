import 'package:challange_mobile_developer_flutter/presenter/app_components/app_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should render MovieCard', (tester) async {
    const image = '/jhi3K0rN46SSu9wEu6zYVCOeVtH.jpg';
    const movieName = 'Batman';
    const tag = 'hero';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AppMovieCard(image: image, movieName: movieName, tag: tag),
      ),
    ));
    final nameFinder = find.text(movieName);
    expect(nameFinder, findsOneWidget);
  });
}
