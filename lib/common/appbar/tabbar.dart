import 'package:flutter/material.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/device/device_utitity.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class TTapBar extends StatelessWidget implements PreferredSizeWidget {
  const TTapBar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          labelColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}