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
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Text(
                "This is Description Page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
