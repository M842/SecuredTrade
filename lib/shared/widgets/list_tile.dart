import 'package:flutter/material.dart';
import 'package:securedtrade/core/theme/app_colors.dart';
import 'package:securedtrade/core/utils/dialog_utils.dart';
import 'package:securedtrade/shared/styles/text_styles.dart';

class ListTiles extends StatelessWidget {
  final String image, title;
  final int index;
  const ListTiles({
    super.key,
    required this.image,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10, width: 0),
        ListTile(
          onTap: () {
            onHandlerEvent(index, context);
          },
          leading: Padding(
            padding: EdgeInsets.only(left: title == "Logout" ? 5 : 0),
            child: Image.asset(
              image,
              height: title == "Logout" ? 22 : 24,
              width: title == "Logout" ? 22 : 24,
              color: title == "Logout" ? Colors.red : AppColors.primary,
            ),
          ),
          title: Text(
            title,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black5,
            ),
          ),
          trailing: index == 6
              ? SizedBox()
              : Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff6C757D),
                  size: 15,
                ),
        ),
        SizedBox(height: 8, width: 0),
        index == 6
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(color: Color(0xffDFE2E4), height: 0.5),
              ),
      ],
    );
  }

  onHandlerEvent(index, BuildContext context) {
    switch (index) {
      case 6:
        DialogUtils.logout(
          context: context,
          title: "Confirmation",
          message: "Are you sure you want to logout?",
        );
        break;
    }
  }
}
