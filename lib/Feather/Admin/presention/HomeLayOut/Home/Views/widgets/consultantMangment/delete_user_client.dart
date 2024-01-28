import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/list_view_dealt_consultant.dart';

class DealtAllUser extends StatefulWidget {
  const DealtAllUser({super.key});

  @override
  State<DealtAllUser> createState() => _DealtAllUserState();
}

class _DealtAllUserState extends State<DealtAllUser> {
  @override
  void initState() {
    getClientstream();
    searchword.addListener(_onSearchChange);
    super.initState();
  }

  _onSearchChange() {
    print('nnnnnnnnnnnnnnnn');
    searchResultlist();
  }

  TextEditingController searchword = TextEditingController();
  List allresult = [];
  List resultlist = [];
  List<String> emailblock = [''];
  getClientstream() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .get();
    setState(() {
      allresult = data.docs;
    });
    searchResultlist();
  }

  searchResultlist() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapShot in allresult) {
        var name = userSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapShot);
        }
      }
    } else {
      showResult = List.from(allresult);
    }
    setState(() {
      resultlist = showResult;
    });
  }

  @override
  void dispose() {
    searchword.removeListener(_onSearchChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientstream();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarAbmin(
              onPressed: () {
                Navigator.pop(context);
              },
              title: "Dealet user",
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(
                controller: searchword,
              ),
            ),
            Expanded(child: ListViewDealtConsultant(resultlist: resultlist)),
          ],
        ),
      ),
    );
  }
}
