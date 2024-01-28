import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

import '../../../../../../Mangment/admin_bloc.dart';

class ItemsListViewDelete extends StatelessWidget {
  const ItemsListViewDelete(this.model, this.catroiesId, {Key? key})
      : super(key: key);

  final CatroiesModel model;
  final String catroiesId;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(model.catoiesImage ??
                  "https://firebasestorage.googleapis.com/v0/b/consultme-2be0e.appspot.com/o/user%2F1000297238.jpg?alt=media&token=23b3f3e1-46c1-448d-818e-8a384c6d8445"),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "${model.text} ",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              )),
        ),
        CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {
                  AdminBloc.get(context).deleteCatroies(catroiesId);
                },
                icon: const Icon(Icons.delete_outline))),
      ],
    );
  }
}
