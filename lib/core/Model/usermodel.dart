class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? type;

  String? bio;
  String? image;
  String? cover;
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.type,
    required this.bio,
    required this.image,
    required this.cover,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    type = json['type'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'type': type,
      'bio': bio,
      'image': image,
      'cover': cover,
    };
  }
}
