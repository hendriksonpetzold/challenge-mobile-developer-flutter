import 'package:flutter/material.dart';

class AppCustomBackButton extends StatelessWidget {
  final void Function()? onTap;
  const AppCustomBackButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0XFF333436),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
