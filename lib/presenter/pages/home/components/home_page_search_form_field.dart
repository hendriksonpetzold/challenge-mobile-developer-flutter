import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomePageSearchFormField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  const HomePageSearchFormField({
    Key? key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.searchBar,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          const Icon(
            Icons.search,
            size: 20,
            color: AppColors.accentColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Search',
                isDense: true,
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
