import 'package:flutter/material.dart';
import 'package:top_repo/description/ui/widget/single_info.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffAEAEAE),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleInfo(
                iconData: Icons.visibility_outlined,
                infoText: item.watchersCount.toString(),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleInfo(
                iconData: Icons.star_border_purple500_outlined,
                infoText: item.stargazersCount.toString(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleInfo(
                iconData: Icons.adjust_outlined,
                infoText: item.openIssuesCount.toString(),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleInfo(
                iconData: Icons.fork_left,
                infoText: item.forks.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
