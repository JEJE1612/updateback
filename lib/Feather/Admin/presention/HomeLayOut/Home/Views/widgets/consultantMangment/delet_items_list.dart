import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class DealtItemslist extends StatelessWidget {
  const DealtItemslist({
    super.key,
    required this.resultlist,
    required this.index,
  });

  final List resultlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                resultlist[index]['image'],
              ),
            ),
          ),
        ),
        title: Text(
          resultlist[index]['name'],
          style: Styles.textStyle16,
        ),
        subtitle: Text(
          resultlist[index]['bio'],
          style: Styles.textStyle14.copyWith(color: Colors.black87),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey,
          child: IconButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("user")
                  .doc(resultlist[index]['uid'])
                  .delete()
                  .then((_) {
                print('done');
              });

              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
