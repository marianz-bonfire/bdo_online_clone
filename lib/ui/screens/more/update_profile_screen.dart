import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/more/add_remove_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/show_hide_account_screen.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String routeName = 'UpdateProfileScreen';

  const UpdateProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Mobile Number', style: TextStyle(fontSize: 12,),),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      Text(
                        '09565392933',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Email Address', style: TextStyle(fontSize: 12,),),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      Text(
                        'marianz.tarsier@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('If both contact information are not updated, call BDO Contact Center at (+632) 8631-8000 for assistance.', style: TextStyle(fontSize: 12,), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
