import 'package:diary/utils/colours.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            children: [
              SizedBox(height: 40,),
             const  CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/pics.jpg'),
                radius: 80,
              ),
              const Text('Olajide Samuel' ,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 25),),
              const Text('Olasamuel594@gmail.com',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500, fontSize: 15),),
              const Text('+2349063705093',
                                          style: TextStyle(
                                             fontWeight: FontWeight.w500, fontSize: 15),),
                                             SizedBox(height: 20,),
Column(
  children: [
    GestureDetector(
      onTap: (() {
          
      }),
      child: Center(
          child: Center(
            child: Row(
              children: [
                Icon(Icons.settings, size: 20, color: AppColor.primary,),
                SizedBox(width: 10),
                Text(' Settings',
                                          style: TextStyle( color: AppColor.primary,
                                              fontWeight: FontWeight.w400, fontSize: 20))
              ],
            ),
          ),
      ),
    ) ,
    SizedBox(height: 20,),
    GestureDetector(
      onTap: (() {
          
      }),
      child: Center(
          child: Center(
            child: Row(
              children: [
                Icon(Icons.location_on, size: 20, color: AppColor.primary,),
                SizedBox(width: 10),
                Text(' Address',
                                          style: TextStyle( color: AppColor.primary,
                                              fontWeight: FontWeight.w400, fontSize: 20))
              ],
            ),
          ),
      ),
    ) ,
    SizedBox(height: 20,),
    GestureDetector(
      onTap: (() {
          
      }),
      child: Center(
          child: Center(
            child: Row(
              children: [
                Icon(Icons.visibility, size: 20, color: AppColor.primary,),
                SizedBox(width: 10),
                Text('Change Password',
                                          style: TextStyle( color: AppColor.primary,
                                              fontWeight: FontWeight.w400, fontSize: 20))
              ],
            ),
          ),
      ),
    ) ,
    SizedBox(height: 20,),
    GestureDetector(
      onTap: (() {
          
      }),
      child: Center(
          child: Center(
            child: Row(
              children: [
                Icon(Icons.policy, size: 20, color: AppColor.primary,),
                SizedBox(width: 10),
                Text(' Privacy and Policy',
                                          style: TextStyle( color: AppColor.primary,
                                              fontWeight: FontWeight.w400, fontSize: 20))
              ],
            ),
          ),
      ),
    ) ,
    SizedBox(height: 20,),

    GestureDetector(
      onTap: (() {
          
      }),
      child: Center(
          child: Center(
            child: Row(
              children: [
                Icon(Icons.logout, size: 20, color: AppColor.primary,),
                SizedBox(width: 10),
                Text(' Log Out',
                                          style: TextStyle( color: AppColor.primary,
                                              fontWeight: FontWeight.w400, fontSize: 20))
              ],
            ),
          ),
      ),
    ) ,
    SizedBox(height: 20,),
  ],
)

            ],
          ),
        ),
    );
  }
}