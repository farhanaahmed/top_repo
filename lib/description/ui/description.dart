import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:top_repo/description/ui/widget/info_box.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';


class Description extends StatelessWidget {
  Description({super.key, required this.item}) {
    if (savedDateString == null) {
      updatedAt = "";
    } else {
      DateTime tempDate =
          DateFormat("yyyy-MM-ddThh:mm:ssz").parse(savedDateString!);
      updatedAt = DateFormat('d MMM yyyy').format(tempDate);
    }
  }

  final Items item;
  late bool isPublic = item.visibility == "public";
  late String? savedDateString = item.updatedAt;
  late String updatedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "${item.name}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last updated : $updatedAt",
                  style: const TextStyle(
                    color: Color(0xff8A8484),
                  ),
                ),
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
                  child:
                      isPublic ? const Text("Public") : const Text("Private"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Text(
              item.description ?? "No Description Available.",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InfoBox(item: item,),
          ],
        ),
      ),
    );
  }
}
