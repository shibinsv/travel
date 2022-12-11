import 'package:flutter/material.dart';

class SettingsTabPage extends StatelessWidget {
  const SettingsTabPage({Key? key}) : super(key: key);
  static navigateToSettingsTabPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsTabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(child: Text("Work in progress")),
    );
  }
}
