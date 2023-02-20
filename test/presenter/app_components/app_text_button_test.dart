import 'package:challange_mobile_developer_flutter/presenter/app_components/app_text_button.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should show a app text_button', (tester) async {
    const label = 'Label';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AppTextButton(isSelected: true, label: label, onTap: () {}),
      ),
    ));
    expect(find.text(label), findsOneWidget);
  });

  testWidgets('should return AppColors.accentColor', (tester) async {
    bool isSelected = true;
    String label = "Button";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AppTextButton(
          isSelected: isSelected,
          label: label,
          onTap: () {},
        ),
      ),
    ));

    final text = tester.widget<Text>(find.text(label));
    expect(text.style!.color, AppColors.accentColor);
  });

  testWidgets('should return AppColors.textColor', (tester) async {
    bool isSelected = false;
    String label = "Button";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AppTextButton(
          isSelected: isSelected,
          label: label,
          onTap: () {},
        ),
      ),
    ));

    final text = tester.widget<Text>(find.text(label));
    expect(text.style!.color, AppColors.textColor);
  });

  testWidgets('testing the button tapr', (tester) async {
    bool isSelected = false;
    String label = "Button";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AppTextButton(
          isSelected: isSelected,
          label: label,
          onTap: () {
            isSelected = true;
          },
        ),
      ),
    ));

    await tester.tap(find.text(label));
    expect(isSelected, true);
  });
}
