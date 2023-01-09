import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/custom%20widgets/news_component.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'On Time Health News',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: 'seguisb',
                color: Colors.blueAccent,
              ),
            ),
          ),
          body: const Hel(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              cubit.hel = [];
              cubit.getHel();
              Future.delayed(const Duration(seconds: 1)).then(
                    (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text(
                         "The News Has Been Updated Successfully",
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class Hel extends StatelessWidget {
  const Hel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state){
          List mylist =AppCubit.get(context).hel;
          if ((mylist.isEmpty)) {
            return const Center(child: CircularProgressIndicator(),);
          }else {
            return MyList(artical: mylist);
          }
        }
    );
  }
}

class MyList extends StatelessWidget {
  final List artical;
    const MyList({Key? key, required this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, value) => ItemList(artical: artical[value],),
      separatorBuilder: (context, value) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Container(
              height: 0.5,
              color: Colors.blue,
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
      itemCount: artical.length,
    );
  }
}
