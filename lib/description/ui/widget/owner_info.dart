import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_repo/description/ui/widget/owner_urls.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerInfo extends StatefulWidget {
  const OwnerInfo({super.key, required this.item});

  @override
  State<OwnerInfo> createState() => _OwnerInfoState();
  final Items item;
}

class _OwnerInfoState extends State<OwnerInfo> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Owner Info",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selected = !selected;
                  //print(selected);
                });
              },
              icon: selected
                  ? const Icon(
                      Icons.keyboard_arrow_up,
                      size: 32,
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                    ),
            ),
          ],
        ),
       if(selected)
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Image.network(
                   "${widget.item.owner!.avatarUrl}",
                   height: 60,
                   width: 60,
                 ),
                 const SizedBox(
                   width: 10,
                 ),
                 Text(
                   "${widget.item.owner!.login}",
                   style: const TextStyle(
                     fontSize: 20,
                   ),
                 ),
               ],
             ),
             const SizedBox(
               height: 20,
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 OwnerUrls(
                     urlText: "Repositories", url: widget.item.owner!.reposUrl!),
                 const SizedBox(
                   height: 10,
                 ),
                 OwnerUrls(urlText: "Gists", url: widget.item.owner!.gistsUrl!),
                 const SizedBox(
                   height: 10,
                 ),
                 OwnerUrls(
                     urlText: "Followers", url: widget.item.owner!.followersUrl!),
                 const SizedBox(
                   height: 10,
                 ),
                 OwnerUrls(
                     urlText: "Followings", url: widget.item.owner!.followingUrl!),
               ],
             ),
           ],
         ),
      ],
    );
  }
}
