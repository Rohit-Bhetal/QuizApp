import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogManager {
  static void showErrorDialog(BuildContext context, dynamic error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          error.toString(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        icon: const Center(
            child: FaIcon(
          FontAwesomeIcons.triangleExclamation,
          size: 20,
        )),
        title: Text(
          "Error",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          Center(
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white70,
              label: Text(
                "Close",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
