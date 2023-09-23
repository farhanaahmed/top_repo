import 'package:flutter/material.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

class TopRepositoriesList extends StatelessWidget {
  final TopRepositories topRepositories;

  const TopRepositoriesList({super.key, required this.topRepositories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(4),
      itemCount: topRepositories.items?.length ?? 0,
      itemBuilder: (BuildContext context,int index){
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${topRepositories.items![index].fullName}"),
            ],
          ),
        );
      },


    );
  }
}
