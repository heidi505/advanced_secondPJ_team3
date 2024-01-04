import 'package:flutter/material.dart';

class ChattingItem extends StatelessWidget {
  const ChattingItem({
    Key? key,
    required this.title,
    required this.imagePath,
    this.subTitle,
    this.multiItem,
  }) : super(key: key);


  final String title;
  final String imagePath;
  final String? subTitle;
  final Widget? multiItem;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          dense: true,
          leading: ClipRRect(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(title),
          subtitle: Text(subTitle!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                },
              ),
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
