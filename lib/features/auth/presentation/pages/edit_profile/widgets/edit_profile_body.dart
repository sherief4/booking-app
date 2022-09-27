import 'dart:io';

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/auth/presentation/pages/edit_profile/widgets/edit_field_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          Navigator.of(context).pop();
        }
        if (state is UpdateProfileErrorState) {
          showSnackBar(
            context: context,
            text: state.error,
            textColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        final picker = ImagePicker();
        nameController.text = AuthBloc.get(context).data!.user!.name!;
        emailController.text = AuthBloc.get(context).data!.user!.email!;

        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (state is AuthLoadingState)
                const VerticalSpace(
                  1.0,
                ),
              if (state is AuthLoadingState) const LinearProgressIndicator(),
              const VerticalSpace(
               4.0,
              ),
              Center(
                child: SizedBox(
                  width: 124.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 110.0,
                        width: 110.0,
                        child: state is ChooseImageSuccessState
                            ? Image(image: FileImage(state.image))
                            : const Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://static.wikia.nocookie.net/thelastofus/images/5/50/Ellie_Jackson_shoulder_infobox.jpg/revision/latest?cb=20201121211251'),
                              ),
                      ),
                      CircleAvatar(
                        backgroundColor: mainColor,
                        child: IconButton(
                          onPressed: () async {
                            final pickedFile = await pickImage(picker: picker);
                            if (pickedFile != null) {
                              // ignore: use_build_context_synchronously
                              AuthBloc.get(context).add(ChooseProfileImageEvent(
                                  image: File(pickedFile.path)));
                            }
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpace(
                2.0,
              ),
              EditFieldTile(
                title: 'User Name',
                controller: nameController,
              ),
              EditFieldTile(
                title: 'Email',
                controller: emailController,
              ),
              const VerticalSpace(
                2.0,
              ),
              DefaultButton(
                onPressed: () {
                  AuthBloc.get(context).add(UpdateProfileEvent(
                      token: AuthBloc.get(context).data!.user!.token!,
                      email: emailController.text,
                      name: nameController.text,
                      image: File('')));
                },
                color: mainColor,
                textColor: Colors.white,
                text: 'Update',
              ),
            ],
          ),
        );
      },
    );
  }

  Future<XFile?> pickImage({required ImagePicker picker}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
}
