import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Github Top Repositories",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Text(
          "This is description screen",
        ),
      ),
    );
  }
}
