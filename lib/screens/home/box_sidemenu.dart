import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:flutter_quiz_app/screens/home/side_bar_controller.dart';
import 'package:flutter_quiz_app/screens/home/side_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SideBox extends StatelessWidget {
  final SideMenuController controller = SideMenuController();
  SideBox({super.key});

  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry> contentList = [
      PopupMenuItem(
          child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl: AuthController.instance.photoUrl ?? '',
                    placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.grey,
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        Center(child: const FaIcon(FontAwesomeIcons.user))),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => AuthController.instance.currentUserName == null
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: Center(
                        child: Text(
                            AuthController.instance.currentUserName.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 17)),
                      ),
                    ))
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      )),
      PopupMenuItem(
          child: GestureDetector(
              onTap: () async {
                controller.website(context);
              },
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.github),
                title: Text(
                  "Github",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ))),
      PopupMenuItem(
          child: GestureDetector(
              onTap: () async {
                controller.email(context);
              },
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.envelope),
                title: Text("Mail Us",
                    style: Theme.of(context).textTheme.titleSmall),
              ))),
      PopupMenuItem(
          child: GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ))),
    ];
    return SideMenu(
      sideList: contentList,
      icon: const FaIcon(FontAwesomeIcons.user),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
