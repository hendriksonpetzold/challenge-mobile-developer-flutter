import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home page search form field ...', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: HomePageSearchFormField(
          controller: TextEditingController(),
        )),
      ),
    );
    await tester.enterText(find.byType(TextField), 'hi');
    expect(find.text('hi'), findsOneWidget);
  });
}
