import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc_state.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer/owner_Avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/Model/usermodel.dart';
import '../../../../../../../Login/presentaion/views/login_screen.dart';

class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    Key? key,
    required this.isCollapsed,
    required this.model,
  }) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state is ScafullsignOut) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.nameKey, (route) => false);
        }
      },
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isCollapsed ? 74 : 100,
          width: double.infinity,
          padding: isCollapsed
              ? const EdgeInsets.symmetric(horizontal: 10)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: isCollapsed
              ? IntrinsicHeight(
                  child: Row(
                    children: [
                      const Expanded(
                        child: OwnerAvatar(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // name
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${model.name}',
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            // username
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${model.email}',
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () async {
                            await AdminBloc.get(context).signOut();
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    const Expanded(
                      child: OwnerAvatar(),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () async {
                          await AdminBloc.get(context).signOut();
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
