import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        return Scaffold(
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
            title: const Text(
              'My profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: 'seguisb',
                color: Color(0xff03045E),
              ),
            ),
          ),
          body: FutureBuilder<DocumentSnapshot>(
             future: users.doc(user!.uid).get(),
               builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot)
               {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
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
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
        );
      }
    else if ( user?.displayName == null )
    {
      return Scaffold(
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
          title: const Text(
            'My profile',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'seguisb',
              color: Color(0xff03045E),
            ),
          ),
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
                              minimumSize: const Size(300, 50),
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context,'/intro');

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
        );
    }
    else
      {
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
            title: const Text(
              'My profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: 'seguisb',
                color: Color(0xff03045E),
              ),
            ),
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
                            style: const TextStyle(
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
            ),
          );
      }
  }
}
