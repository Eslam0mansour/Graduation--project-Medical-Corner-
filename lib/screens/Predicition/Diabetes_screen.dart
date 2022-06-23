import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Nvdrawer/Nvdrawer.dart';
class DiabetesScreen extends StatefulWidget {
  const DiabetesScreen({Key? key}) : super(key: key);

  @override
  State<DiabetesScreen> createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  bool more  = false;
  bool more2 = false;
  bool more3 = false;

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
          leading:Builder(builder: (context) {
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
                        'Diabetes',
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
                        'Diabetes mellitus refers to a group of diseases that affect how your body uses blood sugar (glucose). Glucose is vital to your health because it is an important source of energy for the cells that make up your muscles and tissues. It is also your brains main source of fuel.',
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
                          Row(
                            children:  [
                              const Text(
                                'Symptoms',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'seguisb',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              buildButton(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.blue,
                              child: buildText(
                                'Diabetes symptoms vary depending on how much your blood sugar is elevated.\nSome people, especially those with prediabetes or type 2 diabetes, may sometimes not experience symptoms. In type 1 diabetes, symptoms tend to come on quickly and be more severe. Some of the signs and symptoms of type 1 diabetes and type 2 diabetes are:\nIncreased thirst \nFrequent urination \nExtreme hunger \nUnexplained weight loss \nPresence of ketones in the urine (ketones are a byproduct of the breakdown of muscle and fat that happens when there is not enough available insulin)\n Fatigue\n Irritability\n Blurred vision \nSlow-healing sores \nFrequent infections, such as gums or skin infections and vaginal infections.',
                              ),
                            ),
                          ),
                          Row(
                            children:  [
                              const Text(
                                'Causes',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'seguisb',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              buildButton2(),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: buildText2(
                              'To understand diabetes, first you must understand how glucose is normally processed in the body. How insulin works Insulin is a hormone that comes from a gland situated behind and below the stomach (pancreas). The pancreas secretes insulin into the bloodstream. The insulin circulates, enabling sugar to enter your cells. Insulin lowers the amount of sugar in your bloodstream. As your blood sugar level drops, so does the secretion of insulin from your pancreas. The role of glucose Glucose — a sugar — is a source of energy for the cells that make up muscles and other tissues. Glucose comes from two major sources: food and your liver. Sugar is absorbed into the bloodstream, where it enters cells with the help of insulin. Your liver stores and makes glucose. When your glucose levels are low, such as when you haven not eaten in a while, the liver breaks down stored glycogen into glucose to keep your glucose level within a normal range. Causes of prediabetes and type 2 diabetes In prediabetes — which can lead to type 2 diabetes — and in type 2 diabetes, your cells become resistant to the action of insulin, and your pancreas is unable to make enough insulin to overcome this resistance. Instead of moving into your cells where it is needed for energy, sugar builds up in your bloodstream. Exactly why this happens is uncertain, although it is believed that genetic and environmental factors play a role in the development of type 2 diabetes too. Being overweight is strongly linked to the development of type 2 diabetes, but not everyone with type 2 is overweight.',

                            ),
                          ),
                          Row(
                            children:  [
                              const Text(
                                'Risk factors',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'seguisb',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              buildButton3(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.red,
                              child: buildText3(
                                ' Researchers don not fully understand why some people develop prediabetes and type 2 diabetes and others do not. It is clear that certain factors increase the risk, however, including: Weight. The more fatty tissue you have, the more resistant your cells become to insulin. Inactivity. The less active you are, the greater your risk. Physical activity helps you control your weight, uses up glucose as energy and makes your cells more sensitive to insulin. Family history. Your risk increases if a parent or sibling has type 2 diabetes. Race or ethnicity. Although it is unclear why, certain people — including Black, Hispanic, American Indian and Asian American people — are at higher risk. Age. Your risk increases as you get older. This may be because you tend to exercise less, lose muscle mass and gain weight as you age. But type 2 diabetes is also increasing among children, adolescents and younger adults. Gestational diabetes. If you developed gestational diabetes when you were pregnant, your risk of developing prediabetes and type 2 diabetes increases. If you gave birth to a baby weighing more than 9 pounds (4 kilograms), you are also at risk of type 2 diabetes. Polycystic ovary syndrome. For women, having polycystic ovary syndrome — a common condition characterized by irregular menstrual periods, excess hair growth and obesity — increases the risk of diabetes. High blood pressure. Having blood pressure over 140/90 millimeters of mercury (mm Hg) is linked to an increased risk of type 2 diabetes. Abnormal cholesterol and triglyceride levels. If you have low levels of high-density lipoprotein (HDL), or "good," cholesterol, your risk of type 2 diabetes is higher. Triglycerides are another type of fat carried in the blood. People with high levels of triglycerides have an increased risk of type 2 diabetes. Your doctor can let you know what your cholesterol and triglyceride levels are.',
                              ),
                            ),
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
                            'Medical Corner provides Diabetes prediction ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            'with accuracy up to 91%.',
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
                                    onTap: () {},
                                    child: Container(
                                      height: 125,
                                      width: 125,
                                      color: Colors.blue,
                                      child:  const Icon(
                                        Icons.add_chart,
                                        color: Colors.white,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Diabetes',
                                    style: TextStyle(
                                        color: Color(0xff004EC4),
                                        fontSize: 20
                                    ),
                                  ),
                                  const Text(
                                    'prediction',
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
                                      onPressed: (){},
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
                        'Type 1 diabetes can not be prevented. However, the same healthy lifestyle choices that help treat prediabetes, type 2 diabetes and gestational diabetes can also help\nprevent them:\n- Eat healthy foods. Choose foods lower in fat and calories and higher in fiber. Focus on fruits, vegetables and whole grains. Strive for variety to prevent boredom.\n- Get more physical activity. Aim for about 30 minutes of moderate aerobic activity on most days of the week, or at least 150 minutes of moderate aerobic activity a week.\n- Lose excess pounds. If you are overweight, losing even 7% of your body weight — for example, 14 pounds (6.4 kilograms) if you weigh 200 pounds (90.7 kilograms) — can reduce the risk of diabetes.\n- Don not try to lose weight during pregnancy, however. Talk to your doctor about how much weight is healthy for you to gain during pregnancy.\n- To keep your weight in a healthy range, focus on permanent changes to your eating and exercise habits. Motivate yourself by remembering the benefits of losing weight, such as a healthier heart, more energy and improved self-esteem.',
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
      ),
    );
  }
  Widget buildButton() => IconButton(
    icon:  Icon(
        more ? Icons.arrow_circle_up : Icons.arrow_circle_down
    ),
    onPressed: () => setState(() => more = !more ),
  );
  Widget buildButton2() => IconButton(
    icon:  Icon(
        more2 ? Icons.arrow_circle_up : Icons.arrow_circle_down  ),
    onPressed: () => setState(() => more2 = !more2 ),
  );
  Widget buildButton3() => IconButton(
    icon:  Icon(
        more3 ? Icons.arrow_circle_up : Icons.arrow_circle_down  ),
    onPressed: () => setState(() => more3 = !more3 ),
  );
  Widget buildText ( String text ) {
    final max =  more? null : 1 ;
    return Text (
      text,
      maxLines: max,
      style: const TextStyle(
        fontSize: 19,
        fontFamily: 'seguisb',
        color: Colors.white,
      ),
    );
  }
  Widget buildText2 ( String text ) {
    final max =  more2? null : 1 ;
    return Text (
      text,
      maxLines: max,
      style: const TextStyle(
        fontSize: 19,
        fontFamily: 'seguisb',
        color: Colors.grey,
      ),
    );
  }
  Widget buildText3 ( String text ) {
    final max =  more3? null : 1 ;
    return Text (
      text,
      maxLines: max,
      style: const TextStyle(
        fontSize: 19,
        fontFamily: 'seguisb',
        color: Colors.white,
      ),
    );
  }
}
