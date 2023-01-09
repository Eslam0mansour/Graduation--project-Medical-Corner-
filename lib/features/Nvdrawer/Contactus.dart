
import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded , size: 30, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:    [
              const SizedBox(
                height: 50,
              ),
              const Center(
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
              const SizedBox(
                height: 30,
              ),
              const Center(
                child:  Text(
                  'You can send us a message regarding any',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.grey,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'general information.',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Text(
                  'Email',
                  style:  TextStyle(
                    fontSize: 27,
                    fontFamily: 'seguisb',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
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
              const SizedBox(
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
              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      );
  }
}