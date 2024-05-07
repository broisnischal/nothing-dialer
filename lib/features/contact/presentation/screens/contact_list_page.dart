import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nothing_dialer/core/constants/color_constants.dart';
import 'package:nothing_dialer/core/constants/font_constants.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage(name: 'ContactListPageRoute')
class ContactPageList extends StatefulWidget {
  const ContactPageList({super.key});

  @override
  State<ContactPageList> createState() => _ContactPageListState();
}

class _ContactPageListState extends State<ContactPageList> {
  @override
  void initState() {
    super.initState();
    _askPermissions();
    enterFullScreenButKeepTopOverlay();
  }

  void enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  void enterFullScreenButKeepTopOverlay() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Contact> contacts = [];

  PermissionStatus? status;

  Future<List<Contact>> getContacts() async {
    final contacts = await FlutterContacts.getContacts(
      withProperties: true,
      withThumbnail: true,
      deduplicateProperties: false,
    );
    return contacts;
  }

  Future<void> _askPermissions() async {
    final permissionStatus = await _getContactPermission();

    if (permissionStatus != PermissionStatus.granted) {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    final permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      final permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withAlpha(20),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              // color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawerEdgeDragWidth: 100.w,
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Item 1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Item 2',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          margin: EdgeInsets.fromLTRB(0.w, 0, 0.w, 10.h),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            // decoration: BoxDecoration(color: Colors.grey.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    // color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    // color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(onPressed: () {}, icon: const SizedBox.shrink()),
                IconButton(
                  icon: const Icon(
                    Icons.print,
                    // color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.people,
                    // color: Colors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      // barrierColor: Colors.white.withOpacity(0.1),
                      isScrollControlled: true,
                      isDismissible: true,
                      // barrierLabel: 'Barrier',
                      // scrollControlDisabledMaxHeightRatio: 0.5,
                      useSafeArea: true,
                      backgroundColor: Colors.black,
                      constraints: BoxConstraints(
                        // maxHeight: MediaQuery.of(context).size.height * 0.7,
                        // maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                        minHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: const Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.copy),
                                title: Text('Copy Link'),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.copy),
                                title: Text('Copy Link'),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.copy),
                                title: Text('Copy Link'),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.add),
      // ),
      body: status != null && status != PermissionStatus.granted
          ? ElevatedButton(
              onPressed: _askPermissions,
              child: Text('Allow Permission $status'),
            )
          : FutureBuilder<List<Contact>>(
              future: getContacts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  contacts = snapshot.data ?? [];

                  log(contacts.length.toString());
                  return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return contacts.isEmpty
                          ? const Text('')
                          : ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(
                                contact.displayName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontConstants.nothing,
                                ),
                              ),
                              subtitle: Text(
                                contact.phones.first.number,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: ColorConst.whiteColor,
                                ),
                              ),
                            );
                    },
                  );
                }
              },
            ),
    );
  }
}
