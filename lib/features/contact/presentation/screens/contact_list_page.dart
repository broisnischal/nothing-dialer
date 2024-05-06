import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Contact> contacts = [];

  Future<List<Contact>> getContacts() async {
    final contacts = await FlutterContacts.getContacts(withProperties: true);
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
      await FlutterContacts.requestPermission();

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: FutureBuilder<List<Contact>>(
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
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
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
      // body: Column(
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         setState(() {
      //           reqContact = ContactsService.getContacts();
      //         });
      //       },
      //       child: const Text('Load Contact'),
      //     ),
      //     Expanded(
      //       child: FutureBuilder(
      //         future: reqContact,
      //         builder: (context, snp) {
      //           if (snp.connectionState == ConnectionState.done) {
      //             final contacts = snp.data;

      //             if (contacts != null) {
      //               return ListView.builder(
      //                 shrinkWrap: true,
      //                 itemCount: 1,
      //                 itemBuilder: (context, index) {
      //                   final contact = contacts[index];

      //                   return ListTile(
      //                     title: Text(' ${contact.displayName}'),
      //                     subtitle: Text(
      //                       contact.phones?.single.value ?? 'not found',
      //                     ),
      //                   );
      //                 },
      //               );
      //             }
      //             return Container();
      //           }
      //           return Container();
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
