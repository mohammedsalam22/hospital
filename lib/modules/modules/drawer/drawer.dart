import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/modules/modules/show_consult_view.dart';
import 'package:waseem/modules/notification_view.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/styles.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  Widget build(BuildContext _) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: SvgPicture.asset(
              Assets.drawer,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'اختيار الطابق',
                    style: AppStyle.Bold(),
                  ),
                  onTap: () {},
                  leading: SvgPicture.asset(Assets.home),
                ),
                ListTile(
                  title: Text(
                    'الاشعارات',
                    style: AppStyle.Bold(),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationView())) ;
                  },
                  leading: SvgPicture.asset(Assets.bell),
                ),
                ListTile(
                  title: Text(
                    'الاستشارات',
                    style: AppStyle.Bold(),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShowConsultView())) ;
                  },
                  leading: const Icon(Icons.file_copy_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
