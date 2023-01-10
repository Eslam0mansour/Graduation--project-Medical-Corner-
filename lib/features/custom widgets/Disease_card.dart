import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
String image ;
String diseaseName ;
   DiseaseCard({Key? key,required this.image,required this.diseaseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 25,
        top: 20
      ),
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
             Image(
              image: AssetImage(
                  'assets/images/$image'
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
              child:  Text(
                diseaseName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
