import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/Mangment/CreatAccoubtState.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatAccount extends Cubit<CratAccountState> {
  CreatAccount() : super(InitalState());
  static CreatAccount get(context) => BlocProvider.of(context);
  String? type;

  changeIsAdmin(String value) {
    type = value;
    emit(ChangetypeState());
  }

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String type,
  }) {
    emit(CreatUserLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      creatSaveData(
        email: email,
        name: name,
        phone: phone,
        uid: value.user!.uid,
        type: type,
      );
      emit(ScafullCreatUserState());
    }).catchError((e) {
      emit(ErrorCrestLodingState(error: e.toString()));
    });
  }

  void creatSaveData({
    required String name,
    required String email,
    required String phone,
    required String uid,
    required String type,
  }) {
    UserModel? model = UserModel(
      type: type,
      email: email,
      name: name,
      phone: phone,
      uid: uid,
      bio: "writebio.",
      cover:
          "https://images.pexels.com/photos/268941/pexels-photo-268941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      image:
          "https://images.pexels.com/photos/5588224/pexels-photo-5588224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    );
    emit(SaveDataFireStoreLoding());
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      print(uid);
      emit(SaveDataFireStoreScafull());
    }).catchError((eror) {
      emit(SaveDataFireStoreerror(error: eror));
    });
  }
}
