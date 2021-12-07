import 'package:flutter/material.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primary.withOpacity(0.1),
              height: 210,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text('My Account',
                        style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 18.0,),),
                        const SizedBox(height: 32,),
                        const CircleAvatar(child: Icon(Icons.account_circle, color:Colors.grey, size: 60,), backgroundColor: Colors.white, radius: 40,),
                        SizedBox(height: 10,),
                        Text('Doğkan Saraç', style: kAppBarTitleTextStyle)
                      ],
                    ),
                  ),
                ],
              ),

            ),
            Row(
              children: [
                Expanded(
                    child:(Row(children: [
                      Icon(Icons.favorite_border),
                      Text('My Favorites')
                    ],))
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
