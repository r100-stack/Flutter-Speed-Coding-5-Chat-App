import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/custom_list_tile.dart';
import 'package:chat_app/models/group.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final Group group;

  GroupCard(this.group);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: CustomListTile(
        onTap: () {
          Navigator.pushNamed(context, ChatScreen.routeName, arguments: group);
        },
        title: Text(
          group.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          group.tagline,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: CircleAvatar(
          child: ClipOval(
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageUrl:
                  group.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.group),
            ),
          ),
        ),
      ),
    );
  }
}
