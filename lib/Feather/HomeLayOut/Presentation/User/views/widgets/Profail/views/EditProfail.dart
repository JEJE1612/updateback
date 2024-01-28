import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomTextFoemaFaildEditProfail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfailUser extends StatefulWidget {
  const EditProfailUser({super.key});

  @override
  State<EditProfailUser> createState() => _EditProfailUserState();
}

class _EditProfailUserState extends State<EditProfailUser> {
var selectedType;
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController jodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is ScafullUploadImageProfailState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var usermodel = MyBloc.get(context).usermodel;
        var imageProfail = MyBloc.get(context).imageUser;
        var imagecover = MyBloc.get(context).coverUser;

        var Bloc = MyBloc.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomAppBarAbmin(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: "Edit Profile"),
                      ],
                    ),
                    if (state is LodingudateUserData)
                      const LinearProgressIndicator(),
                    const SizedBox(height: 3),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomLeft,
                      children: [
                        Card(
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          elevation: 0.0,
                          child: InkWell(
                            onTap: () {
                              Bloc.getCover();
                            },
                            child: Container(
                              height: size.height * 0.23,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: imagecover == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          "${usermodel?.cover}",
                                        ),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: FileImage(imagecover),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -50,
                          child: InkWell(
                            onTap: () {
                              Bloc.getImageProfail();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: Colors.white),
                              child: CircleAvatar(
                                backgroundImage: imageProfail == null
                                    ? CachedNetworkImageProvider(
                                        usermodel!.image!,
                                      )
                                    : FileImage(imageProfail) as ImageProvider,
                                radius: 48,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    if (MyBloc.get(context).imageUser != null ||
                        MyBloc.get(context).coverUser != null)
                      Row(
                        children: [
                          if (MyBloc.get(context).imageUser != null)
                            Expanded(
                              child: Column(
                                children: [
                                  CustomButton(
                                    text: "image",
                                    onTap: () {
                                      MyBloc.get(context).uploadprofialImage(
                                        name: nameController.text.isNotEmpty
                                            ? nameController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.name ??
                                                "",
                                        phone: phoneController.text.isNotEmpty
                                            ? phoneController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.phone ??
                                                "",
                                        bio: bioController.text.isNotEmpty
                                            ? bioController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.bio ??
                                                "",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            width: 5,
                          ),
                          if (MyBloc.get(context).coverUser != null)
                            Expanded(
                              child: Column(
                                children: [
                                  CustomButton(
                                    text: "cover",
                                    onTap: () {
                                      MyBloc.get(context).uploadCoverImage(
                                        name: nameController.text.isNotEmpty
                                            ? nameController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.name ??
                                                "",
                                        phone: phoneController.text.isNotEmpty
                                            ? phoneController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.phone ??
                                                "",
                                        bio: bioController.text.isNotEmpty
                                            ? bioController.text
                                            : MyBloc.get(context)
                                                    .usermodel
                                                    ?.bio ??
                                                "",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: nameController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter name',
                      hintText: MyBloc.get(context).usermodel?.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.info_outline,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: bioController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter bio',
                      hintText: MyBloc.get(context).usermodel?.bio,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (MyBloc.get(context).usermodel?.type != 'client')
                      CustomTextFoemaFaildEditProfail(
                        prefixIcon: const Icon(
                          Icons.work,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        nameController: jodController,
                        onSaved: (value) {
                          nameController.text == value;
                        },
                        text: 'Pleas enter jod',
                        hintText: 'Teather',
                      ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.phone,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: phoneController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter phone',
                      hintText: MyBloc.get(context).usermodel?.phone,
                      // hintText: AdminBloc.get(context).usermodel?.phone,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     DropdownButton(
                      items: Bloc.catroies.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child:  Text(
                            '${value['text']}',
                            style: const TextStyle(color: primarycolor),
                          ),
                        );
                      }).toList(),
                      onChanged: (selectedAccountType) {
                        print('$selectedAccountType');
                        setState(() {
                          selectedType = selectedAccountType;
                        });
                      },
                      value: selectedType,
                      isExpanded: false,
                      hint: const Text(
                        'Choose Your Category',
                        style: TextStyle(color: primarycolor)),
                      ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                   
                    CustomButton(
                      onTap: () {
                        MyBloc.get(context).udateUserData(
                          name: nameController.text.isNotEmpty
                              ? nameController.text
                              : MyBloc.get(context).usermodel?.name ?? "",
                          phone: phoneController.text.isNotEmpty
                              ? phoneController.text
                              : MyBloc.get(context).usermodel?.phone ?? "",
                          bio: bioController.text.isNotEmpty
                              ? bioController.text
                              : MyBloc.get(context).usermodel?.bio ?? "",
                        );
                              MyBloc.get(context)
                            .choosemycategory(selectedType['text']);
                  
                        Navigator.pop(context);
                      },
                      text: "Save",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
