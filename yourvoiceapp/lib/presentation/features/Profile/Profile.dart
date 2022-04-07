import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbprint/presentation/controllers/update_profile_controller.dart';


import '../../../core/utils/consts.dart';
import '../../../core/widgets/custompaintbutton.dart';

import '../../controllers/user_controller.dart';
import '../Settings/Setting.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {

    File? _imageFile;
  final UserController controller = Get.find<UserController>();
   UpdateProfileController updateController = Get.put(UpdateProfileController());

 Future _getImage(ImageSource imageSource) async {
    try{
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => _imageFile == imageTemp);
    }on PlatformException catch(e){
      print("Failed to pick image : $e");
    }
    // Closes the bottom sheet
    Navigator.pop(context);
  }

  void openImagePickerModal(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    print('Image Picker Modal Called');
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).backgroundColor,
              color: isDark ? scaffoldColorDark : scaffoldColorlight,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
            ),
            height: MediaQuery.of(context).size.height / 8,
         //   padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        textColor: isDark ? bluetext : textfieldcolor,
                        child: const Text('Take a Picture'),
                        onPressed: () {
                          _getImage(ImageSource.camera);
                        },
                      ),
                      Icon(Icons.camera_alt_rounded, color: thumbprintblue)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        textColor: isDark ? bluetext : textfieldcolor,
                        child: const Text('Pick Image from Gallery'),
                        onPressed: () {
                          _getImage( ImageSource.gallery);
                        },
                      ),
                      Icon(Icons.photo_album, color: thumbprintblue)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  final name = TextEditingController();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? scaffoldColorDark : scaffoldColorlight,
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/back.png',
            color: isDark ? generaltextColor : lightthemetextColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Settings()));
                },
                child: SvgPicture.asset("assets/icons/union.svg")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  openImagePickerModal(context);
                },
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF91ABBD),
                        image: DecorationImage(
                          image: _imageFile != null
                              ? FileImage(_imageFile!)
                              : const AssetImage('assets/icons/sidebar_girl.png') as ImageProvider  ,
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Stack(
                        children: const [
                          Center(
                            child: Icon(
                              Icons.add_a_photo_sharp,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _imageFile != null
                ? const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(child: CustomPaintButton()),
                  )
                : Container(
                    height: 1,
                  ),
            controller.obx((data) =>
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: Center(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Full Name'),
                          subtitle: Text('${data!.data!.name}'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          title: const Text('Phone Number'),
                          subtitle: Text('${data.data!.phone}'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          title: const Text('Email address'),
                          subtitle: Text('${data.data!.email}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: isDark
                                      ? const Color(0xFF0D243C)
                                      : Colors.white,
                                  elevation: 20,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20.0)),
                                  ),
                                  builder: (BuildContext bc) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: isDark
                                              ? const Color(0xFF0D243C)
                                              : Colors.white,
                                          borderRadius:
                                          const BorderRadius.vertical(
                                              top: Radius.circular(
                                                  20.0))),
                                      height: double.maxFinite,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 10.h),
                                            Center(
                                              child: Divider(
                                                color: isDark
                                                    ? specialtext
                                                    : black,
                                                thickness: 4,
                                                indent: 145.0,
                                                endIndent: 145.0,
                                              ),
                                            ),
                                            SizedBox(height: 38.h),
                                            Row(
                                              children: [
                                                Text(
                                                  "Update Profile",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: isDark
                                                          ? generaltextColor
                                                          : textfieldcolor,
                                                      fontFamily:
                                                      'Roboto',
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                            TextFormField(
                                              controller: name,
                                              decoration: InputDecoration(
                                                hintTextDirection:
                                                TextDirection.ltr,
                                                enabled: true,
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        width: 7.0.w,
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                hintText: 'Carol Black',
                                                hintStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: isDark
                                                        ? grey
                                                        : grey,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                hintTextDirection:
                                                TextDirection.ltr,
                                                enabled: true,
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        width: 7.0.w,
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                hintText:
                                                '(234) 090-9999-999',
                                                hintStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: isDark
                                                        ? grey
                                                        : grey,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: email,
                                              decoration: InputDecoration(
                                                hintTextDirection:
                                                TextDirection.ltr,
                                                enabled: true,
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15.r),
                                                    borderSide: BorderSide(
                                                        width: 7.0.w,
                                                        color: isDark
                                                            ? const Color(
                                                            0xFFF8F8F8)
                                                            : bluetext,
                                                        style: BorderStyle
                                                            .solid)),
                                                hintText:
                                                'Voters Identification Number',
                                                hintStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: isDark
                                                        ? grey
                                                        : grey,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 30),
                                              child: Center(
                                                child: SizedBox(
                                                  width: 252.w,
                                                  height: 45.h,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      updateController
                                                          .updateProfile(
                                                          name.text
                                                              .toString(),
                                                          email.text
                                                              .toString(),
                                                          );
                                                    },
                                                    child: Text(
                                                      'Update',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontSize: 14.sp,
                                                          fontFamily:
                                                          'Roboto',
                                                          fontWeight:
                                                          FontWeight
                                                              .w400),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                      buttonColor,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              14.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              onError: (err)=>Center(
                child: Text(
                  err.toString(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
