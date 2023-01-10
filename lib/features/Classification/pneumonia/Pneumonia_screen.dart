import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/Classification/detection_lab.dart';
import 'package:intro_example/features/custom%20widgets/open_close_Text_box.dart';
import 'last_rsult_pneumonia.dart';

class PneumoniaScreen extends StatelessWidget {

  const PneumoniaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppState>(
      listener: ( context, state) { },
      builder: ( context,  state) {
        AppCubit cubit = AppCubit.get(context);
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
              'Pneumonia detection',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: 'seguisb',
                color: Color(0xff03045E),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 8
            ),
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
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
                        OpenCloseTextBox(
                          text: '- Chest pain when you breathe orcough \n- Confusion or changes in mental \n- awareness \n- Cough \n- Fatigue\n- Lower than normal body temperature\n- Nausea, vomiting or diarrhea\n- Shortness of breath',
                          title: 'Symptoms',
                          clr: Colors.blue,
                          txtclr: Colors.white,
                        ),
                        OpenCloseTextBox(
                          text: 'Many germs can cause pneumonia. The most common are bacteria and viruses in the air we breathe. Your body usually' 'prevents these germs from infecting your lungs. But sometimes these germs can overpower your immune system, even if' 'your health is generally good.' 'Pneumonia is classified according to the' ' Types of germs that cause it and where' 'you got the infection. Community-acquired pneumonia\n- Bacteria\n- Bacteria-like organisms\n- Fungi\n- Viruses.including COVID-19\nHospital-acquired pneumonia\nSome people catch pneumonia during a hospital stay for another illness. Hospital- acquired pneumonia can be serious because the people who get it already sick. Health care-acquired pneumonia It is a bacterial infection that occurs in people who live in long-term care facilities or who receive care in outpatient clinics.',
                          title: 'Causes',
                          clr: Colors.transparent,
                          txtclr: Colors.grey,
                        ),
                        OpenCloseTextBox(
                          text:'- Children who are 2years old or younger\n- People who are age 65 or older\n- Being Hospitalized\n- Chronic disease\n- Smoking\n- Weakened or suppressed immune\n- system\n- Shortness of breath',
                          title: 'Risk factors',
                          clr: Colors.red,
                          txtclr: Colors.white,
                        ),
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
                                        builder: (context) => Result(
                                          lottieAnimationName:'pneumonia',
                                          numResults: 1,
                                          threshold: 0.2,
                                          imageMean: 0.0,
                                          imageStd: 180.0,
                                        ) ,
                                      ),
                                    );
                                    cubit.clearImage();
                                    cubit.loadModel();
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
            ),
          ),
        );
      },
    );
  }
}