import 'package:flutter/material.dart';
import 'package:intro_example/Nvdrawer/Contactus.dart';
import 'package:intro_example/Nvdrawer/aboutus.dart';
import 'package:intro_example/screens/home.dart';
import 'package:intro_example/screens/introduction/introduction.dart';
import 'package:intro_example/Nvdrawer/profile.dart';

import '../services/auth.dart';

class Nvdrawer extends StatelessWidget {
   Nvdrawer({Key? key}) : super(key: key);
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff03045E),
      child:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Medical Corner',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffF2F2F2),
                      fontFamily: 'seguisb',
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(
                          Icons.close,
                        color: Colors.white,
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 20  ,
              ),
              const Divider(
                height: 10,
                thickness: 1,
                endIndent: 20,
                indent: 5,
                color: Colors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Profile',
                      style:
                      TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w500 ,
                        fontFamily: 'seguisb',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.home_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Home',
                      style:
                      TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w500 ,
                        fontFamily: 'seguisb',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Aboutus() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.info_outline,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'About us',
                      style:
                      TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w500 ,
                        fontFamily: 'seguisb',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contactus() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.contact_page_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Contact us',
                      style:
                      TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w500 ,
                        fontFamily: 'seguisb',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              InkWell(
                onTap: () async {
                  authBase.logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroductionPage() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Log out',
                      style:
                      TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w500 ,
                        fontFamily: 'seguisb',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
