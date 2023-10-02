import 'package:flutter/material.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

class TopRepositoriesList extends StatelessWidget {
  final TopRepositories topRepositories;

  const TopRepositoriesList({super.key, required this.topRepositories});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        // left: 4,
        // right: 4,
        top: 8,
        bottom: 8,
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(4),
        itemCount: topRepositories.items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final isPublic = topRepositories.items![index].visibility == "public";

          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       "Repository no: ${index+1}",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isPublic ? Colors.greenAccent : Colors.redAccent,
                  ),
                  child: isPublic ? Text("Public") : Text("Private"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${topRepositories.items![index].fullName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "owner: ${topRepositories.items![index].owner!.login}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.blueGrey,
                      size: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${topRepositories.items![index].watchersCount}",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.star_border_purple500_outlined,
                      color: Colors.yellow,
                      size: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${topRepositories.items![index].stargazersCount}",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
