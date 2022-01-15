import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';

class AccountDeletePP extends StatelessWidget{
   const AccountDeletePP({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material( 
       
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               SizedBox(height: 20,),
                OutlinedButton(
                  onPressed: () async {
                   
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Deactivate Account',
                      style: kButtonDarkTextStyle,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              SizedBox(height: 20,),
              OutlinedButton(
              onPressed: () async {
                
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Delete Account',
                  style: kButtonDarkTextStyle,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
                
                 
              ],
            )),
      
    );
  }
}