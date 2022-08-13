import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
class OpenCloseTextBox extends StatelessWidget {
  String text ;
  String title ;
  OpenCloseTextBox({Key? key,required this.text,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(

      listener: ( context, state) {  },
      builder: ( context,  state) {
        AppCubit cubit = AppCubit.get(context);
        var more = cubit.more;
        final max =  more? null : 1 ;
        return Column(
          children: [
            Row(
              children:  [
                 Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'seguisb',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    icon:  Icon(
                        more ? Icons.arrow_circle_up : Icons.arrow_circle_down
                    ),
                    onPressed: () {
                      cubit.getmore();
                    }
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 10
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.blue,
                child: Text (
                  text,
                  maxLines: max,
                  style: const TextStyle(
                    fontSize: 19,
                    fontFamily: 'seguisb',
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}
