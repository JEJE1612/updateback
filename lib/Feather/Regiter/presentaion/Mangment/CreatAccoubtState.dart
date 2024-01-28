abstract class CratAccountState {}

class InitalState extends CratAccountState {}

class CreatUserLodingState extends CratAccountState {}

class ScafullCreatUserState extends CratAccountState {}

class ErrorCrestLodingState extends CratAccountState {
  String error;
  ErrorCrestLodingState({required this.error});
}

class SaveDataFireStoreLoding extends CratAccountState {}

class SaveDataFireStoreScafull extends CratAccountState {
//final String? uid = model!.uid;
}

class SaveDataFireStoreerror extends CratAccountState {
  String error;
  SaveDataFireStoreerror({required this.error});
}

class ChangetypeState extends CratAccountState {}
