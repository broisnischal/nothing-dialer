import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nothing_dialer/common/widgets/custom_app_bar.dart';
import 'package:nothing_dialer/core/constants/font_constants.dart';

@RoutePage(name: 'ContactListPageRoute')
class ContactPageList extends StatelessWidget {
  const ContactPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Contacts',
      ),
      body: Text(
        'contact Page',
        style: TextStyle(fontFamily: FontConstants.nothing, fontSize: 20.sp),
      ),
    );
  }
}
