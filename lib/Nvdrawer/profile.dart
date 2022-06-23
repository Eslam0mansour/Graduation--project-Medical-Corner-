import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/introduction/introduction.dart';
import 'Nvdrawer.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
   late final user  = FirebaseAuth.instance.currentUser;
   late final email = FirebaseAuth.instance.currentUser?.email;
   late final datea = FirebaseAuth.instance.currentUser?.metadata.creationTime;
   late final _name = FirebaseAuth.instance.currentUser?.displayName;
   late final photo = FirebaseAuth.instance.currentUser?.photoURL;

   @override
  Widget build(BuildContext context) {
     CollectionReference users = FirebaseFirestore.instance.collection('users');

     if ( user?.displayName == null && email != null)
      {
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
            body: FutureBuilder<DocumentSnapshot>(
             future: users.doc(user!.uid).get(),
               builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot)
               {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        email!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data['name']}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data['gender']}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Created time',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Created in: ${DateFormat('MM/dd/yyyy').format(datea!)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'seguisb',

                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Text("loading");
          },
        ),
          ),
        );
      }
    else if ( user?.displayName == null )
    {
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
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children:   [
                        const Text(
                          'You need to sign in ',
                          style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          color: Color(0xff03045E),
                          size: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 50),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IntroductionPage() ,
                              ),
                            );
                          },
                          child: const Text(
                            'sign in now ',
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    else
      {
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
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children:  [
                          CircleAvatar(
                            backgroundImage: NetworkImage(photo!),
                            radius: 90,
                          ),
                          Text(
                            _name!,
                            style: TextStyle(
                              fontSize: 38,
                              color: Colors.grey,
                              fontFamily: 'seguisb',

                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Personal information',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'seguisb',

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'seguisb',

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                       email!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'seguisb',

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Created time',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'seguisb',

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Created in: ${DateFormat('MM/dd/yyyy').format(datea!)}",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'seguisb',

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
  }
}
