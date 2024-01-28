import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc_state.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitnalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  var uid = CacheHealper.getData("uid", key: "uid");
  UserModel? usermodel;

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint("User signed out successfully");
      emit(ScafullsignOut());
    } catch (e) {
      debugPrint("Error signing out: $e");
    }
  }

  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance
        .collection('user')
        .doc("yEJAMol8gmM2i9UCP4CNqZoDJSG2")
        .get()
        .then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
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

  List<QueryDocumentSnapshot> dataconsult = [];
  List<QueryDocumentSnapshot> dataclient = [];

  getconsultant() async {
    emit(LodingGetAllConsltant());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'consulting')
        .get()
        .then((value) {
      for (var element in value.docs) {
        dataconsult.add(element);
      }
      debugPrint(value.toString());
      emit(ScafullGetAllConsltant());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  getAllUser() async {
    emit(LodingGetAlluser());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'client')
        .get()
        .then((value) {
      for (var element in value.docs) {
        dataclient.add(element);
      }
      debugPrint(value.toString());
      emit(ScafullGetAllUser());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      emit(ScafullGetProfailImage());
    } else {
      debugPrint('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  File? cover;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      cover = File(pickedFile.path);
      emit(ScafullGetCoverImage());
    } else {
      emit(ErrorGetCoverImage());
    }
  }

  void udateAdminData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(LodingUdateAdminData());
    UserModel model = UserModel(
      name: name,
      email: usermodel!.email,
      phone: phone,
      uid: usermodel!.uid,
      type: "",
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
      emit(ScafullUdateAdminData());
    }).catchError((eror) {
      emit(ErrorUdateAdminData());
      debugPrint(eror.toString());
    });
  }

  void uploadprofialImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingUploadImageProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(image!.path).pathSegments.last}")
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        debugPrint(value);
        udateAdminData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
        debugPrint(value);
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      debugPrint(e.toString());
      emit(ErrorUploadImageProfailState());
    });
  }

  void uploadCoverImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingUploadcoverAdminState());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(cover!.path).pathSegments.last}")
        .putFile(cover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadcoverAdminState());
        debugPrint(value);
        udateAdminData(
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

  //finshEditProfail andGetuser

//statrt MangmentCatroies

  File? catroiesImage;

  void removeImgePOst() {
    catroiesImage == File('');
    emit(RemovecatroiesImage());
  }

  Future<void> getcatroiesImage() async {
    emit(LodingGetCatroiesImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      catroiesImage = File(pickedFile.path);

      emit(ScafullGetCatroiesImage());
    } else {
      debugPrint('No image selected.');
      emit(ErorGetCatroiesImage());
    }
  }

  void uploadCatroiesImageImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingUploadCrtroiesmageState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(catroiesImage!.path).pathSegments.last}")
        .putFile(catroiesImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatPost(
          datetime: date,
          text: text,
          catroiesImage: value,
        );
        emit(ScafullUploadCatroiesImageState());
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadImageProfailState());
    });
  }

  void creatPost({
    required String text,
    required String datetime,
    String? catroiesImage,
  }) {
    emit(LodingCreatCatroies());
    CatroiesModel model = CatroiesModel(
      dateTime: datetime,
      text: text,
      uId: uid,
      catoiesImage: catroiesImage ?? "",
    );
    FirebaseFirestore.instance
        .collection("Catroies")
        .add(model.toMap())
        .then((value) {
      debugPrint(value.id);
      emit(ScafullCreatCatroies());
    }).catchError((eror) {
      debugPrint(eror);
      emit(ErrorCreatCatroies());
    });
  }

  List catroies = [];
  List<String> catroiesnum = [];

  void getCaroies() async {
    catroies.clear();
    catroiesnum.clear();
    emit(LodingGetcatroiesState());
    await FirebaseFirestore.instance.collection('Catroies').get().then((value) {
      for (var element in value.docs) {
        catroies.add(CatroiesModel.fromJson(element.data()));
        catroiesnum.add(element.id);
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }

  void deleteCatroies(String catroiesId) async {
    catroies.clear();
    catroiesnum.clear();
    try {
      await FirebaseFirestore.instance
          .collection('Catroies')
          .doc(catroiesId)
          .delete();
      getCaroies();
      emit(SuccessfulDeleteCatroiesState());
    } catch (e) {
      debugPrint("Error deleting category: $e");
      emit(ErrorDeleteCatroiesState());
    }
  }

//mangment User and Consultant

  List allresult = [];
  List resultlist = [];
  TextEditingController searchword = TextEditingController();
  List<String> emailblock = [''];

  deletconsultant({required int index}) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(resultlist[index]['uid'])
        .delete()
        .then((value) {})
        .catchError((e) {
      debugPrint(e.toString());
    });
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
    resultlist = showResult;
  }
}
