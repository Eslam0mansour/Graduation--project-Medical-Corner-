import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/News/data_models/News.dart';
import 'package:intro_example/features/Nvdrawer/Nvdrawer.dart';
import 'package:intro_example/features/custom%20widgets/Disease_card.dart';
import 'package:intro_example/features/News/news_component.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          News mylist = AppCubit.get(context).news;
          return Scaffold(
            extendBodyBehindAppBar: true,
            drawer: Drawer(
              child: Nvdrawer(),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: SizedBox(
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
                  icon: SvgPicture.asset("assets/menu.svg"),
                );
              }),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
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
                                  onTap: () {
                                    Navigator.pushNamed(context, '/p');
                                  },
                                  child: DiseaseCard(
                                    image: 'Pneumonia.jpg',
                                    diseaseName: 'Pneumonia',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/b');
                                  },
                                  child: DiseaseCard(
                                    image: 'Brain Tumour.jpg',
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
                                  onTap: () {
                                    Navigator.pushNamed(context, '/h');
                                  },
                                  child: DiseaseCard(
                                    image: 'Heart Disease.jpg',
                                    diseaseName: 'Heart Disease',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/d');
                                  },
                                  child: DiseaseCard(
                                    image: 'Diabetes.jpg',
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
                                minimumSize: const Size(300, 60),
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return DraggableScrollableSheet(
                                        initialChildSize: 0.6,
                                        minChildSize: 0.5,
                                        maxChildSize: 0.8,
                                        builder: (_, controller) {
                                          return Container(
                                            decoration: const ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              )),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/home.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: ListView.separated(
                                              controller: controller,
                                              physics:
                                                  const BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics(),
                                              ),
                                              itemBuilder: (context, index) =>
                                                  ItemList(
                                                artical: mylist.articles![index],
                                              ),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                height: 10,
                                              ),
                                              itemCount: mylist.articles!.length,
                                            ),
                                          );
                                        },
                                      );
                                    });
                              },
                              child: const Text(
                                'Top Health News',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
