import 'package:flutter/material.dart';

import '../cubit/cuoit.dart';

Widget slider(context) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 20),
    child: Column(
      children: [
        const SizedBox(height: 5),
        Container(
          height: 0.5,
          color: AppCupit.get(context).mainColor,
        ),
        const SizedBox(height: 5)
      ],
    ),
  );
}

Widget itemList(dynamic artical, context) {
  try {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: (
                  artical['urlToImage'] == null || artical['urlToImage'] == ""
              )
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: artical['title'],
                      child: Image.asset(
                          'photos/6.png',
                          fit: BoxFit.cover,
                        ),
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: artical['title'],
                      child: Image.network(
                          artical['urlToImage'],
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (context, child, ImageChunkEvent ?loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                    ),
                  ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      "${artical['title']} ",
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      "${artical['publishedAt']}",
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
      },
    );
  } catch (erorr) {
    // ignore: avoid_print
    print("erorr in image is $erorr");
    return Container();
  }
}

Widget myList(List artical, context) {
  return ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, value) => itemList(artical[value], context),
    separatorBuilder: (context, value) => slider(context),
    itemCount: artical.length,
  );
}

void navigatorTo(context, widget)
=> Navigator.push(context, MaterialPageRoute(builder: (context)
    => widget));