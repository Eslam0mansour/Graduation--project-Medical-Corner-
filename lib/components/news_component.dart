import 'package:flutter/material.dart';


class ItemList extends StatelessWidget {
  Map artical;
   ItemList( {Key? key, required this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
    );
  }
}

