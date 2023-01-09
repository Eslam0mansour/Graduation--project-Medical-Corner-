import 'package:flutter/material.dart';
import 'package:intro_example/features/custom%20widgets/open_close_Text_box.dart';

class HeartDisease extends StatelessWidget {
  const HeartDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Heart Disease Prediction',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: 'seguisb',
            color: Color(0xff03045E),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  'Heart disease describes a range of conditions that affect your heart. Heart diseases include:\n- Blood vessel disease, such as coronary artery disease\n- Heart rhythm problems (arrhythmias)\n- Heart defects you are born with (congenital heart defects)\n- Heart valve disease\n- Disease of the heart muscle\n- Heart infection',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: Column(
                    children: [
                      OpenCloseTextBox(
                        title: 'Symptoms',
                        text:
                            'Heart disease symptoms depend on what type of heart disease you have. Symptoms of heart disease in your blood vessels A buildup of fatty plaques in your arteries, or atherosclerosis (ath-ur-o-skluh-ROE-sis) can damage your blood vessels and heart. Plaque buildup causes narrowed or blocked blood vessels that can lead to a heart attack, chest pain (angina) or stroke. Coronary artery disease symptoms may be different for men and women. For instance, men are more likely to have chest pain. Women are more likely to have other signs and symptoms along with chest discomfort, such as shortness of breath, nausea and extreme fatigue. Signs and symptoms can include: Chest pain, chest tightness, chest pressure and chest discomfort (angina) Shortness of breath Pain, numbness, weakness or coldness in your legs or arms if the blood vessels in those parts of your body are narrowed Pain in the neck, jaw, throat, upper abdomen or back',
                        clr: Colors.blue,
                        txtclr: Colors.white,
                      ),
                      OpenCloseTextBox(
                          text:
                              'Heart disease causes depend on your specific type of heart disease.\nThere are many different types of heart disease.\nCauses of coronary artery disease A buildup of fatty plaques in your arteries (atherosclerosis) is the most common cause of coronary artery disease. Unhealthy lifestyle habits, such as a poor diet, lack of exercise, being overweight and smoking, can lead to atherosclerosis. Causes of heart arrhythmia Common causes of arrhythmias or conditions that can lead to arrhythmias include:\nCoronary artery disease Diabetes Drug abuse Excessive use of alcohol or caffeine Heart defects you are born with (congenital heart defects) High blood pressure Smoking Some over-the-counter medications, prescription medications, dietary supplements and herbal remedies Stress Valvular heart disease Causes of congenital heart defects Congenital heart defects usually develop while a baby is in the womb. Heart defects can develop as the heart develops, about a month after conception, changing the flow of blood in the heart. Some medical conditions, medications and genes may play a role in causing heart defects. Heart defects can also develop in adults. As you age, your heart  structure can change, causing a heart defect. Causes of cardiomyopathy The cause of cardiomyopathy, a thickening or enlarging of the heart muscle, may depend on the type: Dilated cardiomyopathy. The cause of this most common type of cardiomyopathy often is unknown. The condition usually causes the left ventricle to widen. Dilated cardiomyopathy may be caused by reduced blood flow to the heart (ischemic heart disease) resulting from damage after a heart attack, infections, toxins and certain drugs, including those used to treat cancer. It may also be inherited from a parent. Hypertrophic cardiomyopathy. This type usually is passed down through families (inherited). It can also develop over time because of high blood pressure or aging. Restrictive cardiomyopathy. This least common type of cardiomyopathy, which causes the heart muscle to become rigid and less elastic, can occur for no known reason. Or it may be caused by diseases, such as connective tissue disorders or the buildup of abnormal proteins (amyloidosis). Causes of heart infection A heart infection, such as endocarditis, is caused when germs reach your heart muscle. The most common causes of heart infection include: Bacteria Viruses Parasites Causes of valvular heart disease Many things can cause diseases of your heart valves. You may be born with valvular disease, or the valves may be damaged by conditions such as: Rheumatic fever Infections (infectious endocarditis) Connective tissue disorders',
                          title: 'Causes',
                          clr: Colors.transparent,
                          txtclr: Colors.grey),
                      OpenCloseTextBox(
                          text:
                          'Risk factors for developing heart disease include: Age. Growing older increases your risk of damaged and narrowed arteries and a weakened or thickened heart muscle. Sex. Men are generally at greater risk of heart disease. The risk for women increases after menopause. Family history. A family history of heart disease increases your risk of coronary artery disease, especially if a parent developed it at an early age (before age 55 for a male relative, such as your brother or father, and 65 for a female relative, such as your mother or sister). Smoking. Nicotine tightens your blood vessels, and carbon monoxide can damage their inner lining, making them more susceptible to atherosclerosis. Heart attacks are more common in smokers than in nonsmokers. Poor diet. A diet that is high in fat, salt, sugar and cholesterol can contribute to the development of heart disease. High blood pressure. Uncontrolled high blood pressure can result in hardening and thickening of your arteries, narrowing the vessels through which blood flows. High blood cholesterol levels. High levels of cholesterol in your blood can increase the risk of plaque formation and atherosclerosis. Diabetes. Diabetes increases your risk of heart disease. Both conditions share similar risk factors, such as obesity and high blood pressure. Obesity. Excess weight typically worsens other heart disease risk factors. Physical inactivity. Lack of exercise also is associated with many forms of heart disease and some of its other risk factors as well. Stress. Unrelieved stress may damage your arteries and worsen other risk factors for heart disease. Poor dental health. It is important to brush and floss your teeth and gums often, and have regular dental checkups. If your teeth and gums aren not healthy, germs can enter your bloodstream and travel to your heart, causing endocarditis.',
                          title: 'Risk Factors',
                          clr: Colors.red,
                          txtclr: Colors.white),
                    ],
                  ),
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
                  children: [
                    const Text(
                      'Medical Corner provides Heart disease ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'prediction with accuracy up to 91%.',
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
                                child: const Icon(
                                  Icons.add_chart,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                            ),
                            const Text(
                              'Heart Disease',
                              style: TextStyle(
                                  color: Color(0xff004EC4), fontSize: 20),
                            ),
                            const Text(
                              'prediction',
                              style: TextStyle(
                                  color: Color(0xff004EC4), fontSize: 20),
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
                                onPressed: () {},
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
                                  color: Color(0xff004EC4), fontSize: 20),
                            ),
                            const Text(
                              '      ',
                              style: TextStyle(
                                  color: Color(0xff004EC4), fontSize: 20),
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
                  'Certain types of heart disease, such as heart defects, can not be prevented. However, the same lifestyle changes that can improve your heart disease can help you prevent it,\nincluding:\n- Don not smoke.\n- Control other health conditions, such as high blood pressure, high cholesterol and diabetes.\n- Exercise at least 30 minutes a day on most days of the week.\n-Eat a diet that is low in salt and saturated fat.\n- Maintain a healthy weight.\n- Reduce and manage stress.\n- Practice good hygiene.',
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
  }
}
