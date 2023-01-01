
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpenCloseTextBox extends StatefulWidget {
  String text ;
  String title ;
  // late bool more ;
  bool more = false;
  Color clr ;
  Color? txtclr = Colors.white ;
  OpenCloseTextBox({
    Key? key,
    required this.text,
    required this.title ,
    // required this.more ,
    required this.clr ,
     this.txtclr ,
  }) : super(key: key);

  @override
  State<OpenCloseTextBox> createState() => _OpenCloseTextBoxState();
}

class _OpenCloseTextBoxState extends State<OpenCloseTextBox> {
  @override
  Widget build(BuildContext context) {
    final max =  widget.more ? null : 1 ;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'seguisb',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
                icon:  Icon(
                    widget.more ? Icons.arrow_circle_up : Icons.arrow_circle_down
                ),
                onPressed: () {
                  widget.more != widget.more ;
                  setState(() {
                    widget.more = !widget.more ;
                  });
                  // cubit.emit(GetMore());
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
            color: widget.clr,
            child: Text (
              widget.text,
              maxLines: max,
              style:  TextStyle(
                fontSize: 19,
                fontFamily: 'seguisb',
                color: widget.txtclr,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
