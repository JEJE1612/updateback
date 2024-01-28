import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/Model/ask_model.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class PostItemsAsk extends StatelessWidget {
  const PostItemsAsk({
    super.key,
    required this.model,
  });
  final AskModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 20.0,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "${model.image}",
                ),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${model.name}", style: Styles.textStyle16),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    Text(
                      "${model.dateTime?.substring(0, 10)}",
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'remove',
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 5),
                        Text('Remove'),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  // Handle selection here
                  if (value == 'remove') {
                    MyBloc.get(context).deleteAsk(model.docId!);
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: Text("${model.text}", style: Styles.textStyle16),
            ),
          ),
          if (model.postImage != "")
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "${model.postImage}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black38.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
