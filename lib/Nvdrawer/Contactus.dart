import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Nvdrawer.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:    [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Got any questions?',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'seguisb',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'You can send us a message regarding any',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.grey,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'general information.',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'seguisb',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType:TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey[350],
                  height: 200,
                  child: const TextField(
                    style: TextStyle(
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      hintText: 'problem',
                    ),
                    maxLines: 10,
                    keyboardType: TextInputType.emailAddress,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}