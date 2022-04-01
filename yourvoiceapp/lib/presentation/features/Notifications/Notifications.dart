import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter_slidable/flutter_slidable.dart';


import '../../../core/utils/consts.dart';
import '../../controllers/notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);


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
              'Notifications',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '7 inbox',
                  style: GoogleFonts.workSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDark ? specialtext : headingColorLight),
                ),
                IconButton(
                    iconSize: 18,
                    enableFeedback: false,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.delete_simple,
                      size: 18,
                      color: isDark ? specialblue : black,
                    ))
              ],
            )
          ],
        ),
      ),
      body: controller.obx((data)=>
          ListView.builder(
            itemCount: data!.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20),
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              flex: 2,
                              onPressed: (_) {
                                showModalBottomSheet(
                                    backgroundColor: isDark
                                        ? const Color(0xFF0D243C)
                                        : Colors.white,
                                    barrierColor: Colors.black87,
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.vertical(
                                          top: Radius.circular(
                                              40.0)),
                                    ),
                                    builder: (BuildContext bc) {
                                      return SizedBox(
                                        height: double.maxFinite,
                                        child: Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .start,
                                              children: [
                                                Center(
                                                  child: Divider(
                                                    color: black,
                                                    thickness: 4,
                                                    indent: 140.0,
                                                    endIndent: 140.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 50,
                                                      backgroundColor:
                                                      isDark
                                                          ? specialblue
                                                          : grey,
                                                      child: const Icon(
                                                        CupertinoIcons
                                                            .delete_solid,
                                                        size: 50,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                Center(
                                                    child: SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        'Delete Selected?',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            color: isDark
                                                                ? Colors
                                                                .white
                                                                : const Color(
                                                                0xFF6B6B6B)),
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                    child: SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        'Once you delete notification. you can’t undo it.',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: isDark
                                                                ? Colors
                                                                .white
                                                                : const Color(
                                                                0xFF6B6B6B)),
                                                      ),
                                                    )),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(30),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      const NotificationScreen()));
                                                        },
                                                        child:
                                                        Container(
                                                          height: 50,
                                                          width: 120,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: isDark
                                                                      ? grey
                                                                      : black),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  12)),
                                                          child: const Center(
                                                            child: Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 30,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                        Container(
                                                          height: 50,
                                                          width: 120,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: isDark
                                                                      ? grey
                                                                      : black),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  12)),
                                                          child: const Center(
                                                            child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  18),
                                                            ),
                                                          ),
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
                                    }); // OTP code resend
                              },
                              backgroundColor: const Color(0xFF96C0FF),
                              foregroundColor: Colors.white,
                              icon: CupertinoIcons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (index % 5 == 4)
                                    ? red
                                    : (index % 4 == 3)
                                    ? grey
                                    : (index % 3 == 2)
                                    ? lightblue1
                                    : (index % 2 == 1)
                                    ? green
                                    : orange,
                              ),
                              child: Icon(
                                CupertinoIcons.star_fill,
                                color: white,
                                size: 15,
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10, top: 10),
                                  child: SizedBox(
                                    width: 250,
                                    child: Text(
                                      data!.data[index].content,
                                      maxLines: 3,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child: Text(data.data[index].created_at),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: black,
                    )
                  ],
                ),
              );
            },
          ),
        onError: (err)=>Center(
          child: Text(
            "Failed to Load",
            style: GoogleFonts.roboto(
              color: isDark ? white : black,
              fontSize: 25,
            ),
          ),
        )
      )
    );
  }

   doNothing(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    showModalBottomSheet(
        backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
        barrierColor: Colors.black87,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
        ),
        builder: (BuildContext bc) {
          return SizedBox(
            height: double.maxFinite,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Divider(
                        color: black,
                        thickness: 4,
                        indent: 140.0,
                        endIndent: 140.0,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: isDark ? specialblue : grey,
                          child: const Icon(
                            CupertinoIcons.delete_solid,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: SizedBox(
                      width: 300,
                      child: Text(
                        'Delete Selected?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: SizedBox(
                      width: 200,
                      child: Text(
                        'Once you delete notification. you can’t undo it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NotificationScreen()));
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: isDark ? grey : black),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: isDark ? grey : black),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
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
        }); // OTP code resend
  }
}
