import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Nvdrawer.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer:  Drawer(
          child: Nvdrawer(),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading:
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon:SvgPicture.asset("assets/menu.svg"),

            );
          }),
          title: Container(
            height: 45,
            width: 280,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 3.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: 5,
              ),
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  const [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'We are final-year students studying ',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'seguisb',
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text(
                'Computer Science at Akhbar Elyoum Academy.',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'seguisb',
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text(
                'We developed this app with the aim of helping',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'seguisb',
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text(
                'to provide early disease detection.',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'seguisb',
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}