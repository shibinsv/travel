import 'package:flutter/material.dart';

class ProfiletabPage extends StatelessWidget {
  const ProfiletabPage({Key? key}) : super(key: key);
  static navigateToProfiletabPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfiletabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Center(child: Text("Work in progress")),
    );
  }
}
