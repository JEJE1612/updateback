import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/home/Home.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/profail_consultant.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/Catroieus.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/ask_model.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalState());
  static MyBloc get(context) => BlocProvider.of(context);

  int currentindex = 0;
  
  List<Widget> views = [
    const CatroiesScreen(),
    const ChatScreen(),
    Profail(),
    const Setting(),
  ];

  List<Widget> viewsConsultant = [
    const HomeCuslatant(),
    const ChatScreen(),
    ProfailConsultant(),
    const Setting(),
  ];
  var uid = CacheHealper.getData('uid', key: 'uid');
  void choosemycategory(String mychoose) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set({'category': mychoose}, SetOptions(merge: true)).then((value) {
      //Do your stuff.
    });
  }

   List catroies = [];
  List<String> catroiesnum = [];

  void getCaroies() async {

    emit(LodingGetcatroiesState());
     FirebaseFirestore.instance.collection('Catroies').get().then((value) {
      for (var element in value.docs) {
        catroies.add(element);
        catroiesnum.add(element.id);

        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }

  List catroiesuser = [];

  void getCaroiestouser() async {

    emit(LodingGetcatroiesState());
     FirebaseFirestore.instance.collection('Catroies').get().then((value) {
      for (var element in value.docs) {
        catroiesuser.add(CatroiesModel.fromJson(element.data()));
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }

List<QueryDocumentSnapshot> datagenaralconsult = [];
  List<QueryDocumentSnapshot> dataanyconsult = [];

  getconsultantbloc() async {
    emit(LodingGetAllConsltant());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'consulting')
        .get()
        .then((value) {
      for (var element in value.docs) {
        datagenaralconsult.add(element);
      }
      debugPrint(value.toString());
      emit(ScafullGetAllConsltant());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  getAllcosultant(String? typecategory) async {
    

    emit(LodingGettypeconsultant());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'consulting')
        .where('category', isEqualTo: typecategory)
        .get()
        .then((value) {
      for (var element in value.docs) {
        dataanyconsult.add(element);
      }
      debugPrint(value.toString());
      emit(ScafullGettypeconslutant());
    }).catchError((e) {
      emit(ErrorGettypeconslutant());
    });
  }



  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }

  ThemeMode themeMode = ThemeMode.light;
  void changeTheam(ThemeMode mode) {
    themeMode = mode;
    emit(ChangeTheamMode());
  }

  UserModel? usermodel;

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out successfully");
      emit(ScafullsignOut());
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
          print("$usermodel");
        } else {
          emit(HomeErrorStata("Data is null"));
        }
      } else {
        emit(HomeErrorStata("Document does not exist"));
      }
    }).catchError((e) {
      emit(ErrorGetUserData(e));
    });
  }

  File? imageUser;

  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUser = File(pickedFile.path);
      print(imageUser);

      emit(ScafullGetProfailImage());
    } else {
      print('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  File? coverUser;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverUser = File(pickedFile.path);
      emit(ScafullGetCoverImage());
    } else {
      emit(ErrorGetCoverImage());
    }
  }

  void udateUserData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(LodingudateUserData());
    UserModel model = UserModel(
      name: name,
      email: usermodel!.email,
      phone: phone,
      uid: usermodel!.uid,
      type: usermodel!.type,
      bio: bio,
      image: image ?? usermodel!.image,
      cover: cover ?? usermodel!.cover,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(ScafulludateUserData());
    }).catchError((eror) {
      emit(ErrorudateUserData());
      print(eror.toString());
    });
  }

  void uploadprofialImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingudateUserData());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imageUser!.path).pathSegments.last}")
        .putFile(imageUser!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
        print(value);
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      print(e.toString());
      emit(ErrorUploadImageProfailState());
    });
  }

  void uploadCoverImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingudateUserData());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(coverUser!.path).pathSegments.last}")
        .putFile(coverUser!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadcoverAdminState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          cover: value,
        );
      }).catchError((e) {
        emit(ErorUploadcoverAdminState());
      });
    }).catchError((e) {
      emit(ErorUploadcoverAdminState());
    });
  }

  File? imageAsk;

  void removeimagephoto() {
    imageAsk == File('');
    emit(RemoveAskImage());
  }

  Future<void> getImagePhotogallery() async {
    emit(LodingGetimageAsk());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageAsk = File(pickedFile.path);

      emit(ScafullGetimageAsk());
    } else {
      print('No image selected.');
      emit(ErrorGetimageAsk());
    }
  }

  void uploadAskImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingCreatAskUser());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imageAsk!.path).pathSegments.last}")
        .putFile(imageAsk!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatAddPhoto(
          dateTime: date,
          text: text,
          postImge: value,
        );
        emit(ScafullUploadAskImageState());
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErorUploadAskImageState());
    });
  }

  List<AskModel> poto = [];
  List potoId = [];

  CollectionReference post = FirebaseFirestore.instance.collection('post');

  void creatAddPhoto({
    required String text,
    String? postImge,
    required String dateTime,
  }) async {
    AskModel model = AskModel(
      uId: usermodel?.uid,
      name: usermodel?.name,
      text: text,
      image: usermodel?.image,
      postImage: postImge ?? "",
      dateTime: dateTime,
    );

    emit(LodingCreatAskUser());
    poto.clear();
    potoId.clear();

    try {
      DocumentReference docRef = await post.add(model.toMap());

      model.docId = docRef.id;

      // Optionally, you can update the document in Firestore with the docId
      await docRef.update({'docId': docRef.id});

      getAsk();

      emit(ScafullCreatAskUser());
    } catch (e) {
      emit(ErrorCreatAskUser());
      print("Error in creating addPhoto: ${e.toString()}");
    }
  }

  void getAsk() async {
    emit(LodingGetListAsk());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where("uId", isEqualTo: uid)
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        poto.add(AskModel.fromJson(element.data() as Map<String, dynamic>));
        potoId.add(element.id);
      }

      emit(ScafullGetListAsk());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }

  List<AskModel> allAsk = [];
  List allAskid = [];
  void getAllAsk() async {
    emit(LodingGetListAllAsk());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        allAsk.add(AskModel.fromJson(element.data() as Map<String, dynamic>));
        allAskid.add(element.id);
      }

      emit(ScafullGetListAllAsk());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }

  void deleteAsk(String docId) async {
    try {
      emit(LodingDeleteAskUser());

      // Delete the document from Firestore
      await post.doc(docId).delete();

      // Remove the item from the local list based on the docId
      poto.removeWhere((ask) => ask.docId == docId);
      potoId.remove(docId);

      emit(SuccessDeleteAskUser());
    } catch (e) {
      emit(ErrorDeleteAskUser());
      print("Error in deleting ask: $e");
    }
  }

  File? imagework;

  void removeimagework() {
    imageAsk == File('');
    emit(Removeimagework());
  }

  Future<void> getimagework() async {
    emit(LodingGetimagework());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagework = File(pickedFile.path);

      emit(ScafullGetimagework());
    } else {
      print('No image selected.');
      emit(ErrorGetimageAsk());
    }
  }

  void uploadimagework({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingCreatAskUser());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imagework!.path).pathSegments.last}")
        .putFile(imagework!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatSameWork(
          dateTime: date,
          text: text,
          postImge: value,
        );
        emit(ScafullUploadcreatSameWorkState());
      }).catchError((e) {
        emit(ErrorUploadcreatSameWorkProfailState());
      });
    }).catchError((e) {
      emit(ErorUploadcreatSameWorkState());
    });
  }

  List<AskModel> someWork = [];
  List someWorkid = [];

  CollectionReference work = FirebaseFirestore.instance.collection('Work');

  void creatSameWork({
    required String text,
    String? postImge,
    required String dateTime,
  }) async {
    AskModel model = AskModel(
      uId: usermodel?.uid,
      name: usermodel?.name,
      text: text,
      image: usermodel?.image,
      postImage: postImge ?? "",
      dateTime: dateTime,
    );

    emit(LodingCreatSomeWork());
    someWork.clear();
    someWorkid.clear();

    try {
      DocumentReference docRef = await work.add(model.toMap());

      model.docId = docRef.id;

      // Optionally, you can update the document in Firestore with the docId
      await docRef.update({'docId': docRef.id});

      getSomeWork();

      emit(ScafullCreatSomeWork());
    } catch (e) {
      emit(ErrorCreatSomeWork());
      print("Error in creating addPhoto: ${e.toString()}");
    }
  }

  void getSomeWork() async {
    emit(LodingGetListSomeWork());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Work')
          .where("uId", isEqualTo: uid)
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        someWork.add(AskModel.fromJson(element.data() as Map<String, dynamic>));
        someWorkid.add(element.id);
      }

      emit(ScafullGetSomeWork());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }

  void deleteWork(String docId) async {
    emit(LodingDeletesomeWorkid());

    try {
      await FirebaseFirestore.instance.collection('Work').doc(docId).delete();

      // Remove the deleted item from the local lists
      int index = someWorkid.indexOf(docId);
      if (index != -1) {
        someWorkid.removeAt(index);
        someWork.removeAt(index);
      }

      emit(SuccessDeletesomeWorkid());
    } catch (e) {
      emit(ErrorDeletesomeWorkid());
      print("Error in deleteWork: $e");
    }
  }
}
