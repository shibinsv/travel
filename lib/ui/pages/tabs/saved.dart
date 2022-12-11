import 'package:flutter/material.dart';

class SavedtabPage extends StatelessWidget {
  const SavedtabPage({Key? key}) : super(key: key);
  
  static navigateToSavedtabPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SavedtabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(child: Text("Work in progress")),
    );
  }
}
