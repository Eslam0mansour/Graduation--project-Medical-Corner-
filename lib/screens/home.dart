import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_example/screens/Predicition/Diabetes_screen.dart';
import '../News/screens/homePage.dart';
import 'Classification/Pneumonia_screen.dart';
import '../Nvdrawer/Nvdrawer.dart';
import 'Classification/brain_tumour.dart';
import 'Predicition/Heart_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: Nvdrawer(),
        ),
        body: Container(
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/22.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      width: double.infinity,
                      height: 86,
                      child: Row(
                        children: [
                          Builder(builder: (context) {
                            return IconButton(
                              onPressed: () => Scaffold.of(context).openDrawer(),
                              icon:SvgPicture.asset("assets/menu.svg"),

                            );
                          }),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 48,
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
                                    color: Color(0xff03045E),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: Icon(
                              Icons.notifications_none,
                              color: Color(0xff03045E),
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30
                        ),
                        child: Text(
                          'Disease Detection',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff03045E),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PneumoniaScreen() ,
                                  ),);
                                },
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'images/a.jpg'
                                        ),
                                        height: 326.0,
                                        width: 250.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: 250.0,
                                        color: Colors.teal,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: const Text(
                                          'Pneumonia',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => BrainScreen() ,
                                  ),);

                                },
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'images/s.jpg'
                                        ),
                                        height: 326.0,
                                        width: 250.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: 250.0,
                                        color: Colors.teal,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: const Text(
                                          'Brain Tumour',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 30
                        ),
                        child: Text(
                          'Disease Prediction',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff03045E),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => HeartDisease() ,
                                  ),);
                                },
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'images/1.jpg'
                                        ),
                                        height: 326.0,
                                        width: 250.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: 250.0,
                                        color: Colors.teal,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: const Text(
                                          'Heart Disease',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,

                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => DiabetesScreen() ,
                                  ),);
                                },
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'images/2.jpg'
                                        ),
                                        height: 326.0,
                                        width: 250.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: 250.0,
                                        color: Colors.teal,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: const Text(
                                          'Diabetes',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(300,60),
                            primary: Colors.transparent,
                          ),
                          onPressed: ()  {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage() ,
                              ),
                            );
                          },
                          child: const Text(
                            'Top Health News',
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
