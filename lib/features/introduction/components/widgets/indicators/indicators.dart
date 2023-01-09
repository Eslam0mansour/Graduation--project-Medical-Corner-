import 'package:flutter/material.dart';

class CustomPageIndicators extends StatefulWidget {
  final int maxPages;
  int currentIndex;
  final void Function(int v) onChangeCallback;
  CustomPageIndicators({
    Key? key,
    required this.maxPages,
    required this.onChangeCallback,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State<CustomPageIndicators> createState() => _CustomPageIndicatorsState();
}

class _CustomPageIndicatorsState extends State<CustomPageIndicators> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i != widget.maxPages; i++) ...[
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                widget.onChangeCallback.call(i);
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: i == widget.currentIndex
                      ? Colors.blue.shade500
                      : Colors.grey.shade500,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 16)
          ]
        ],
      ),
    );
  }
}
