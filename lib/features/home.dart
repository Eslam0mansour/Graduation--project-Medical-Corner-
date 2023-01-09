import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_example/features/Nvdrawer/Nvdrawer.dart';
import 'package:intro_example/features/custom%20widgets/Disease_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        drawer: Drawer(
          child: Nvdrawer(),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Colors.transparent,
           centerTitle: true,
          title:  SizedBox(
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
                  prefixIcon: const Icon(
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
          actions: const [
             Padding(
              padding: EdgeInsets.only(
                right: 5,
              ),
              child: Icon(
                Icons.notifications_none,
                color: Color(0xff03045E),
                size: 35,
              ),
            ),
          ],
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon:SvgPicture.asset("assets/menu.svg"),

            );
          }),
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
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Disease Detection',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff03045E),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,'/p');
                            },
                            child: DiseaseCard(
                              image: 'a.jpg',
                              diseaseName: 'Pneumonia',
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,'/b');
                            },
                            child: DiseaseCard(
                              image: 's.jpg',
                              diseaseName: 'Brain Tumour',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Disease Prediction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff03045E),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,'/h');
                            },
                            child: DiseaseCard(
                              image: '1.jpg',
                              diseaseName: 'Heart Disease',
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,'/d');
                            },
                            child: DiseaseCard(
                              image: '2.jpg',
                              diseaseName: 'Diabetes',
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
                          minimumSize: const Size(300,60),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: ()  {
                          Navigator.pushNamed(context,'/n');
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
                ),
              ),
            ),
          ),
        ),
      );
  }
}
