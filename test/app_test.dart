import 'package:challange_mobile_developer_flutter/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app test', (tester) async {
    tester.pumpWidget(const App());
  });
}
