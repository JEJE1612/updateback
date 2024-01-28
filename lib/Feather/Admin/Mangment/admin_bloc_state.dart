abstract class AdminState {}

class InitnalState extends AdminState {}

class UserSignOut extends AdminState {}

class LodingGetUserData extends AdminState {}

class ScafullGetUserData extends AdminState {}

class ErrorGetUserData extends AdminState {
  final String error;
  ErrorGetUserData(this.error);
}

class HomeErrorStata extends AdminState {
  final String error;
  HomeErrorStata(this.error);
}

class LodingGetAllConsltant extends AdminState {}

class ScafullGetAllConsltant extends AdminState {}

class LodingGetAlluser extends AdminState {}

class ScafullGetAllUser extends AdminState {}

class ErrorGetGetAllConsltant extends AdminState {}

class LodingGetProfailImage extends AdminState {}

class ScafullGetProfailImage extends AdminState {}

class ErrorGetProfailImage extends AdminState {}

class ScafullGetCoverImage extends AdminState {}

class ErrorGetCoverImage extends AdminState {}

class LodingUdateAdminData extends AdminState {}

class ScafullUdateAdminData extends AdminState {}

class ErrorUdateAdminData extends AdminState {}

class LodingUploadImageProfailState extends AdminState {}

class ScafullUploadImageProfailState extends AdminState {}

class ErrorUploadImageProfailState extends AdminState {}

class LodingUploadcoverAdminState extends AdminState {}

class ScafullUploadcoverAdminState extends AdminState {}

class ErorUploadcoverAdminState extends AdminState {}

class RemovecatroiesImage extends AdminState {}

class LodingGetCatroiesImage extends AdminState {}

class ScafullGetCatroiesImage extends AdminState {}

class ErorGetCatroiesImage extends AdminState {}

class LodingCreatCatroies extends AdminState {}

class ScafullCreatCatroies extends AdminState {}

class ErrorCreatCatroies extends AdminState {}

class LodingUploadCrtroiesmageState extends AdminState {}

class ScafullUploadCatroiesImageState extends AdminState {}

class LodingGetcatroiesState extends AdminState {}

class ScafullGetcatroiesstate extends AdminState {}

class SuccessfulDeleteCatroiesState extends AdminState {}

class ErrorDeleteCatroiesState extends AdminState {}

class ScafullsignOut extends AdminState {}
