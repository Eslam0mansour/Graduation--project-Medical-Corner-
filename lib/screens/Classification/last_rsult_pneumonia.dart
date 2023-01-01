import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class lastresult extends StatefulWidget {
  const lastresult({Key? key}) : super(key: key);

  @override
  _lastresult createState() => _lastresult();
}

class _lastresult extends State<lastresult> {
   ScrollController? _scrollController;
  var top = 0.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid;
  String? _userImageUrl;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      setState(() {});
    });
    getData();
  }

  void getData() async {
    User? user = _auth.currentUser;
    _uid = user?.uid;
    // to get Data from fire base

    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.
    collection('users').doc(_uid).get();
    if (userDoc == null) {
      return;
    } else {
      setState(() {
        _userImageUrl = userDoc.get('imageurl');
      });
    }
    // print("name $_name");
  }

  @override
  Widget build(BuildContext context) {
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
          'My last Result',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: 'seguisb',
            color: Color(0xff03045E),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.network(
            _userImageUrl??
            'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
      ),
    );
  }
}