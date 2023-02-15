import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class InitialPageBottomNavigationBar extends StatelessWidget {
  final List<Widget> children;
  const InitialPageBottomNavigationBar({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: const BoxDecoration(
        color: AppColors.bottonNavigationBar,
        border: Border(
          top: BorderSide(color: AppColors.accentColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
