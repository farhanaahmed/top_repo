import 'package:flutter/material.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

class TopRepositoriesList extends StatelessWidget {
  final TopRepositories topRepositories;

  const TopRepositoriesList({super.key, required this.topRepositories});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: topRepositories.items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final isPublic = topRepositories.items![index].visibility == "public";

          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
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
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isPublic ? Colors.greenAccent : Colors.redAccent,
                  ),
                  child: isPublic ? const Text("Public") : const Text("Private"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${topRepositories.items![index].name}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "owner: ${topRepositories.items![index].owner!.login}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.visibility_outlined,
                      color: Colors.blueGrey,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${topRepositories.items![index].watchersCount}",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.star_border_purple500_outlined,
                      color: Colors.yellow,
                      size: 28,
                    ),
                    const SizedBox(
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
