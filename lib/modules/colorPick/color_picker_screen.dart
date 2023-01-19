import 'package:flutter/material.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = [
    const Color(0xff79b473),
    const Color(0xff70a37f),
    const Color(0xff41658a),
    const Color(0xff414073),
    const Color(0xffcaffd0),
    const Color(0xffc9e4e7),
    const Color(0xffb4a0e5),
    const Color(0xffca3cff),
    const Color(0xff3e92cc),
    const Color(0xff2a628f),
    const Color(0xff18435a),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: CircleItem(
                isClickable: currentIndex == index,
                color: colors[index],
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CircleItem extends StatelessWidget {
  final bool isClickable;
  final Color color;

  const CircleItem({Key? key, required this.isClickable, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isClickable
        ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 20,
            backgroundColor: color,
          );
  }
}
