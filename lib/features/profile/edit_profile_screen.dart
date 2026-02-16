import 'package:image_picker/image_picker.dart';
import 'package:securedtrade/config/path_config.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "Edit Profile"),
      body: Column(
        children: [
          SizedBox(height: 15, width: 0),
          buildProfileItem(
            title: "Nickname",
            value: "Manish Negi",
            context: context,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Divider(color: AppColors.grey.withOpacity(.2)),
          ),
          buildProfileItem(
            title: "UUID",
            value: "jogciqckipf9mgwsb8bfagrx1a",
            context: context,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Divider(color: AppColors.grey.withOpacity(.2)),
          ),
          buildProfileItem(
            title: "Email",
            value: "maxedlogicweb@gmail.com",
            context: context,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Divider(color: AppColors.grey.withOpacity(.2)),
          ),
          buildProfileItem(title: "Avatar", value: "image", context: context),
        ],
      ),
    );
  }

  buildProfileItem({
    required String title,
    required String value,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (value != "image") {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return EditProfileDialog();
              },
            );
          } else {
            ImagePicker.platform.getImageFromSource(
              source: ImageSource.gallery,
            );
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Text(
                title,
                style: getPlusJakartaSansTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              //Spacer(),
              value == "image"
                  ? Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ClipOval(
                            child: Image.network(
                              fit: BoxFit.cover,
                              "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            value,
                            style: getPlusJakartaSansTextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black.withOpacity(.7),
                            ),
                          ),
                          SizedBox(height: 0, width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 19,
                              color: AppColors.black.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({super.key});

  dialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: new BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              SizedBox(height: 5, width: 0),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: SizedBox(
                      height: 24,
                      child: Image.network(AppStrings.iconCancel),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10, width: 0),
              Text(
                "Change Nickname",
                style: getPlusJakartaSansTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 15, width: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerBg(
                  height: 60,
                  radius: 10,
                  backgroundColor: Colors.blue.withOpacity(.04),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        autofocus: true,
                        controller: TextEditingController(text: "Manish Negi"),
                        cursorHeight: 20,
                        style: getOutfitTextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: ContainerBg(
                        radius: 10,
                        backgroundColor: Colors.transparent,
                        borderColor: AppColors.black.withOpacity(.6),
                        bWidth: 1,
                        height: 50,
                        width: UIHelpers.screenSize(context).width / 3.5,
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: getOutfitTextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppButton(text: "Confirm", onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 10,
      ), // reduce horizontal padding

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
