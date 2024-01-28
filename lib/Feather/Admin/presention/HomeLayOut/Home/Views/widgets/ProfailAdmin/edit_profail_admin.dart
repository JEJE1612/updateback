import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc_state.dart';

import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomTextFoemaFaildEditProfail.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfailAdmin extends StatefulWidget {
  const EditProfailAdmin({super.key});

  @override
  State<EditProfailAdmin> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfailAdmin> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController jodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var usermodel = AdminBloc.get(context).usermodel;
        var imageProfail = AdminBloc.get(context).image;
        var imagecover = AdminBloc.get(context).cover;

        var bloc = AdminBloc.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                            ),
                            Text(
                              "Edit Profile",
                              style: Styles.textStyle18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomLeft,
                      children: [
                        if (state is LodingUdateAdminData)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        Card(
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          elevation: 0.0,
                          child: InkWell(
                            onTap: () {
                              bloc.getCover();
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
                              bloc.getImageProfail();
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
                    const SizedBox(
                      height: 60,
                    ),
                    if (AdminBloc.get(context).image != null ||
                        AdminBloc.get(context).cover != null)
                      Row(
                        children: [
                          if (AdminBloc.get(context).image != null)
                            Expanded(
                              child: Column(
                                children: [
                                  CustomButton(
                                    text: "image",
                                    onTap: () {
                                      AdminBloc.get(context).uploadprofialImage(
                                        name: nameController.text.isNotEmpty
                                            ? nameController.text
                                            : AdminBloc.get(context)
                                                    .usermodel
                                                    ?.name ??
                                                "",
                                        phone: phoneController.text.isNotEmpty
                                            ? phoneController.text
                                            : AdminBloc.get(context)
                                                    .usermodel
                                                    ?.phone ??
                                                "",
                                        bio: bioController.text.isNotEmpty
                                            ? bioController.text
                                            : AdminBloc.get(context)
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
                          if (AdminBloc.get(context).cover != null)
                            Expanded(
                              child: Column(
                                children: [
                                  CustomButton(
                                    text: "cover",
                                    onTap: () {
                                      AdminBloc.get(context).uploadCoverImage(
                                        name: nameController.text.isNotEmpty
                                            ? nameController.text
                                            : AdminBloc.get(context)
                                                    .usermodel
                                                    ?.name ??
                                                "",
                                        phone: phoneController.text.isNotEmpty
                                            ? phoneController.text
                                            : AdminBloc.get(context)
                                                    .usermodel
                                                    ?.phone ??
                                                "",
                                        bio: bioController.text.isNotEmpty
                                            ? bioController.text
                                            : AdminBloc.get(context)
                                                    .usermodel
                                                    ?.bio ??
                                                "",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          if (state is LodingUploadcoverAdminState)
                            const LinearProgressIndicator(),
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
                      hintText: AdminBloc.get(context).usermodel?.name,
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
                      hintText: AdminBloc.get(context).usermodel?.bio,
                    ),
                    const SizedBox(
                      height: 20,
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
                      text: 'Pleas enter Jod',
                      hintText: AdminBloc.get(context).usermodel?.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        AdminBloc.get(context).udateAdminData(
                          name: nameController.text.isNotEmpty
                              ? nameController.text
                              : AdminBloc.get(context).usermodel?.name ?? "",
                          phone: phoneController.text.isNotEmpty
                              ? phoneController.text
                              : AdminBloc.get(context).usermodel?.phone ?? "",
                          bio: bioController.text.isNotEmpty
                              ? bioController.text
                              : AdminBloc.get(context).usermodel?.bio ?? "",
                        );
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
