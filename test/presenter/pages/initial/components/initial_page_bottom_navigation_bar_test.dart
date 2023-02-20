import 'package:challange_mobile_developer_flutter/presenter/pages/initial/components/initial_page_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should render a InitialPageBottonNavigationBar', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InitialPageBottomNavigationBar(
            children: [Icon(Icons.add), Text('Data')],
          ),
        ),
      ),
    );
    expect(find.text('Data'), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
  });
}
