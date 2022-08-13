import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_example/News/shared/cubit/cuoit.dart';
import 'package:intro_example/News/shared/cubit/states.dart';
import 'package:intro_example/components/open_close_Text_box.dart';
import 'package:intro_example/screens/Classification/result_Pneumonia.dart';
import '../../Nvdrawer/Nvdrawer.dart';
import 'last_rsult_pneumonia.dart';
class PneumoniaScreen extends StatelessWidget {
  const PneumoniaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit,AppState>(
      listener: ( context, state) { },
      builder: ( context,  state) {
        return Scaffold(
          drawer:  Drawer(
            child: Nvdrawer(),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading:Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon:SvgPicture.asset("assets/menu.svg"),
              );
            }),
            title: SizedBox(
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
                    prefixIcon: const Icon(
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
            actions: const [Padding(
              padding: EdgeInsets.only(
                right: 5,
              ),
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 35,
              ),
            ),],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                   ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'Pneumonia',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'seguisb',
                            color: Color(0xff03045E),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'seguisb',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const Text(
                          'Pneumonia is an air infection that inflames the air sacs in one or both lungs. The air sacs may fill with fluid or pus, causing cough, phlegm or pus, fever, chills, and difficulty breathing.',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'seguisb',
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10
                              ),
                              child: OpenCloseTextBox(
                                text: '- Chest pain when you breathe orcough \n- Confusion or changes in mental \n- awareness \n- Cough \n- Fatigue\n- Lower than normal body temperature\n- Nausea, vomiting or diarrhea\n- Shortness of breath',
                                title: 'Symptoms',
                              ),
                            ),

                            //       'Causes',
                            //   child: buildText2(
                            //         'Many germs can cause pneumonia. The'
                            //             'most common are bacteria and viruses in'
                            //             'the air we breathe. Your body usually'
                            //             'prevents these germs from infecting your'
                            //             'lungs. But sometimes these germs can'
                            //             'overpower your immune system, even if'
                            //             'your health is generally good.'
                            //             'Pneumonia is classified according to the'
                            //             ' Types of germs that cause it and where'
                            //             'you got the infection.'
                            //             '          Community-acquired pneumonia'
                            //             '                - Bacteria                                                                - Bacteria-like organisms                                  - Fungi                                                             - Viruses.including COVID-19'
                            //             '                     Hospital-acquired pneumonia'
                            //             '                   Some people catch pneumonia during a hospital stay for another illness. Hospital- acquired pneumonia can be serious because the people who get it already sick.'
                            //             '          Health care-acquired pneumonia'
                            //             '                  It is a bacterial infection that occurs in people who live in long-term care facilities or who receive care in outpatient clinics.'
                            //
                            //       'Risk factors',
                            //     child: buildText3(
                            //       '- Children who are 2years old or younger\n- People who are age 65 or older\n- Being Hospitalized\n- Chronic disease\n- Smoking\n- Weakened or suppressed immune\n- system\n- Shortness of breath'

                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          endIndent: 15,
                          thickness: 2,
                          color: Color(0xff03045E),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text(
                              'Medical Corner provides pneumonia',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              'detection with accuracy up to 91%.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Result() ,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 125,
                                        width: 125,
                                        color: Colors.blue,
                                        child:  const Icon(
                                          Icons.image_search_outlined,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Pneumonia',
                                      style: TextStyle(
                                          color: Color(0xff004EC4),
                                          fontSize: 20
                                      ),
                                    ),
                                    const Text(
                                      'Detection',
                                      style: TextStyle(
                                          color: Color(0xff004EC4),
                                          fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 125,
                                      width: 125,
                                      color: Colors.blue,
                                      child: IconButton(
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => lastresult() ,
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.list,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Last  Result',
                                      style: TextStyle(
                                          color: Color(0xff004EC4),
                                          fontSize: 20
                                      ),
                                    ),
                                    const Text(
                                      '      ',
                                      style: TextStyle(
                                          color: Color(0xff004EC4),
                                          fontSize: 20
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          endIndent: 15,
                          thickness: 2,
                          color: Color(0xff03045E),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Preventation',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'seguisb',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const Text(
                          'To help prevent pneumonia:\n- Get vaccinated\n- Practice good hygiene\n- Do not smoke\n- Keep your immune system strong',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'seguisb',
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}